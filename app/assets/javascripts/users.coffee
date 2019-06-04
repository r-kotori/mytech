# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


window.draw_graph = ->
  ctx = document.getElementById("myChart").getContext('2d')
  colorNum = gon.data1.length
  setColors = new Array(colorNum)
  for i in [0...colorNum]
    setColors[i] = 'rgb(' + ~ ~(256 * Math.random()) + ', ' + ~ ~(256 * Math.random()) + ', ' + ~ ~(256 * Math.random()) + ')'

  myPieChart = new Chart(ctx, {
    type: 'pie',
    data: {
      datasets: [{
        data: gon.data1,
        backgroundColor: setColors,
        borderColor: setColors,
      }]
      labels: gon.data2,
    },
    options: {}
  })
