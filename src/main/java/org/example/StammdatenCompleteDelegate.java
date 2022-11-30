package org.example;

import camundajar.impl.scala.Int;
import org.camunda.bpm.engine.delegate.DelegateTask;
import org.camunda.bpm.engine.delegate.TaskListener;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StammdatenCompleteDelegate implements TaskListener {
    @Override
    public void notify(DelegateTask delegateTask) {
        String vorname = (String) delegateTask.getVariable("vorname");
        String nachname = (String) delegateTask.getVariable("nachname");
        Integer groesse = (Integer) delegateTask.getVariable("groesse");
        String geburtsdatum = (String) delegateTask.getVariable("geburtsdatum");
        String geschlecht = (String) delegateTask.getVariable("geschlecht");
        String Prozess_ID = (String) delegateTask.getProcessInstanceId();
        System.out.println("Prozess_ID: " + Prozess_ID);

        Integer Kunden_id = null;

        // prüfen, ob es den Kunden schon gibt
        try {
            String sql = "SELECT Kunden_ID FROM kunde WHERE vorname = ? AND nachname = ? And geburtsdatum = ?";
            PreparedStatement stmt = DBConnection.getConnection()
                    .prepareStatement(sql);
            stmt.setString(1, vorname);
            stmt.setString(2, nachname);
            stmt.setString(3, geburtsdatum);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Kunde existiert bereits
                 Kunden_id = (Integer) rs.getInt("Kunden_ID");

                 //groesse und geschlecht updaten
                String sqlUpdateKunde = "UPDATE kunde SET groesse_cm = ?, geschlecht = ? WHERE Kunden_ID = ?";
                stmt = DBConnection.getConnection().prepareStatement(sqlUpdateKunde);
                stmt.setInt(1, groesse);
                stmt.setString(2, geschlecht);
                stmt.setInt(3, Kunden_id);
                stmt.executeUpdate();

            } else {
                // Kunde existiert noch nicht
                String sqlInsertKunde = "INSERT INTO kunde (vorname, nachname, groesse_cm, geburtsdatum, geschlecht) VALUES (?, ?, ?, ?, ?)";
                stmt = DBConnection.getConnection().prepareStatement(sqlInsertKunde);
                stmt.setString(1, vorname);
                stmt.setString(2, nachname);
                stmt.setInt(3, groesse);
                stmt.setString(4, geburtsdatum);
                stmt.setString(5, geschlecht);
                stmt.executeUpdate();


                // Kunden_ID holen
                String sqlSelectKundenID = "SELECT Kunden_ID FROM kunde WHERE vorname = ? AND nachname = ? And geburtsdatum = ?";
                stmt = DBConnection.getConnection().prepareStatement(sqlSelectKundenID);
                stmt.setString(1, vorname);
                stmt.setString(2, nachname);
                stmt.setString(3, geburtsdatum);
                rs = stmt.executeQuery();
                rs.next();
                Kunden_id = (Integer) rs.getInt("Kunden_ID");

            }

            //Insert Prozess in Tabelle Prozess
            String sqlInsertProzess = "INSERT INTO prozess (Prozess_ID, Kunden_ID, Status) VALUES (?, ?, ?)";
            stmt = DBConnection.getConnection().prepareStatement(sqlInsertProzess);
            stmt.setString(1, Prozess_ID);
            stmt.setInt(2, Kunden_id);
            stmt.setString(3, "aktiv");
            stmt.executeUpdate();



            //variabeln löschen
            delegateTask.removeVariable("vorname");
            delegateTask.removeVariable("nachname");
            delegateTask.removeVariable("groesse");
            delegateTask.removeVariable("geburtsdatum");
            delegateTask.removeVariable("geschlecht");


            CamVariableMgmt.updateCamVariables();

        } catch (Exception e) {
            System.out.println("Fehler: " + e.getMessage());
        }


    }

}
