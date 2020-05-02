<%@page import="java.sql.*"%>
         <%
                                String subccode=request.getParameter("id"); 
                                String Subcategory=request.getParameter("Subcategory");
                                String email=null;
                                Cookie c[]=request.getCookies();
                                for(int i=0;i<c.length;i++)
                                {
                                    if(c[i].getName().equals("admin"))
                                    {
                                        email=c[i].getValue();
                                        break;
                                    }
                                }
                                if(email==null)
                                {
                                    response.sendRedirect("index.jsp?login_required");
                                }
                                else
                                {
                                     try
                                        {                                          
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root",""); 
                                            Statement st = cn.createStatement();
                                            st.execute("update subcategory set Subcategory='"+Subcategory+"' where subccode='"+subccode+"'");
                                            response.sendRedirect("index.jsp?updatesuccessfull");
                                            cn.close();
                                        }
                                        catch(Exception e)
                                        {
                                            out.println(e.getMessage());
                                        }
                                }
                                %>
    </body>
</html>
