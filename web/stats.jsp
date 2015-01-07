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
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

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

        <script src="js/highchart/highcharts.js"></script>
        <script src="js/highchart/highcharts-3d.js"></script>
        <script src="js/highchart/modules/exporting.js"></script>

        <div class="container"style="height: 400px">
            <div class="row">
                <div class="col-xs-12">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#machine" data-toggle="tab">Máquinas por Setor</a></li> 
                        <li><a href="#processor" data-toggle="tab">Processador por Setor</a></li> 
                        <li><a href="#ram" data-toggle="tab">Memória RAM por Setor</a></li> 
                        <li><a href="#hd" data-toggle="tab">HD por Setor</a></li> 
                    </ul>
                </div>
                <div class="col-xs-12">
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade active in" id="machine">
                            <div  id="machineChart"></div>                
                            <ul class="pagination">
                                <li class="active" id="pieChart"><a href="#">Gráfico de Setor</a></li>
                                <li id="columnChart"><a href="#">Gráfico de Colunas</a></li>                        
                            </ul>
                        </div>
                        <div class="tab-pane fade" id="processor">
                            <div id="processorChart"></div>                
                        </div>
                        <div class="tab-pane fade" id="ram">
                            <div id="ramChart"></div>                
                        </div>
                        <div class="tab-pane fade" id="hd">
                            <div id="hdChart"></div>                
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $('#pieChart').click(function () {
                Highcharts.setOptions({
                    colors: ['#E85737', '#10B249', '#997969', '#9864FF', '#3D6699', '#FFFB51', '#FF675B', '#1CA6B2', '#9D51FF', '#FF762F', '#6EFFCE', '#CC006D', '#FFFC70']
                });
                $('#machineChart').highcharts({
                    chart: {
                        type: 'pie',
                        options3d: {
                            enabled: true,
                            alpha: 45,
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
            });

            $('#columnChart').click(function () {
                // Set up the chart 
                var chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'machineChart',
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
        </script>
    </body>
</html>
