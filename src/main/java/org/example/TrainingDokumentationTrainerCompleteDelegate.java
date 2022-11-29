package org.example;

import org.camunda.bpm.engine.delegate.DelegateTask;
import org.camunda.bpm.engine.delegate.TaskListener;
import org.camunda.spin.impl.json.jackson.JacksonJsonNode;
import org.camunda.spin.json.SpinJsonNode;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TrainingDokumentationTrainerCompleteDelegate implements TaskListener {

    @Override
    public void notify(DelegateTask delegateTask) {
        try {
            String Datum = (String) delegateTask.getVariable("datum");
            SpinJsonNode signatureNode = (JacksonJsonNode) delegateTask.getVariable("signatureBase64JSON");
            String Prozess_ID = (String) delegateTask.getProcessInstanceId();

            String signatureBase64 = signatureNode.jsonPath("$.signatureBase64").stringValue();

            //aktuelle Trainingsmethode auslesen
            String sqlTrainingsmethode = "SELECT Trainingsvariante_aktuell FROM Prozess WHERE Prozess_ID = ?";
            PreparedStatement stmtTrainingsmethode = DBConnection.getConnection().prepareStatement(sqlTrainingsmethode);
            stmtTrainingsmethode.setString(1, Prozess_ID);
            ResultSet rsTrainingsmethode = stmtTrainingsmethode.executeQuery();
            String Trainingsmethode = rsTrainingsmethode.getString("Trainingsvariante_aktuell");

            //Training in DB speichern
            String sqlInsertTraining = "INSERT INTO Training (Prozess_ID, Trainingsdatum, Trainingsvariante, Unterschrift_Trainer) VALUES (?, ?, ?, ?)";
            PreparedStatement stmtInsertTraining = DBConnection.getConnection().prepareStatement(sqlInsertTraining);
            stmtInsertTraining.setString(1, Prozess_ID);
            stmtInsertTraining.setString(2, Datum);
            stmtInsertTraining.setString(3, Trainingsmethode);
            stmtInsertTraining.setString(4, signatureBase64);
            stmtInsertTraining.executeUpdate();



            //Variable löschen
            delegateTask.removeVariable("signatureBase64JSON");
            delegateTask.removeVariable("datum");

            CamVariableMgmt.updateCamVariables(delegateTask, Prozess_ID);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
