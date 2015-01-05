<%-- 
    Document   : login
    Created on : 12/12/2014, 15:51:03
    Author     : administrador-fae
--%>
<%

    if (session.getAttribute("username") != null) {
        response.sendRedirect("index.jsp");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Machine System Login</title>
        <link rel="stylesheet" href="Css/bootstrap.min.css">
        <script src="lib/sweet-alert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="lib/sweet-alert.css">
        <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
        <script type="text/javascript">
            function errorMessage() {

                swal({title: "Ops!", text: "Usuário ou senha não correspondem!", type: "error",
                    confirmButtonColor: "#DD6B55", confirmButtonText: "OK", closeOnConfirm: false});

            }
        </script>

    </head>
    <c:if test="${not empty error}">
        <body style="padding-top: 100px;" onload="errorMessage()">
    </c:if>
    <c:if test="${empty error}">
        <body style="padding-top: 100px;">
    </c:if>
        <div class="container">
            <div class="row">
                <div class="col-lg-offset-4 col-xs-12 col-lg-4">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title">Sistemas de Máquinas FAE - Login</h1>
                        </div>
                        <div class="panel-body">
                            <form role="form" action="mvc" method="POST">
                                <input type="hidden" name="logic" value="Login" />
                                <div class="form-group">
                                    <!--<label for="User">Usuário</label>-->
                                    <input type="text" class="form-control" id="User" name="user" placeholder="Usuário">
                                </div>
                                <div class="form-group">
                                    <!--<label for="Pwd">Senha</label>-->
                                    <input type="password" class="form-control" id="Pwd" name="pwd" placeholder="Senha">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">Entrar <span class="glyphicon glyphicon-arrow-right"></span></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
