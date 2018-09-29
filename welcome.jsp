<%-- 
    Document   : welcome
    Created on : Sep 28, 2018, 11:25:41 PM
    Author     : MSEP_PROCESSOR_CODEX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page  session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript">
            <!--
            function f(){
            try{
           window.location.href="index.jsp";
            
            }catch(E){
            alert(E.message);
            }
            }
        //-->
        </script>
        <title>Welcome</title>
    </head>
    <body>
        <div class="jumbotron">
            <a href="welcome.jsp">Home</a> | <a href="personentity.html">Add New Person</a> | <a  href="index.jsp" onclick="f();">Logout</a>
            <h1>Available People On-Board</h1>
            <%
                if (session.isNew()) {
                    String site = "/App1/faces/index.jsp";
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                }

            %>
            <table  class="table">
                <tr style="background: black;color: white;">
                    <th>ID</th><th>First Name</th><th>Last Name</th><th>Email Address</th><th>Password</th><th>Date</th>
                </tr>
                <%                    java.sql.Connection c = null;
                    java.sql.Statement state = null;
                    java.sql.ResultSet result = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        c = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/petcatalog", "root", "");
                        state = c.createStatement();
                        result = state.executeQuery("SELECT * From person;");

                        while (result.next()) {
                            out.println("<tr>");
                            out.println("<td>" + result.getInt("personID") + "</td>");
                            out.println("<td>" + result.getString("personfn") + "</td>");
                            out.println("<td>" + result.getString("personln") + "</td>");
                            out.println("<td>" + result.getString("personemail") + "</td>");
                            out.println("<td>" + result.getString("personpassword") + "</td>");
                            out.println("<td  style=\"background-color:black;color:white;\">" + result.getString("personDate") + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    } finally {
                        if (c != null) {
                            try {
                                c.close();
                            } catch (java.sql.SQLException ex1) {
                                out.println(ex1.getMessage());
                            }
                        }

                        if (state != null) {
                            try {
                                state.close();
                            } catch (java.sql.SQLException ex2) {
                                out.println(ex2.getMessage());
                            }
                        }

                        if (result != null) {
                            try {
                                result.close();
                            } catch (java.sql.SQLException ex3) {
                                out.println(ex3.getMessage());
                            }
                        }
                    }

                %>
            </table>

        </div>
    </body>
</html>
