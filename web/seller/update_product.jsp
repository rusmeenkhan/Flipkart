<%-- 
    Document   : update
    Created on : 22 Dec, 2018, 5:12:50 PM
    Author     : rusmeen khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
                                String pcode=request.getParameter("pcode");
                                String scode=request.getParameter("scode");
                                String email=null;
                                Cookie c[]=request.getCookies();
                                for(int i=0;i<c.length;i++)
                                {
                                    if(c[i].getName().equals("seller"))
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
                                            //out.println(ucode);
                                            String product_name=request.getParameter("product_name");
                                            String Brand=request.getParameter("Brand");
                                            String Category=request.getParameter("Category");
                                            String Subcategory=request.getParameter("Subcategory");
                                            String No_of_item=request.getParameter("No_of_item");
                                            String MRP=request.getParameter("MRP");
                                            String Offer_price=request.getParameter("Offer_price");
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root",""); 
                                            Statement st = cn.createStatement();
                                            st.execute("update product set product_name='"+product_name+"',Brand='"+Brand+"',Category='"+Category+"',No_of_item='"+No_of_item+"',MRP='"+MRP+"',Offer_price='"+Offer_price+"' where product_code='"+pcode+"' AND seller_code='"+scode+"'");
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
