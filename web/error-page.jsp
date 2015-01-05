<%-- 
    Document   : error-page
    Created on : 15/12/2014, 15:38:58
    Author     : administrador-fae
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link rel="stylesheet" href="Css/bootstrap.min.css">
        <script src="lib/sweet-alert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="lib/sweet-alert.css">

        <script type="text/javascript">
            function errorPopUp() {
                swal({title: "Ops!", text: "Um erro ocorreu na operação anterior!", type: "error",
                    confirmButtonColor: "#DD6B55", confirmButtonText: "OK", closeOnConfirm: false},
                function () {
                    window.location = "index.jsp";
                });
            }
        </script>
    </head>
    <body style="padding-top: 100px;" onload="errorPopUp()">
        <div class="container">

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
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href='mvc?logic=Logout'>Logout <span class="glyphicon glyphicon-off"></span></a></li>
                        </ul>
                    </div>
                </div>
            </nav>

        </div>
    </body>
</html>
