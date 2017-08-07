//商户
optionHistogramBySH = {
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    textStyle: {
        color: '#ccc'
    },
    legend: {
        data : ['今日新增','月趋势'],
        top : 30,
        right: 40,
        textStyle : {
            color : '#b4bdc3',
            fontSize : 6.9
        },
        itemWidth : 16.2,
        itemHeight : 5.2,
    },
    color : ['#219dcf','#9fb751'],
    
    grid: {
        containLabel : true
    },
    xAxis : [
        {
            type : 'category',
            data : ['一','二','三','四','五','六','日'],
            axisLabel: {          
                textStyle: {
                    color: '#ccc',
                    fontSize: 8
                }
            },
            axisLine: {
                lineStyle: {
                    color: 'rgba(52,161,127,.65)'
                }
            },
            splitLine: {
                show: false
            }
        }
    ],
    yAxis : [
        {
            type : 'value',
            axisLabel: {          
                textStyle: {
                    color: '#ccc',
                    fontSize: 8
                }
            },
            axisLine: {
                lineStyle: {
                    color: 'rgba(52,161,127,.65)'
                }
            },
            splitLine: {
                lineStyle: {
                    color: 'rgba(255,255,255,.1)',
                }
            }
        }
    ],
    series : [
        {
            name:'今日新增',
            type:'bar',
            barWidth : 10,
            stack: '数据',
            data:[200, 110, 150, 290, 310, 300, 290]
        },
        {
            name:'月趋势',
            type:'bar',
            stack: '数据',
            data:[50, 40, 20, 20, 100, 90, 10]
        }
    ]
};
