var VerteilungTVGesamt = null;
var dauerUndAnzahlTrainings = null;

function setVerteilungTVGesamt(json) {
  VerteilungTVGesamt = json;
}

function setdauerUndAnzahlTrainings(json){
  dauerUndAnzahlTrainings = json;
  renderChart();
}

//addEventListener('mousemove', renderChart);

function renderChart() {

  renderChartVerteilungTVGesamt();
  renderChartdauerUndAnzahlTrainings();
}

function renderChartVerteilungTVGesamt(){
    const ctx = document.getElementById('myChart');

    const config = {
      type: 'bar',
      data: VerteilungTVGesamt,
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    }
    new Chart(ctx, config);
}

function renderChartdauerUndAnzahlTrainings() {
  const ctxdauerUndAnzahlTrainings = document.getElementById('dauerUndAnzahlTrainings');




  //x ist die vergagnenen Tage
  //x = 0 ist das letzte Training
  //y ist die Anzahl der Trainings
  //x=y*3,5

  const today = new Date().toISOString().slice(0, 10);

  const config2 = {
    type: 'bubble',
    data: dauerUndAnzahlTrainings,
    options: {
      scales: {
        x: {
          reverse : true,
          max : today,
          type: 'time',
          time: {
            unit: 'day'
          }
        },
        y: {
          min : 0,
          max: 24
        }
      },
      plugins: {
        tooltip: {
          callbacks: {
            title: tooltipItems => {
              title = tooltipItems[0].raw.label;
              console.log(tooltipItems[0]);
              return title
            },
          },
        },
      },
    }
  };

  new Chart(ctxdauerUndAnzahlTrainings, config2);


}