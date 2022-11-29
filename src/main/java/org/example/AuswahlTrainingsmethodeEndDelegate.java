package org.example;

import org.camunda.bpm.engine.delegate.DelegateExecution;
import org.camunda.bpm.engine.delegate.ExecutionListener;

import java.sql.PreparedStatement;

public class AuswahlTrainingsmethodeEndDelegate implements ExecutionListener {

    @Override
    public void notify(DelegateExecution execution) throws Exception {
        String trainingsmethode = (String) execution.getVariable("Trainingsvariante");
        String prozessID = execution.getProcessInstanceId();

        //Triningmethode in DB speichern
        String sqlUpdateProzess = "UPDATE Prozess SET Trainingsvariante_aktuell = ? WHERE Prozess_ID = ?";
        PreparedStatement stmtUpdateProzess = DBConnection.getConnection().prepareStatement(sqlUpdateProzess);
        stmtUpdateProzess.setString(1, trainingsmethode);
        stmtUpdateProzess.setString(2, prozessID);
        stmtUpdateProzess.executeUpdate();

        //Variable löschen
        execution.removeVariable("Trainingsvariante");
        execution.removeVariable("Koerperfettmasse");
        execution.removeVariable("Skelettmuskelmasse");

        CamVariableMgmt.updateCamVariables(execution, prozessID);
    }
}
