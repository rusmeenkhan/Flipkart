<%-- 
    Document   : check
    Created on : 18 Dec, 2018, 3:34:16 PM
    Author     : Rusmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<%
    String email=null;
    String pass=null;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue();
            break;
        }
    }
    if(email==null){
        if(request.getParameter("email")==null){
            response.sendRedirect("index.jsp?err=1");
        }
        else{
            email=request.getParameter("email");
        }
    }
    if(request.getParameter("pass")==null){
        response.sendRedirect("index.jsp?pass required");
    }
    else{
        pass=request.getParameter("pass");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
                        Statement st=cn.createStatement();
                        ResultSet rs=st.executeQuery("select * from user where Email='"+email+"' AND block='Block'");
                        if(rs.next()){
                            if(rs.getString("pass").equals(pass)){
                                Cookie co=new Cookie("user",email);
                                co.setMaxAge(6000);
                                response.addCookie(co);
                                session.setAttribute(email,pass);
                                session.setMaxInactiveInterval(1000);
                                response.sendRedirect("index.jsp");
                            }
                            else{
                                response.sendRedirect("index.jsp?passnotmatch");
                            }
                        }
                        else{
                            response.sendRedirect("index.jsp?UserBlocked");
                            //out.println("User Blocked");
                        }
                }
                catch(Exception e){
                    out.println(e.getMessage());
                }
            }
%>
