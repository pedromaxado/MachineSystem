<%-- 
    Document   : machineList
    Created on : 05/12/2014, 14:08:11
    Author     : administrador-fae
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Máquinas</title>
        <link rel="stylesheet" href="Css/bootstrap.min.css">
        <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
        <script src="lib/sweet-alert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="lib/sweet-alert.css">
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/advanceSearch.js"></script>
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </head>
    <body  style="padding: 50px 0">
        <nav class="navbar  navbar-fixed-top navbar-default">
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
                        <li class="active"><a href="mvc?logic=ListMachine"><span class="glyphicon glyphicon-list"></span>&nbsp;Lista de Máquinas</a></li>
                        <li><a href="newMachine.jsp"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Adicionar</a></li>
                        <li><a href="mvc?logic=ChartLogic"><span class="glyphicon glyphicon-stats"></span>&nbsp;Estatisticas</a></li>
                    </ul>
                    <form class="navbar-form navbar-right" action="Logout" method="POST">
                        <button type="submit" class="btn btn-link">Logout <span class="glyphicon glyphicon-off"></span></button>
                    </form>
                </div>
            </div>
        </nav>
        <div class="container">
            <c:if test="${search}">
                <h1><em>Resultado da pesquisa : '${query}'</em></h1>
            </c:if>
            <c:if test="${not search}">
                <h1>Lista de Máquinas</h1>
            </c:if>
            <div class="row">
                <div class="col-xs-12">
                    <br>
                    <div class="row" id="simpleSearch">
                        <div class="col-xs-12">
                            <form class="navbar-form navbar-left" action="mvc" role="search">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="hidden" name="logic" value="SimpleSearch">
                                        <input type="text" name="query" class="form-control" placeholder="Pesquisa">
                                        <span class="input-group-btn">
                                            <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                        </span>
                                    </div>
                                </div>                            
                            </form>
                            <div class="nav navbar-nav navbar-right" style="margin-right: 0">
                                <span class="btn btn-link" style='padding-left: 0' onclick="$('#simpleSearch').toggle();
                                        $('#advancedSearch').toggle()"><strong> Pesquisa Avançada</strong></span>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="advancedSearch" style="display:none">
                        <div class="col-xs-12">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="nav navbar-nav">
                                        <h3>Pesquisa Avançada</h3>
                                    </div>
                                    <div class="nav navbar-nav navbar-right">
                                        <span class="btn btn-link" style="margin-right: -10px;margin-top: 10px;" onclick="$('#simpleSearch').toggle();
                                                $('#advancedSearch').toggle()"><strong> Pesquisa Simples</strong></span>
                                    </div>
                                </div>
                            </div>
                            <form id="formAS" action="mvc">
                                <input type="hidden" name="logic" value="AdvancedSearch">
                                <div class="row">
                                    <div class="form-group col-xs-3">
                                        <label for="Setor">Setor</label>
                                        <input type="text" class="form-control" id="Setor" name="setor" value="">
                                    </div>
                                    <div class="form-group col-xs-3">
                                        <label for="Sala">Sala</label>
                                        <input type="text" class="form-control" id="Sala" name="sala" value="">
                                    </div>
                                    <div class="form-group col-xs-3">
                                        <label for="IP">IP</label>
                                        <input type="text" class="form-control" id="IP" name="ip" value="">
                                    </div>
                                    <div class="form-group col-xs-3">
                                        <label for="NPatrimonio">Nº Patrimonio</label>
                                        <input type="text" class="form-control" id="NPatrimonio" name="npatrimonio" value="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-3">
                                        <label for="DataVerificacao">Data de Verificação</label>
                                        <input type="date" class="form-control" id="DataVerificacao" name="dataverificacao" value="">
                                    </div>
                                    <div class="form-group col-xs-3">
                                        <label for="Hostname">Nome da Máquina</label>
                                        <input type="text" class="form-control" id="Hostname" name="hostname" value="">
                                    </div>
                                    <div class="form-group col-xs-3">
                                        <label for="Processador">Processador</label>
                                        <input type="text" class="form-control" id="Processador" name="processador" value="">
                                    </div>
                                    <div class="form-group col-xs-3">
                                        <label for="RAM">Memoria RAM</label>
                                        <input type="text" class="form-control" id="RAM" name="ram" value="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-xs-3">
                                        <label for="HD">HD</label>
                                        <input type="text" class="form-control" id="HD" name="hd" value="">
                                    </div>
                                    <div class="form-group col-xs-3">
                                        <label for="PlacaVideo">Placa de Vídeo</label>
                                        <input type="text" class="form-control" id="PlacaVideo" name="placavideo" value="">
                                    </div>                        
                                    <div class="form-group col-xs-3">
                                        <label for="os">Sistema Operacional</label>
                                        <input type="text" class="form-control" id="OS" name="os" value="">
                                    </div>
                                    <div class="form-group col-xs-3">
                                        <label for="Observacoes">Obsevação</label>
                                        <input type="text" class="form-control" id="Observacoes" name="observacoes" value="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <button class="btn btn-primary" type="button" onclick="advanceSearch()">Pesquisar <span class="glyphicon glyphicon-search"></span></button>
                                    </div>
                                </div>
                                <input type="hidden" id="searchFor" name="searchFor" value="">
                                <input type="hidden" id="searchTokens" name="searchTokens" value="">
                            </form>
                        </div>
                    </div>
                    <table class="table table-striped">
                        <thead>
                        <th>Nome</th>
                        <th>IP</th>
                        <th>Sala</th>
                        <th>Setor</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        </thead>
                        <c:forEach var="machine" items="${machines}" varStatus="id">
                            <tr>
                                <td>${machine.name}</td>
                                <td>${machine.ip}</td>
                                <td>${machine.room}</td>
                                <td>${machine.sector}</td>
                                <td><a href="mvc?logic=GetMachine&id=${machine.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                                <td><a href="#" onclick="deleteMachine(${machine.id}, '${machine.name}')"><span class="glyphicon glyphicon-trash"></span></a></td>
                                <td><a href="mvc?logic=MachineDetails&id=${machine.id}">Detalhes</a></td>
                            </tr>
                        </c:forEach>
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
