<!DOCTYPE html>

<html>
    <head>
        <title>Banco de Dados - Maquinas FAE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Css/bootstrap.min.css">
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar  navbar-fixed-top navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#meni">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp" style="color: #d9230f;"><span class="glyphicon glyphicon-home"></span></a>
                </div>
                <div class="collapse navbar-collapse" id="meni">
                    <ul class="nav navbar-nav">
                        <li><a href="mvc?logic=ListMachine"><span class="glyphicon glyphicon-list"></span>&nbsp;Lista de Máquinas</a></li>
                        <li><a href="newMachine.jsp"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Adicionar</a></li>
                        <li><a href="mvc?logic=ChartLogic"><span class="glyphicon glyphicon-stats"></span>&nbsp;Estatisticas</a></li>
                    </ul>
                    <form class="navbar-form navbar-right" action="Logout" method="POST">
                        <button type="submit" class="btn btn-link">Logout <span class="glyphicon glyphicon-off"></span></button>
                    </form>
                </div>
            </div>
        </nav>
        <div class="container" style="">
            <div class="row" style="padding-top: 85px">
                <div class="col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title">Sistema de Máquinas FAE</h1>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="newMachine.jsp">Adicionar nova Máquina</a></li>
                                <li><a href="mvc?logic=ListMachine">Listar Máquinas</a><li>
                                <li><a href="mvc?logic=ChartLogic">Estatísticas</a><li>
                            </ul>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
