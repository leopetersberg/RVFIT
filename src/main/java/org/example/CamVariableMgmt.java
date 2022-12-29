package org.example;

import org.camunda.bpm.engine.delegate.VariableScope;
import org.camunda.spin.Spin;
import org.camunda.spin.json.SpinJsonNode;
import spinjar.com.fasterxml.jackson.databind.node.ArrayNode;
import spinjar.com.fasterxml.jackson.databind.node.JsonNodeFactory;
import spinjar.com.fasterxml.jackson.databind.node.ObjectNode;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CamVariableMgmt {

    public static void updateCamVariables(VariableScope variableScope, String Prozess_ID) throws Exception {
        try {

            //Anzahl Trainings auslesen
            String sqlAnzahlTrainings = "SELECT COUNT(Trainings_ID) AS Anzahl_Trainings FROM Training WHERE Unterschrift_Kunde IS NOT NULL AND Prozess_ID = ?";
            PreparedStatement stmtAnzahlTrainings = DBConnection.getConnection().prepareStatement(sqlAnzahlTrainings);
            stmtAnzahlTrainings.setString(1, Prozess_ID);
            ResultSet rsAnzahlTrainings = stmtAnzahlTrainings.executeQuery();
            rsAnzahlTrainings.next();
            int anzahlTrainings = rsAnzahlTrainings.getInt("Anzahl_Trainings");

            //Anzahl Trainings in Camunda Variable speichern
            variableScope.setVariable("anzahlTrainings", anzahlTrainings);

            updateZusammenfassung(variableScope, Prozess_ID);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void updateZusammenfassung(VariableScope variableScope, String Prozess_ID) throws Exception{
        //Vorname
        //Nachname
        //Größe
        //Geburtsdatum
        //Geschlecht
        //Trainingsvariante_aktuell

        String sqlTeilnehmer = "SELECT Vorname, Nachname, Groesse_cm, Geburtsdatum, Geschlecht, Trainingsvariante_aktuell\n" +
                "               FROM Prozess\n" +
                "               Join Kunde K on Prozess.Kunden_ID = K.Kunden_ID\n" +
                "               WHERE Prozess_ID = ?";
        PreparedStatement stmtTeilnehmer = DBConnection.getConnection().prepareStatement(sqlTeilnehmer);
        stmtTeilnehmer.setString(1, Prozess_ID);
        ResultSet rsTeilnehmer = stmtTeilnehmer.executeQuery();
        rsTeilnehmer.next();

        String vorname = rsTeilnehmer.getString("Vorname");
        String nachname = rsTeilnehmer.getString("Nachname");
        int groesse = rsTeilnehmer.getInt("Groesse_cm");
        String geburtsdatum = rsTeilnehmer.getString("Geburtsdatum");
        String geschlecht = rsTeilnehmer.getString("Geschlecht");
        String trainingsvariante = rsTeilnehmer.getString("Trainingsvariante_aktuell");

        ObjectNode objectNode = JsonNodeFactory.instance.objectNode();
        objectNode.put("vorname", vorname);
        objectNode.put("nachname", nachname);
        objectNode.put("groesse", groesse);
        objectNode.put("geburtsdatum", geburtsdatum);
        objectNode.put("geschlecht", geschlecht);
        objectNode.put("trainingsvariante", trainingsvariante);

        ArrayNode nodesUntersuchungen = objectNode.putArray("untersuchungen");

        String sqlUntersuchungen = "SELECT Typ, Testtag_zeit, Gewicht_kg, Skelettmuskelmasse_kg, Koerperfettmassekg, BMI, KoerperfettProz\n" +
                "                   FROM Untersuchung\n" +
                "                   WHERE Prozess_ID = ?";
        PreparedStatement stmtUntersuchungen = DBConnection.getConnection().prepareStatement(sqlUntersuchungen);
        stmtUntersuchungen.setString(1, Prozess_ID);
        ResultSet rsUntersuchungen = stmtUntersuchungen.executeQuery();
        while (rsUntersuchungen.next()){
            String typ = rsUntersuchungen.getString("Typ");
            String testtag_zeit = rsUntersuchungen.getString("Testtag_zeit");
            double gewicht = rsUntersuchungen.getDouble("Gewicht_kg");
            double skelettmuskelmasse = rsUntersuchungen.getDouble("Skelettmuskelmasse_kg");
            double koerperfettmasse = rsUntersuchungen.getDouble("Koerperfettmassekg");
            double bmi = rsUntersuchungen.getDouble("BMI");
            double koerperfettProz = rsUntersuchungen.getDouble("KoerperfettProz");

            ObjectNode jsonNodeUntersuchung = JsonNodeFactory.instance.objectNode();
            jsonNodeUntersuchung.put("typ", typ);
            jsonNodeUntersuchung.put("testtag_zeit", testtag_zeit);
            jsonNodeUntersuchung.put("gewicht", gewicht);
            jsonNodeUntersuchung.put("skelettmuskelmasse", skelettmuskelmasse);
            jsonNodeUntersuchung.put("koerperfettmasse", koerperfettmasse);
            jsonNodeUntersuchung.put("bmi", bmi);
            jsonNodeUntersuchung.put("koerperfettProz", koerperfettProz);

            nodesUntersuchungen.add(jsonNodeUntersuchung);
        }


        ArrayNode nodesTrainings = objectNode.putArray("trainings");

        String sqlSelectTrainings = "SELECT Trainingsdatum, Trainingsvariante, Unterschrift_Trainer, Unterschrift_Kunde " +
                                    "FROM Training "+
                                    "WHERE Prozess_ID = ?";
        PreparedStatement stmtSelectTrainings = DBConnection.getConnection().prepareStatement(sqlSelectTrainings);
        stmtSelectTrainings.setString(1, Prozess_ID);
        ResultSet rsSelectTrainings = stmtSelectTrainings.executeQuery();
        while (rsSelectTrainings.next()){
            String trainingsdatum = rsSelectTrainings.getString("Trainingsdatum");
            String trainingsvarianteTraining = rsSelectTrainings.getString("Trainingsvariante");
            String unterschrift_trainer = rsSelectTrainings.getString("Unterschrift_Trainer");
            String unterschrift_kunde = rsSelectTrainings.getString("Unterschrift_Kunde");

            ObjectNode jsonNodeTraining = JsonNodeFactory.instance.objectNode();
            jsonNodeTraining.put("trainingsdatum", trainingsdatum);
            jsonNodeTraining.put("trainingsvariante", trainingsvarianteTraining);
            jsonNodeTraining.put("unterschrift_trainer", unterschrift_trainer);
            jsonNodeTraining.put("unterschrift_kunde", unterschrift_kunde);

            nodesTrainings.add(jsonNodeTraining);
        }

        SpinJsonNode spinJsonNode = Spin.JSON(objectNode.toString());
        variableScope.setVariable("zusammenfassung", spinJsonNode);


        //Datum
        //Trainingsvariante
        //Unterschrift Trainer
        //Unterschrift Kunde
    }

}

