import QtQuick 2.0
import QtCharts 2.0
import BackendChartData 1.0

Item {

    BackendChartData {
        id: chartData
    }


    //Rectangle{

    ChartView {
        width: parent.width/*540*/
        height: parent.height/3/*440*/
        legend.visible: false
        antialiasing: true
        backgroundColor: "black"

        ValueAxis {
            id: axisX
            min: 0
            max: 15
            tickCount: 10
            gridVisible: false

        }

        ValueAxis {
            id: axisY
            min: -2
            max: 2
            tickCount: 5
            gridVisible: false
        }

        LineSeries {
            id: series1
            axisX: axisX
            axisY: axisY
            color: "yellow"
        }

    }



    ChartView {
        id: chart2
        x:0
        y: parent.height/3
        width: parent.width/*540*/
        height: parent.height/3/*440*/

        legend.visible: false
        antialiasing: true
        backgroundColor: "black"

        ValueAxis {
            id: axisX1
            min: 0
            max: 15
            tickCount: 10
            gridVisible: false
        }

        ValueAxis {
            id: axisY1
            min: -2
            max: 2
            tickCount: 5
            gridVisible: false
        }

        LineSeries {
            id: series3
            axisX: axisX1
            axisY: axisY1

            color: "green"
        }

    }

    function drawPlot()
    {
        var val1 = chartData.getChartData();

        for (var i = 0; i <= 50; i++) {
            series1.append(i, val1[i]);
        }
    }

    ChartView {
        id: chart3
        x:0
        y: parent.height/3*2
        width: parent.width/*540*/
        height: parent.height/3/*440*/

        legend.visible: false
        antialiasing: true
        backgroundColor: "black"

        ValueAxis {
            id: axisX2
            min: 0
            max: 15
            tickCount: 10
            gridVisible: false
        }

        ValueAxis {
            id: axisY2
            min: -2
            max: 2
            tickCount: 5
            gridVisible: false
        }

        LineSeries {
            id: series4
            axisX: axisX2
            axisY: axisY2
            color: "white"
        }

    }


    // Add data dynamically to the series
    Component.onCompleted: {
        var value = chartData.getChartData();

        for (var i = 0; i <= 50; i++) {
            series1.append(i, value[i]);
        }

        for(var j=0; j<=50; j++)
            series3.append(j,Math.sin(45*j))

        for(var k=0; k<=50; k++)
            series4.append(k,Math.sin(60*k))


    }
}
