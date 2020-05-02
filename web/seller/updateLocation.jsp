<%@page import="java.sql.*"%>
<%
            try
               {
                   String scode=request.getParameter("id");
                   String Location=request.getParameter("Location");
                   String pincode=request.getParameter("pin");
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root",""); 
                   Statement st = cn.createStatement();
                   st.execute("update Location set Location='"+Location+"' where pincode='"+pincode+"' ");
                   response.sendRedirect("index.jsp?updatesuccessfull");
                   cn.close();
               }
               catch(Exception e)
               {
                   out.println(e.getMessage());
               }
                                
         %>
  
