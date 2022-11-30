package org.example;

import java.sql.*;

import org.camunda.bpm.engine.delegate.DelegateTask;
import org.camunda.bpm.engine.delegate.TaskListener;

public class UntersuchungCompleteDelegate implements TaskListener {
    @Override
    public void notify(DelegateTask delegateTask) {
        try {
            String Prozess_ID = (String) delegateTask.getProcessInstanceId();
            String datum = (String) delegateTask.getVariable("datum");
            Double gewicht = (Double) delegateTask.getVariable("gewicht");
            Double skelettmuskelmasse = (Double) delegateTask.getVariable("Skelettmuskelmasse");
            Double koerperfettmasse = (Double) delegateTask.getVariable("Koerperfettmasse");

            //größe auslesen
            String sqlgroeße = "SELECT groesse_cm FROM Kunde WHERE Kunden_ID = (SELECT Kunden_ID FROM Prozess WHERE Prozess_ID = ?)";
            PreparedStatement stmt = DBConnection.getConnection().prepareStatement(sqlgroeße);
            stmt.setString(1, Prozess_ID);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            Integer groesseCm = (Integer) rs.getInt("groesse_cm");
            Double groesseM = groesseCm / 100.0;

            Double bmi = (Double) gewicht / (groesseM * groesseM);
            Double koerperfettanteil = (Double) koerperfettmasse / (gewicht);

            //Anzal untersuchungen ermitteln
            String sqlAnzahlUntersuchungen = "SELECT COUNT(*) FROM untersuchung WHERE Prozess_ID = ?";
            stmt = DBConnection.getConnection().prepareStatement(sqlAnzahlUntersuchungen);
            stmt.setString(1, Prozess_ID);
            rs = stmt.executeQuery();
            rs.next();
            Integer anzahlUntersuchung = rs.getInt(1) +1;

            String sqlInsertUntersuchung = "INSERT INTO untersuchung (Prozess_ID, Typ, Testtag_zeit, Gewicht_kg, Skelettmuskelmasse_kg, koerperfettmassekg, BMI, KoerperfettProz) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = DBConnection.getConnection().prepareStatement(sqlInsertUntersuchung);
            stmt.setString(1, Prozess_ID);
            stmt.setInt(2, anzahlUntersuchung);
            stmt.setString(3, datum);
            stmt.setDouble(4, gewicht);
            stmt.setDouble(5, skelettmuskelmasse);
            stmt.setDouble(6, koerperfettmasse);
            stmt.setDouble(7, bmi);
            stmt.setDouble(8, koerperfettanteil);
            stmt.executeUpdate();

            //variablen löschen
            delegateTask.removeVariable("datum");
            delegateTask.removeVariable("gewicht");

            CamVariableMgmt.updateCamVariables();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
