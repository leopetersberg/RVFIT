package org.example.reporting;

import org.camunda.bpm.engine.delegate.DelegateTask;
import org.camunda.bpm.engine.delegate.TaskListener;
import org.camunda.spin.Spin;
import org.camunda.spin.json.SpinJsonNode;
import org.example.DBConnection;
import spinjar.com.fasterxml.jackson.databind.node.ArrayNode;
import spinjar.com.fasterxml.jackson.databind.node.JsonNodeFactory;
import spinjar.com.fasterxml.jackson.databind.node.ObjectNode;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class AnzeigenRepotingStartDelegate implements TaskListener {
    @Override
    public void notify(DelegateTask delegateTask) {
        try {
            setVerteilungTVGesamt(delegateTask);
            setdauerUndAnzahlTrainings(delegateTask);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void setVerteilungTVGesamt(DelegateTask delegateTask) throws SQLException {
        Integer AnzahlKraftZirkel = null;
        Integer AnzahlKraftAusdauerZirkel = null;

        String sql = "SELECT count(Prozess_ID), Trainingsvariante_aktuell\n" +
                "FROM Prozess\n" +
                "GROUP BY Trainingsvariante_aktuell";
        PreparedStatement stmt = DBConnection.getConnection().prepareStatement(sql);
        ResultSet rsTrainingsvarianten = stmt.executeQuery();
        while (rsTrainingsvarianten.next()) {
            if (rsTrainingsvarianten.getString("Trainingsvariante_aktuell") == null ) {
                continue;
            } else if(rsTrainingsvarianten.getString("Trainingsvariante_aktuell").equals("Kraft-Zirkel") ) {
                AnzahlKraftZirkel = rsTrainingsvarianten.getInt("count(Prozess_ID)");
            } else if (rsTrainingsvarianten.getString("Trainingsvariante_aktuell").equals("Kraft-Ausdauer-Zirkel") )  {
                AnzahlKraftAusdauerZirkel =  rsTrainingsvarianten.getInt("count(Prozess_ID)");
            }
        }

        //JSON erstellen
        ObjectNode objectNodeverteilungTVGesamt = JsonNodeFactory.instance.objectNode();

        //labels
        ArrayNode labelsArray = objectNodeverteilungTVGesamt.putArray("labels");
        labelsArray.add("Kraft-Zirkel");
        labelsArray.add("Kraft-Ausdauer-Zirkel");

        //datasets
        ArrayNode datasetsArray = objectNodeverteilungTVGesamt.putArray("datasets");
        ObjectNode dataset = JsonNodeFactory.instance.objectNode();
        datasetsArray.add(dataset);
        //datasets-label
        dataset.put("label", "Patienten");
        //datasets-data
        ArrayNode dataArray = dataset.putArray("data");
        dataArray.add(AnzahlKraftZirkel);
        dataArray.add(AnzahlKraftAusdauerZirkel);
        //datasets-borderWidth
        dataset.put("borderWidth", 1);
        //datasets-backgroundColor
        ArrayNode backgroundColorArray = dataset.putArray("backgroundColor");
        backgroundColorArray.add("#6982A299");
        backgroundColorArray.add("#D2DB2D99");
        //datasets-borderColor
        dataset.put("borderColor", "#AAAAAA");

        SpinJsonNode spinJsonNode = Spin.JSON(objectNodeverteilungTVGesamt.toString());
        delegateTask.setVariable("VerteilungTVGesamt", spinJsonNode);
    }


    private void setdauerUndAnzahlTrainings(DelegateTask delegateTask) throws  SQLException {
        String sql ="select Testtag_zeit, count(T.Trainings_ID) as anzahlTrainings, Vorname, Nachname, Geburtsdatum, Trainingsvariante_aktuell\n" +
                "      From Prozess P\n" +
                "        Join Untersuchung U on P.Prozess_ID = U.Prozess_ID\n" +
                "        join Training T on U.Prozess_ID = T.Prozess_ID\n" +
                "        join Kunde K on P.Kunden_ID = K.Kunden_ID\n" +
                "      WHERE Typ = 1\n" +
                "      GROUP BY T.Prozess_ID";
        PreparedStatement stmt = DBConnection.getConnection().prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        ObjectNode objectNodeDauerUndAnzahlTrainings = JsonNodeFactory.instance.objectNode();
        ArrayNode datasetsArray = objectNodeDauerUndAnzahlTrainings.putArray("datasets");
        ObjectNode dataset = JsonNodeFactory.instance.objectNode();
        datasetsArray.add(dataset);
        dataset.put("label", "Anzahl Trainings");
        dataset.put("backgroundColor", "#6982A299");
        ArrayNode dataArray = dataset.putArray("data");
        ArrayNode backgroundColorArray = objectNodeDauerUndAnzahlTrainings.putArray("backgroundColor");
        while (rs.next()) {
            ObjectNode data = JsonNodeFactory.instance.objectNode();
            dataArray.add(data);
            data.put("y", rs.getInt("anzahlTrainings"));
            data.put("x", rs.getString("Testtag_zeit"));
            data.put("r", 5);
            data.put("label", rs.getString("vorname") + " " + rs.getString("nachname")
                    + " (*" + rs.getString("Geburtsdatum") + ") " + rs.getString("Trainingsvariante_aktuell"));
        }
        ObjectNode datasetOptimal = JsonNodeFactory.instance.objectNode();
        datasetsArray.add(datasetOptimal);
        datasetOptimal.put("label", "Optimal (2x Training pro Woche)");
        datasetOptimal.put("type", "line");
        datasetOptimal.put("backgroundColor", "#D2DB2D99");
        ArrayNode dataOptimalArray = datasetOptimal.putArray("data");
        for (int i = 0; i <= 24; i++) {
            ObjectNode dataOptimal = JsonNodeFactory.instance.objectNode();
            dataOptimalArray.add(dataOptimal);
            dataOptimal.put("y", i);
            double anzahlVergangeneTage = (Integer) i * 3.5;
            LocalDate date = LocalDate.now().minusDays((long) anzahlVergangeneTage);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            dataOptimal.put("x",  date.format(formatter));
        }

        SpinJsonNode spinJsonNode = Spin.JSON(objectNodeDauerUndAnzahlTrainings.toString());
        delegateTask.setVariable("dauerUndAnzahlTrainings", spinJsonNode);

    }


}
