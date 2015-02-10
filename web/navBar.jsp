<%-- 
    Document   : navBar
    Created on : 06/02/2015, 09:08:58
    Author     : administrador-fae
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                <li id="ListMachine"><a href="mvc?logic=ListMachine"><span class="glyphicon glyphicon-list"></span>&nbsp;Lista de Máquinas</a></li>
                <li id="AddMachine"><a href="newMachine.jsp"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Adicionar</a></li>
                <li id="Statistics"><a href="mvc?logic=ChartLogic"><span class="glyphicon glyphicon-stats"></span>&nbsp;Estatisticas</a></li>
            </ul>
            <form class="navbar-form navbar-right" action="Logout" method="POST">
                <button type="submit" class="btn btn-link">Logout <span class="glyphicon glyphicon-off"></span></button>
            </form>
        </div>
    </div>
</nav>
