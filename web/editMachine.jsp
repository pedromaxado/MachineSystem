<%-- 
    Document   : editMachine
    Created on : 10/12/2014, 09:40:38
    Author     : administrador-fae
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Css/bootstrap.min.css">
        <script src="lib/sweet-alert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="lib/sweet-alert.css">
        <title>Editar Máquina</title>
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
                        <li><a href="mvc?logic=MachineDetails&id=${machine.id}"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;Detalhes</a></li>
                        <li><a href="mvc?logic=ChartLogic"><span class="glyphicon glyphicon-stats"></span>&nbsp;Estatisticas</a></li>
                    </ul>
                    <form class="navbar-form navbar-right" action="Logout" method="POST">
                        <button type="submit" class="btn btn-link">Logout <span class="glyphicon glyphicon-off"></span></button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="#"><span class="glyphicon glyphicon-pencil"></span>&nbsp;Editar</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <h1 class="text-center">${machine.name}</h1>
            <div class="col-xs-6 col-xs-offset-3">
                <form action="mvc" role="form" id="form" name="form">                        
                    <input type="hidden" name="logic" value="EditMachine">
                    <input type="hidden" name="mId" value="${machine.id}">
                    <table class="table table-striped">
                        <tr><th>Máquina</th><th></th></tr>
                        <tr><td>Nome:</td><td><input class="form-control" type="text" name="name" value="${machine.name}"></td></tr>
                        <tr><td>Sala:</td><td><input class="form-control" type="text" name="room" value="${machine.room}"></td></tr>
                        <tr><td>Setor:</td><td><input class="form-control" type="text" name="sector" value="${machine.sector}"></td></tr>
                        <tr><td>IP:</td><td><input class="form-control" type="text" name="ip" value="${machine.ip}"></td></tr>
                        <tr><td>Nº de Patrimônio:</td><td><input class="form-control" type="text" name="patrimony" value="${machine.patrimony}"></td></tr>
                        <tr><td>Sistema Operacional:</td><td><input class="form-control" type="text" name="os" value="${machineComponents.os}"></td></tr>
                        <tr><td>Processador:</td><td><input class="form-control" type="text" name="processor" value="${machineComponents.processor}"></td></tr>
                        <tr><td>Memória RAM:</td><td><input class="form-control" type="text" name="ram" value="${machineComponents.ram}"></td></tr>
                        <tr><td>HD:</td><td><input class="form-control" type="text" name="hd" value="${machineComponents.hd}"></td></tr>
                        <tr><td>Placa de Vídeo</td><td><input class="form-control" type="text" name="videoCard" value="${machineComponents.videoCard}"></td></tr>
                        <tr><td>Monitor:</td><td><input class="form-control" type="text" name="monitor" value="${machineComponents.monitor}"></td></tr>
                        <tr><td>Patrimonio Monitor:</td><td><input class="form-control" type="text" name="patrimonyMonitor" value="${machineComponents.patrimonyMonitor}"></td></tr>
                        <tr><td>Data de Verificação:</td><td><input class="form-control" type="text" name="checkedDate" value="${machine.checkedDate}"></td></tr>
                        <tr><td>Observação:</td><td><input class="form-control" type="text" name="observation" value="${machine.observation}"></td></tr> 
                    </table>
                    <a class="btn btn-success" onclick="save()"><span class="glyphicon glyphicon-ok"></span> Salvar</a>                    
                </form>
            </div>
        </div>
        <script>
            function save() {
                swal({title: "Edição concluída!", type: "success"},
                function () {
                    document.getElementById('form').submit();
                });

            }
        </script>
    </body>
</html>
