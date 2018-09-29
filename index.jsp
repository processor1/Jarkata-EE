<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Welcome/Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <style type="text/css">
            #sub,#rst{
                margin:6px;
            }
            body{
                margin-left:400px;
                margin-right:400px;
                margin-top:50px;
            }
        </style>
    </head>
    <body>
        <div class="jumbotron">
            <%
                session.removeAttribute("userID");
                session.invalidate();
            %>
            <center>
                <form action="http://localhost:8080/App1/LoginController" method="POST">
                    <fieldset>
                        <input type="text"  name="username" placeholder="User Name" class="form-control" required>
                        <br/>
                        <input type="password" name="userpassword" placeholder="User Password" class="form-control" required>
                        <br/>
                        <input type="submit" id="sum" class="btn btn-primary" value="Login"><input type="reset" id="rst" class="btn btn-danger" value="Clear">
                    </fieldset>
                </form>

            </center>
            <pre><a href="#"  title="New Help Password">Forgot Password</a></pre>
        </div>

</html>
