<%-- 
    Document   : view
    Created on : 05/12/2014, 14:39:20
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
        <title>Visualização da Máquina</title>
        <link rel="stylesheet" href="Css/bootstrap.min.css">
        <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
        <script src="js/view.js"></script> 
        <script src="lib/sweet-alert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="lib/sweet-alert.css">
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="lib/sweet-alert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="lib/sweet-alert.css">
    </head>
    <body  style="padding: 50px 0">
        <form style="visibility:hidden;display:none" id="form" action="editMachine.jsp" method="POST">
            <input class="form-control" type="text" name="id" value="${machine.id}">
            <input class="form-control" type="text" name="name" value="${machine.name}">
            <input class="form-control" type="text" name="room" value="${machine.room}">
            <input class="form-control" type="text" name="sector" value="${machine.sector}">
            <input class="form-control" type="text" name="ip" value="${machine.ip}">
            <input class="form-control" type="text" name="patrimony" value="${machine.patrimony}">
            <input class="form-control" type="text" name="processor" value="${machineComponents.processor}">
            <input class="form-control" type="text" name="ram" value="${machineComponents.ram}">
            <input class="form-control" type="text" name="hd" value="${machineComponents.hd}">
            <input class="form-control" type="text" name="videoCard" value="${machineComponents.videoCard}">
            <input class="form-control" type="text" name="monitor" value="${machineComponents.monitor}">
            <input class="form-control" type="text" name="patrimonyMonitor" value="${machineComponents.patrimonyMonitor}">
            <input class="form-control" type="text" name="checkedDate" value="${machine.checkedDate}">
            <input class="form-control" type="text" name="observation" value="${machine.observation}">
            <input class="form-control" type="text" name="os" value="${machineComponents.os}">
        </form>
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
                        <li class="active"><a href="#"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;Detalhes</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#" onclick="deleteMachine(${machine.id}, '${machine.name}')"><span class="glyphicon glyphicon-trash"></span> Apagar</a></li>
                        <li><a href="#" onclick="document.getElementById('form').submit()"><span class="glyphicon glyphicon-pencil"></span> Editar</a></li>
                        <li><a href='mvc?logic=Logout'>Logout <span class="glyphicon glyphicon-off"></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <h1 class="text-center">${machine.name}</h1>
            <div class="row">
                <div class="col-xs-6 col-xs-offset-3">
                    <table class="table table-striped">
                        <tr><th>Máquina</th><th></th></tr>
                        <tr><td>Nome:</td><td>${machine.name}</td></tr>
                        <tr><td>Sala:</td><td>${machine.room}</td></tr>
                        <tr><td>Setor:</td><td>${machine.sector}</td></tr>
                        <tr><td>IP:</td><td>${machine.ip}</td></tr>
                        <tr><td>Nº de Patrimônio:</td><td>${machine.patrimony}</td></tr>
                        <tr><td>Sistema Operacional:</td><td>${machineComponents.os}</td></tr>
                        <tr><td>Processador:</td><td>${machineComponents.processor}</td></tr>
                        <tr><td>Memória RAM:</td><td>${machineComponents.ram}</td></tr>
                        <tr><td>HD:</td><td>${machineComponents.hd}</td></tr>
                        <tr><td>Placa de Vídeo</td><td>${machineComponents.videoCard}</td></tr>
                        <tr><td>Monitor:</td><td>${machineComponents.monitor}</td></tr>
                        <tr><td>Patrimonio Monitor:</td><td>${machineComponents.patrimonyMonitor}</td></tr>
                    </table>
                    <c:if test="${not empty machinePeripheral}">
                        <p class="text-center"><strong>Periféricos</strong></p>
                        <table class="table  table-striped">
                            <c:forEach var="peripheral" items="${machinePeripheral}" varStatus="id">
                                <tr>
                                    <td><strong>Periférico ${id.count}: </strong></td><td>${peripheral.name}</td>
                                    <td><strong>Patrimônio: </strong></td><td>${peripheral.patrimony}</td>
                                    <td><a href="mvc?logic=DeletePeripheral&pId=${peripheral.id}&machineName${machine.name}&mId=${machine.id}">Apagar</a></td>
                                    <td><a href="editPeripheral.jsp?machineName=${machine.name}&mId=${machine.id}&pName=${peripheral.name}&pPatrimony=${peripheral.patrimony}&pId=${peripheral.id}">Editar</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <span class="btn btn-link glyphicon glyphicon-plus" style='padding-left: 0' onclick="addPeripheral()"><strong> Adicionar Periférico</strong></span>
                    <form id="addPoint" action="mvc" method="POST">
                        <input type="hidden" id="logic" name="logic" value="NewPeripheral">
                        <input type="hidden" name="machineName" value="${machine.name}">
                        <input type="hidden" name="mId" value="${machine.id}">
                    </form>
                    <br/>
                    <table class="table  table-striped">
                        <tr><td><strong>Observação: </strong></td><td>${machine.observation}</td></tr>
                        <tr><td><strong>Data de Verificação: </strong></td><td>${machine.checkedDate}</td></tr>
                    </table>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function deleteMachine(id, name) {
                swal({title: "Tem certeza que quer apagar a máquina?", text: "Você não será capaz de recuperá-la!", type: "warning", showCancelButton: true, cancelButtonText: "Cancelar",
                    confirmButtonColor: "#DD6B55", confirmButtonText: "Sim, tenho certeza!", closeOnConfirm: false},
                function (isConfirm) {
                    if (isConfirm) {
                        swal({title: "Concluído!", text: "Maquina apagada com sucesso.", type: "success", confirmButtonColor: "#AEDEF4", confirmButtonText: "OK", closeOnConfirm: true},
                        function (isConfirm) {
                            if (isConfirm) {
                                window.location = "mvc?logic=DeleteMachine&id=" + id + "&name=" + name;
                            }
                        });
                    }
                });
            }
        </script>
    </body>    
</html>
