# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.draw_graph = ->
  ctx = document.getElementById("myChart").getContext('2d')
  myPieChart = new Chart(ctx, {
    type: 'pie',
    data: {
      datasets: [{
        data: [10, 20, 30],
        backgroundColor: [
          'rgba(255, 99, 132, 0.1)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
        ],
        borderColor: [
          'rgba(255,99,132,1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
        ],
      }]
      labels: [
        'Red', 'Blue', 'Yellow'
      ]
    },
    options: {}
  })
