<%-- 
    Document   : delete_cat
    Created on : 20 May, 2019, 4:07:57 PM
    Author     : rusmeen khan
--%>
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           try{ 
                String category_code=request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root",""); 
                Statement st = cn.createStatement();
                st.execute("update category set status=0 where ccode='"+category_code+"'");
                out.println("deleted");
                cn.close();
           }
           catch(Exception e){
               out.println(e.getMessage());
           }
        %>
    </body>
</html>
