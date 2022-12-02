function extractZusammenfassung(jsonZusammenfassung) {

    var patient = jsonZusammenfassung.vorname + " " + jsonZusammenfassung.nachname + " *" + jsonZusammenfassung.geburtsdatum;
    document.getElementById("patient").innerHTML = patient

    if (document.getElementById("untersuchung")) {
        var HTMLUntersuchung = "";
        var untersuchungNo = jsonZusammenfassung.untersuchungen.length + 1;
        if (untersuchungNo = 1) {
            HTMLUntersuchung = "Bitte geben sie die Daten der Eingangsuntersuchung ein:";
        } else if (untersuchungNo = 2) {
            HTMLUntersuchung = "Bitte geben sie die Daten des 1. Check-ups ein:";
        } else {
            HTMLUntersuchung = "Bitte geben sie die Daten des 2. Check-ups ein:";
        }
        document.getElementById("untersuchung").innerHTML = HTMLUntersuchung;
    }

    if (document.getElementById("text")) {
        var HTMLText = "";
        var date = jsonZusammenfassung.trainings[jsonZusammenfassung.trainings.length -1].trainingsdatum
        HTMLText = "Hiermit bestäige ich, dass ich das Training am " + date + " Ordnungsgemäß durchgeführt habe."
        document.getElementById("text").innerHTML = HTMLText;
    }


    var htmlZusammenfassung = "";
    htmlZusammenfassung += "<h2>Übersicht</h2>"
    htmlZusammenfassung += "<table class='table table-striped'>";
    htmlZusammenfassung += "<tr><th>Vorname</th><td>" + jsonZusammenfassung.vorname + "</td></tr>";
    htmlZusammenfassung += "<tr><th>Nachname</th><td>" + jsonZusammenfassung.nachname + "</td></tr>";
    htmlZusammenfassung += "<tr><th>Geburtsdatum</th><td>" + jsonZusammenfassung.geburtsdatum + "</td></tr>";
    htmlZusammenfassung += "<tr><th>Größe</th><td>" + jsonZusammenfassung.groesse + "</td></tr>";
    htmlZusammenfassung += "<tr><th>Geschlecht</th><td>" + jsonZusammenfassung.geschlecht + "</td></tr>";
    htmlZusammenfassung += "<tr><th>Aktuelle Trainingsvariante</th><td>" + jsonZusammenfassung.trainingsvariante + "</td></tr>";
    htmlZusammenfassung += "</table>";

    //Untersuchungen
    htmlZusammenfassung += "<h2>Untersuchungen (" + jsonZusammenfassung.untersuchungen.length + ")</h2>"
    htmlZusammenfassung += "<table class='table table-striped'>";
    htmlZusammenfassung += "<tr><th>Datum</th><th>Art</th><th>Gewicht</th><th>Skelettmuskelmasse</th><th>Körperfettmasse</th><th>BMI</th><th>Körperfett(%)</th></tr>";
    for (var i = 0; i < jsonZusammenfassung.untersuchungen.length; i++) {
        htmlZusammenfassung += "<tr>";
        htmlZusammenfassung += "<td>" + jsonZusammenfassung.untersuchungen[i].testtag_zeit + "</td>";
        htmlZusammenfassung += "<td>"
        if( jsonZusammenfassung.untersuchungen[i].typ == "1") { htmlZusammenfassung += "Eingangsuntersuchung"}
        if( jsonZusammenfassung.untersuchungen[i].typ == "2") { htmlZusammenfassung += "1. Check-up"}
        if( jsonZusammenfassung.untersuchungen[i].typ == "3") { htmlZusammenfassung += "2. Check-up"}
        htmlZusammenfassung += "</td>"
        htmlZusammenfassung += "<td>" + jsonZusammenfassung.untersuchungen[i].gewicht + "</td>";
        htmlZusammenfassung += "<td>" + jsonZusammenfassung.untersuchungen[i].skelettmuskelmasse + "</td>";
        htmlZusammenfassung += "<td>" + jsonZusammenfassung.untersuchungen[i].koerperfettmasse + "</td>";
        htmlZusammenfassung += "<td>" + jsonZusammenfassung.untersuchungen[i].bmi + "</td>";
        htmlZusammenfassung += "<td>" + jsonZusammenfassung.untersuchungen[i].koerperfettProz * 100 + "</td>";
        htmlZusammenfassung += "</tr>";
    }
    htmlZusammenfassung += "</table>";

    //Trainings
    htmlZusammenfassung += "<h2>Trainings ("+ jsonZusammenfassung.trainings.length+")</h2>"
    htmlZusammenfassung += "<table class='table table-striped'>";
    htmlZusammenfassung += "<tr><th>Datum</th><th>Trainingsvariante</th><th>Unterschrift Trainer</th><th>Unterschrift Patient</th></tr>";
    for (var i = 0; i < jsonZusammenfassung.trainings.length; i++) {
        htmlZusammenfassung += "<tr>";
        htmlZusammenfassung += "<td>" + jsonZusammenfassung.trainings[i].trainingsdatum + "</td>";
        htmlZusammenfassung += "<td>" + jsonZusammenfassung.trainings[i].trainingsvariante + "</td>";
        htmlZusammenfassung += "<td><img height=\"90\" src=\"" + jsonZusammenfassung.trainings[i].unterschrift_trainer + "\"></td>";
        htmlZusammenfassung += "<td><img height=\"90\" src=\"" + jsonZusammenfassung.trainings[i].unterschrift_kunde + "\"></td>";
        htmlZusammenfassung += "</tr>";
    }
    htmlZusammenfassung += "</table>";

    var node = document.createElement("div")
    node.innerHTML = htmlZusammenfassung;
    var scope = document.getElementsByClassName("tab-content")
    scope[0].appendChild(node);
}