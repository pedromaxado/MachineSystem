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
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <div class="brand-wrapper">
                        <!-- Hamburger -->
                        <button type="button" class="navbar-toggle">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                        <!-- Brand -->
                        <!--                        <div class="brand-name-wrapper">
                                                    <a class="navbar-brand" href="#">
                                                        Brand
                                                    </a>
                                                </div>-->

                        <!-- Search -->
                        <!--                        <a data-toggle="collapse" href="#search" class="btn btn-default" id="search-trigger">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </a>-->

                        <!-- Search body -->
                        <div id="search" class="panel-collapse collapse">
                            <div class="panel-body">
                                <form class="navbar-form" role="search">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Search">
                                    </div>
                                    <button type="submit" class="btn btn-default "><span class="glyphicon glyphicon-ok"></span></button>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Main Menu -->
                <div class="side-menu-container">
                    <ul class="nav navbar-nav">

                        <!-- Dropdown-->
                        <li class="panel panel-default" id="dropdown">
                            <a data-toggle="collapse" href="#dropdown-lvl1" id="currentSector">
                                Selecione o Setor <span class="caret"></span>
                            </a>

                            <!-- Dropdown level 1 -->
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
                        <li id="processorChartActivator"><a href="#processor"><span class="glyphicon glyphicon-th"></span> Processador por Setor</a></li>
                        <li id="ramChartActivator"><a href="#ram"><span class="glyphicon glyphicon-certificate"></span> RAM por Setor</a></li>
                        <li id="hdChartActivator"><a href="#hd"><span class="glyphicon glyphicon-hdd"></span> HD por Setor</a></li>

                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>

        </div>

        <script src="js/highchart/highcharts.js"></script>
        <script src="js/highchart/highcharts-3d.js"></script>
        <script src="js/highchart/modules/exporting.js"></script>

        <div class="container-fluid"style="height: 400px">

            <div class="side-body">
                <div id="chartz"></div>
                <ul class="pagination" id="chartOptions" style="display: none;">
                    <li class="active" id="pieChart"><a href="#">Gráfico de Setor</a></li>
                    <li id="columnChart"><a href="#">Gráfico de Colunas</a></li>                        
                </ul>
            </div>

        </div>

        <script type="text/javascript">
            
            function changeCurrentSector(alfa) {
                $('#currentSector').text($(alfa).text()).append($("<span></span>").addClass("caret"));
                var sectorName = $(alfa).text();
                sectorName = sectorName.replace("-", "");
                var dataP = window['processorData_' + sectorName];
                var dataR = window['ramData_' + sectorName];
                var dataH = window['hdData_' + sectorName];
                actualProcessorData = dataP;
                actualRamData = dataR;
                actualHdData = dataH;
                if ($('#processorChartActivator').hasClass('active')) {
                    $('#chartz').highcharts().series[0].setData(dataP);
                    $('#chartz').highcharts().redraw();
                } else if ($('#ramChartActivator').hasClass('active')) {
                    $('#chartz').highcharts().series[0].setData(dataR);
                    $('#chartz').highcharts().redraw();
                } else if ($('#hdChartActivator').hasClass('active')) {
                    $('#chartz').highcharts().series[0].setData(dataH);
                    $('#chartz').highcharts().redraw();
                }
                $('#currentSector').click();
            }
            //-------------------------------------------------
            //-------------Machines per Sector ----------------
            $('#machineChartActivator').click(function () {
                Highcharts.setOptions({
                    colors: ['#E85737', '#10B249', '#997969', '#9864FF', '#3D6699', '#FFFB51', '#FF675B', '#1CA6B2', '#9D51FF', '#FF762F', '#6EFFCE', '#CC006D', '#FFFC70']
                });
                $('#chartz').highcharts({
                    chart: {
                        type: 'pie',
                        options3d: {
                            enabled: true,
                            alpha: 40,
                            beta: 0
                        }
                    },
                    title: {
                        text: 'Computadores por Setor'
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
                            name: 'Quantidade de computadores',
                            data: [
        <c:forEach var="charData" items="${charDatas}" varStatus="id">
                                ['${charData.name}',${charData.value}],
        </c:forEach>
                            ]
                        }]
                });
                $(this).addClass('active');
                $("#columnChart").removeClass('active');
                
                $("#chartOptions").toggle(500,"swing");
                
            });

            $('#columnChart').click(function () {
                // Set up the chart 
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
                        text: 'Computadores por Setor'
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
                            text: 'Quantidade de Computadores'
                        }
                    },
                    plotOptions: {
                        column: {
                            depth: 25
                        }
                    },
                    series: [{
                            name: 'Computadores',
                            data: [
        <c:forEach var="charData" items="${charDatas}" varStatus="id">
                                ['${charData.name}',${charData.value}],
        </c:forEach>
                            ]
                        }]
                });
                $(this).addClass('active');
                $("#pieChart").removeClass('active');
            });

            $(document).ready(function () {
                $('#pieChart').click();
            });
            //-------------------------------------------------
            //--------Processor By Sector ---------------------
            $('#processorChartActivator').click(function () {
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
                        text: 'Processadores por Setor'
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
                            name: 'Quantidade de Processadores',
                            data: actualProcessorData
                        }]
                });
            });

            $('#ramChartActivator').click(function () {
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
                        text: 'Mémorias por Setor'
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
                            name: 'Quantidade de Máquinas',
                            data: actualRamData
                        }]
                });
                $('#ramChart').highcharts().reflow();
            });

            $('#hdChartActivator').click(function () {
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
                        text: 'HDs por Setor'
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
                            name: 'Quantidade de Máquinas',
                            data: actualHdData
                        }]
                });
            });

            var actualProcessorData;
            var actualRamData;
            var actualHdData;

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
