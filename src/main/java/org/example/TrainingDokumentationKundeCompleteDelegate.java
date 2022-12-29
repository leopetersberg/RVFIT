package org.example;


import org.camunda.bpm.engine.delegate.DelegateTask;
import org.camunda.bpm.engine.delegate.TaskListener;
import org.camunda.spin.json.SpinJsonNode;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TrainingDokumentationKundeCompleteDelegate implements TaskListener {

    @Override
    public void notify(DelegateTask delegateTask) {

        try {
            SpinJsonNode signatureNode = (SpinJsonNode) delegateTask.getVariable("signatureBase64JSON");
            String signatureBase64 = signatureNode.jsonPath("$.signatureBase64").stringValue();
            String prozessID = (String) delegateTask.getProcessInstanceId();

            //TrainingsID mit höchster TrainingsID auslesen
            String sqlTrainingsID = "SELECT MAX(Trainings_ID) AS Trainings_ID FROM Training Where Prozess_ID = ?";
            PreparedStatement stmtTrainingsID = DBConnection.getConnection().prepareStatement(sqlTrainingsID);
            stmtTrainingsID.setString(1, prozessID);
            ResultSet rsTrainingsID = stmtTrainingsID.executeQuery();
            rsTrainingsID.next();
            int TrainingsID = rsTrainingsID.getInt("Trainings_ID");


            //Signature in DB speichern
            String sqlInsertSignature = "UPDATE Training SET Unterschrift_Kunde = ? WHERE Trainings_ID = ?";
            PreparedStatement stmtInsertSignature = DBConnection.getConnection().prepareStatement(sqlInsertSignature);
            stmtInsertSignature.setString(1, signatureBase64);
            stmtInsertSignature.setInt(2, TrainingsID);
            stmtInsertSignature.executeUpdate();


            //Variable löschen
            delegateTask.removeVariable("signatureBase64JSON");
            delegateTask.removeVariable("datum");


            CamVariableMgmt.updateCamVariables(delegateTask, prozessID);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
