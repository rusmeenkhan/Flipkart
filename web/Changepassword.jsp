<%-- 
    Document   : changepassword
    Created on : 22 Dec, 2018, 4:58:18 PM
    Author     : rusmeen khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
                try
                    {
                                String email=null;
                                Cookie c[]=request.getCookies();
                                for(int i=0;i<c.length;i++)
                                {
                                    if(c[i].getName().equals("user"))
                                    {
                                        email=c[i].getValue();
                                        break;
                                    }
                                }
                                if(email==null)
                                {
                                    response.sendRedirect("index.jsp");
                                }
                              else
                                    {
                                            String ucode=request.getParameter("id");
                                            String pass=request.getParameter("cp");
                                            String np=request.getParameter("np");
                                            String rp=request.getParameter("rp");
                                            if(np.equals(rp))
                                            {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Flipkart","root","");
                                                    Statement st = cn.createStatement();
                                                    ResultSet rs=st.executeQuery("select * from user where ucode='"+ucode+"'");
                                                    if(rs.next())
                                                     {
                                                            if(rs.getString("pass").equals(pass))
                                                            {
                                                              st.execute("update user set pass='"+np+"' where ucode='"+ucode+"'");
                                                              response.sendRedirect("index.jsp?passwordchanged");
                                                              out.println("Password changed Successfully");
                                                            }

                                                            else
                                                               {
                                                                 response.sendRedirect("ChangePassword.jsp?current password not match");
                                                                }
                                                     }
                                                    else
                                                    {
                                                      response.sendRedirect("index.jsp?email invaid");  
                                                    }
                                            }
                                            else
                                            {
                                               response.sendRedirect("ChangePassword.jsp? password  mismatch"); 
                                            }
                                        }   
                    }
                    catch(Exception e)
                    {
                      out.println(e.getMessage());  
                    }
                                %>
    </body>
</html>