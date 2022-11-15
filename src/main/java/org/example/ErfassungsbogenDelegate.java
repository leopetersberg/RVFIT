package org.example;

import org.camunda.bpm.engine.delegate.*;

public class ErfassungsbogenDelegate implements TaskListener {

    @Override
    public void notify(DelegateTask delegateTask) {
        delegateTask.setVariable("anzahlTrainings", 0);
    }
}
