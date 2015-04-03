	// 차트 생성
	function createChart() {
    	
    	// Radialize the colors
		Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function(color) {
		    return {
		        radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
		        stops: [
		            [0, color],
		            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
		        ]
		    };
		});
		
		// Build the chart
        $('.chart').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                backgroundColor: '#FAFAFA'
            },
            title: {
                text: ''
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        },
                        connectorColor: 'silver'
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Counts'
            }]
        });
        setChartData();
    };
	
	// 데이터 입력
	function setChartData() {
		$.ajax({
			url : "selectCount.do", 
			type : "post", 
			dataType : "json", 
			success : function(data) {
				var chart = $('.chart').highcharts();
				$(data.json).each(function(index){
					chart.series[0].setData([['정치',this.po], ['경제',this.ec], ['사회',this.so], ['생활/문화',this.lc],
					                         ['세계',this.wo], ['IT/과학',this.is], ['연예',this.en], ['스포츠',this.sp]]);
				});
			},
			error : function(err) { 
				alert("[ERROR] 다시 시도해주세요.");
			}
		});	
	}