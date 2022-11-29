package org.example;

import org.camunda.bpm.engine.delegate.VariableScope;

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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

