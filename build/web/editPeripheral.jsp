<%-- 
    Document   : editPeripheral
    Created on : 10/12/2014, 09:20:25
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
        <link rel="stylesheet" href="Css/bootstrap.min.css">
        <title>Editar Periférico</title>
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
                        <li><a href="mvc?logic=MachineDetails&id=${param.mId}"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;Detalhes</a></li>
                        <li><a href="mvc?logic=ChartLogic"><span class="glyphicon glyphicon-stats"></span>&nbsp;Estatisticas</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href='mvc?logic=Logout'>Logout <span class="glyphicon glyphicon-off"></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">            
            <div class="row">
                <div class="col-sm-offset-1 col-md-offset-2 col-lg-offset-3 col-xs-12 col-sm-10 col-md-8 col-lg-6">
                    <form action="mvc" role="form" id="form" name="form" method="POST">
                        <input type="hidden" name="logic" value="EditPeripheral">
                        <input type="hidden" name="mId" value="${param.mId}">
                        <input type="hidden" name="machineName" value="${param.machineName}">
                        <input type="hidden" name="pId" value="${param.pId}">
                        <div class="form-group">
                            <label for="Name">Nome:</label>
                            <input type="text" class="form-control" id="name" name="name" value="${param.pName}">
                        </div>
                        <div class="form-group">
                            <label for="Patrimony">Patrimônio</label>
                            <input type="text" class="form-control" id="patrimony" name="patrimony" value="${param.pPatrimony}">
                        </div>
                        <input type="submit" class="btn btn-success">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
