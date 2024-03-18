$(function() {
    $("span.pie").peity("pie", {

        fill: ["#1ab394", "#f8ac59", "#ed5565","red","green"],
        width:50,
        height:50
    })

    $(".line").peity("line",{
        fill: '#1ab394',
        stroke:'#169c81',
    })

    $(".bar").peity("bar", {
//        fill: ["#1ab394", "#d7d7d7"]
fill: ["#1c84c4", "#1cb494","red","#fcac5c","#ec5464"],
    })

    $(".bar_dashboard").peity("bar", {
        fill: ["#1c84c4", "#1cb494","red","#fcac5c","#ec5464"],
        width:100
    })

    var updatingChart = $(".updating-chart").peity("line", { fill: '#1ab394',stroke:'#169c81', width: 64 })

    setInterval(function() {
        var random = Math.round(Math.random() * 10)
        var values = updatingChart.text().split(",")
        values.shift()
        values.push(random)

        updatingChart
            .text(values.join(","))
            .change()
    }, 1000);

});
