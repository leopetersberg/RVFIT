package org.example;

import org.camunda.bpm.engine.delegate.DelegateExecution;
import org.camunda.bpm.engine.delegate.DelegateTask;
import org.camunda.bpm.engine.delegate.ExecutionListener;
import org.camunda.bpm.engine.delegate.TaskListener;

public class EndDokumentationTrainingDelegate implements TaskListener {
    @Override
    public void notify(DelegateTask delegateTask) {
        delegateTask.setVariable("anzahlTrainings",
                (int)delegateTask.getVariable("anzahlTrainings") + 1);
    }
}
