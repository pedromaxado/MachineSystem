<%-- 
    Document   : stats
    Created on : 05/01/2015, 16:16:51
    Author     : administrador-fae
--%>

<%

    if (session.getAttribute("username") == null) {
        String loginPage = "login.jsp";
        response.sendRedirect(loginPage);
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estatisticas</title>
        <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
        <link rel="stylesheet" href="Css/bootstrap.min.css">
        <link rel="stylesheet" href="Css/side-menu.css">
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/side-menu.js"></script>

    </head>
    <body style="padding: 50px 0">
        <nav class="navbar navbar-fixed-top navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#meni">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-home"></span></a>
                </div>
                <div class="collapse navbar-collapse" id="meni">
                    <ul class="nav navbar-nav">
                        <li><a href="mvc?logic=ListMachine"><span class="glyphicon glyphicon-list"></span>&nbsp;Lista de Máquinas</a></li>
                        <li><a href="newMachine.jsp"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Adicionar</a></li>
                        <li class="active"><a href="mvc?logic=ChartLogic"><span class="glyphicon glyphicon-stats"></span>&nbsp;Estatisticas</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href='mvc?logic=Logout'>Logout <span class="glyphicon glyphicon-off"></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="side-menu">
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <div class="brand-wrapper">
                        <button type="button" class="navbar-toggle">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                </div>
                <div class="side-menu-container">
                    <ul class="nav navbar-nav">
                        <li class="panel panel-default" id="dropdown">
                            <a data-toggle="collapse" href="#dropdown-lvl1" id="currentSector" onclick="$('#changer').toggle()">
                                Selecione o Setor <span class="caret"></span>
                            </a>
                            <div id="dropdown-lvl1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <c:forEach var="sector" items="${sectors}" varStatus="id">
                                            <li><a href="#dropdown${id.count}"  onclick="changeCurrentSector($(this))">${sector}</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li id="machineChartActivator"><a href="#"><span class="glyphicon glyphicon-th-large"></span> Máquinas por Setor</a></li>
                        <li id="processorChartActivator" style="display: none;"><a href="#processor"><span class="glyphicon glyphicon-th"></span> Processador por Setor</a></li>
                        <li id="ramChartActivator" style="display: none;"><a href="#ram"><span class="glyphicon glyphicon-certificate"></span> RAM por Setor</a></li>
                        <li id="hdChartActivator" style="display: none;"><a href="#hd"><span class="glyphicon glyphicon-hdd"></span> HD por Setor</a></li>
                    </ul>
                </div>
                <nav class="navbar-fixed-bottom" id="changer">
                    <ul class="pagination" id="chartOptions" style="margin-left: 15px">
                        <li class="active" id="pieChart"><a href="#">Gráfico de Setor</a></li>
                        <li id="columnChart"><a href="#">Gráfico de Colunas</a></li>                        
                    </ul>
                </nav>
            </nav>
            
        </div>

        <script src="js/highchart/highcharts.js"></script>
        <script src="js/highchart/highcharts-3d.js"></script>
        <script src="js/highchart/modules/exporting.js"></script>

        <div class="container-fluid"style="height: 400px">

            <div class="side-body">
                <div id="chartz"></div>
            </div>

        </div>

        <script type="text/javascript">

            var currentSector;
            var currentComponent;
            
            function changeCurrentSector(alfa) {
                
                $('#currentSector').text($(alfa).text()).append($("<span></span>").addClass("caret"));
                
                var sectorName = $(alfa).text();
                currentSector = sectorName;
                sectorName = sectorName.replace(/-/g, "");
                sectorName = sectorName.replace(/ /g, "");
                
                var dataP = window['processorData_' + sectorName];
                var dataR = window['ramData_' + sectorName];
                var dataH = window['hdData_' + sectorName];
                
                currentProcessorData = dataP;
                currentRamData = dataR;
                currentHdData = dataH;
                
                $('#currentSector').click();
                
                $('#processorChartActivator').show();
                $('#ramChartActivator').show();
                $('#hdChartActivator').show();
                
            }
            
            $(document).ready(function () {
                Highcharts.setOptions({
                    colors: ['#E85737', '#10B249', '#997969', '#9864FF', '#3D6699', '#FFFB51', '#FF675B', '#1CA6B2', '#9D51FF', '#FF762F', '#6EFFCE', '#CC006D', '#FFFC70']
                });
                $('#machineChartActivator').click();
            });
            
            $('#pieChart').click(function() {
                generatePieChart(currentSector,currentComponent,currentData);
            });
            
            $('#columnChart').click(function () {
                generateColumnChart(currentSector,currentComponent,currentData);
            });

            //------------------------------------------------
            //-------------Machines per Sector----------------
            $('#machineChartActivator').click(function () {
                currentSector = 'FAE';
                currentComponent = 'Máquinas';
                currentData = machineData;
                $('#pieChart').click();
            });
            
            //------------------------------------------------
            //--------------Processor By Sector---------------
            $('#processorChartActivator').click(function () {
                currentComponent = 'Processadores';
                currentData = currentProcessorData;
                $('#pieChart').click();
            });
            
            //------------------------------------------
            //---------------RAM By Sector--------------
            $('#ramChartActivator').click(function () {
                currentComponent = 'Memórias RAM';
                currentData = currentRamData;
                $('#pieChart').click();
            });

            //-------------------------------------------
            //--------HD By Sector ---------------------
            $('#hdChartActivator').click(function () {
                currentComponent = 'HDs';
                currentData = currentHdData;
                $('#pieChart').click();
            });
            
            
            function generatePieChart(sector,component,dataArray) {
                
                $('#chartz').highcharts({
                    chart: {
                        type: 'pie',
                        options3d: {
                            enabled: true,
                            alpha: 45,
                            beta: 0
                        }
                    },
                    title: {
                        text: component + ' - ' + sector
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.y}</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            depth: 35,
                            dataLabels: {
                                enabled: true,
                                format: '{point.name}'
                            }
                        }
                    },
                    series: [{
                            type: 'pie',
                            name: 'Quantidade de ' + component,
                            data: dataArray
                        }]
                });
                
                $("#pieChart").addClass('active');
                $("#columnChart").removeClass('active');
                
            }
            
            function generateColumnChart(sector,component,dataArray) {
                
                var chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'chartz',
                        type: 'column',
                        margin: 75,
                        options3d: {
                            enabled: true,
                            alpha: 0,
                            beta: 3,
                            depth: 30,
                            viewDistance: 10
                        }
                    },
                    title: {
                        text: component + ' - ' + sector
                    },
                    xAxis: {
                        type: 'category',
                        labels: {
                            rotation: -45,
                            style: {
                                fontSize: '10px',
                            }
                        },
                        gridLineColor: '#FFFFFF'
                    },
                    yAxis: {
                        title: {
                            text: 'Quantidade de ' + component
                        }
                    },
                    plotOptions: {
                        column: {
                            depth: 25
                        }
                    },
                    series: [{
                            name: component,
                            data: dataArray
                        }]
                });
                $("#columnChart").addClass('active');
                $("#pieChart").removeClass('active');
                
            }
            
            var currentData;
            var currentProcessorData;
            var currentRamData;
            var currentHdData;

            var machineData = [
                <c:forEach var="charData" items="${charDatas}" varStatus="id">
                    ['${charData.name}',${charData.value}],
                </c:forEach>
            ]

            <c:forEach var="cdp" items="${charDatasProcessor}" varStatus="id">
                var processorData_${cdp.sector} = [
                    <c:forEach var="data" items="${cdp.datas}">
                        ['${data.name}',${data.value}],
                    </c:forEach>
                ];
            </c:forEach>
            
            <c:forEach var="cdp" items="${charDatasRam}" varStatus="id">
                var ramData_${cdp.sector} = [
                    <c:forEach var="data" items="${cdp.datas}">
                        ['${data.name}',${data.value}],
                    </c:forEach>
                ];
            </c:forEach>
            
            <c:forEach var="cdp" items="${charDatasHd}" varStatus="id">
                var hdData_${cdp.sector} = [
                    <c:forEach var="data" items="${cdp.datas}">
                        ['${data.name}',${data.value}],
                    </c:forEach>
                ];
            </c:forEach>
            
        </script>
    </body>
</html>
