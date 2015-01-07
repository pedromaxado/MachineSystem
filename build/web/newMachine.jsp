<%-- 
    Document   : registroMaquina
    Created on : 01/12/2014, 15:20:02
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
        <title>Registro de Máquinas</title>
        <link rel="stylesheet" href="Css/bootstrap.min.css">
        <script src="js/register.js"></script>
        <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
        <script src="lib/sweet-alert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="lib/sweet-alert.css">
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </head>
    <body style="padding: 40px 0">
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
                        <li class="active"><a href="newMachine.jsp"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Adicionar</a></li>
                        <li><a href="mvc?logic=ChartLogic"><span class="glyphicon glyphicon-stats"></span>&nbsp;Estatisticas</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href='mvc?logic=Logout'>Logout <span class="glyphicon glyphicon-off"></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">


            <h1 class="text-center">Registro de Máquinas</h1>


            <div class="row">
                <div class="col-sm-offset-1 col-md-offset-2 col-lg-offset-3 col-xs-12 col-sm-10 col-md-8 col-lg-6">
                    <form action="mvc" role="form" id="form" name="form">                        
                        <input type="hidden" name="logic" value="NewMachine">
                        <div class="form-group">
                            <label for="Setor">Setor</label>
                            <input type="text" class="form-control" id="Setor" name="setor" value="-">
                        </div>
                        <div class="form-group">
                            <label for="Sala">Sala</label>
                            <input type="text" class="form-control" id="Sala" name="sala" value="-">
                        </div>
                        <div class="form-group">
                            <label for="IP">IP</label>
                            <input type="text" class="form-control" id="IP" name="ip" value="-">
                        </div>
                        <div class="form-group">
                            <label for="NPatrimonio">Nº Patrimonio</label>
                            <input type="text" class="form-control" id="NPatrimonio" name="npatrimonio" value="-">
                        </div>
                        <div class="form-group">
                            <label for="DataVerificacao">Data de Verificação</label>
                            <input type="date" class="form-control" id="DataVerificacao" name="dataverificacao" value="">
                        </div>
                        <div class="form-group">
                            <label for="Hostname">Nome da Máquina</label>
                            <input type="text" class="form-control" id="Hostname" name="hostname" value="-">
                        </div>
                        <div class="form-group">
                            <label for="Processador">Processador</label>
                            <input type="text" class="form-control" id="Processador" name="processador" value="-">
                        </div>
                        <div class="form-group">
                            <label for="RAM">Memoria RAM</label>
                            <input type="text" class="form-control" id="RAM" name="ram" value="-">
                        </div>
                        <div class="form-group">
                            <label for="HD">HD</label>
                            <input type="text" class="form-control" id="HD" name="hd" value="-">
                        </div>
                        <div class="form-group">
                            <label for="PlacaVideo">Placa de Vídeo</label>
                            <input type="text" class="form-control" id="PlacaVideo" name="placavideo" value="-">
                        </div>
                        <div class="form-group">
                            <label for="Monitor">Monitor</label>
                            <input type="text" class="form-control" id="Monitor" name="monitor" value="-">
                        </div>
                        <div class="form-group">
                            <label for="PatrimonioMonitor">Patrimonio(Monitor)</label>
                            <input type="text" class="form-control" id="PatrimonioMonitor" name="patrimoniomonitor" value="-">
                        </div>
                        <div class="form-group">
                            <label for="os">Sistema Operacional</label>
                            <input type="text" class="form-control" id="os" name="os" value="-">
                        </div>
                        <div class="form-group">
                            <label for="Observacoes">Obsevações</label>
                            <input type="text" class="form-control" id="Observacoes" name="observacoes" value="-">
                        </div>
                        <input type="hidden" name="pNumber" id="pNumber" value="0">
                        <div class="form-group" id="plus">
                            <span class="btn btn-link glyphicon glyphicon-plus" style='padding-left: 0' onclick="addPeripheral()"><strong> Adicionar Periférico</strong></span>
                        </div>                        
                    </form>
                    <button class="btn btn-default" onclick="save()">Submit</button>
                    <br>
                    <!--<a href='listaMaquinas.jsp'>Lista</a>-->
                </div>
            </div>
            <script>
                function save() {
                    if (document.getElementById("Hostname").value != "-") {
                        swal({title: "Máquina salva com sucesso!", type: "success"},
                        function () {
                            document.getElementById('form').submit();
                        });
                    }else{
                        swal({title: "Digite um nome para máquina", type: "error"});
                    }

                }
            </script>
        </div>
    </body>
</html>
