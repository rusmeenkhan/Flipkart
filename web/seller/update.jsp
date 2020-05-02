<%@page import="java.sql.*"%>
<%
            try
               {
                   String scode=request.getParameter("id");
                   String Name=request.getParameter("Name");
                   String Company=request.getParameter("company");
                   String GST=request.getParameter("GST");
                   String address=request.getParameter("address");
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root",""); 
                   Statement st = cn.createStatement();
                   st.execute("update seller set sname='"+Name+"',Company='"+Company+"',GST='"+GST+"',Address='"+address+"' where scode='"+scode+"'");
                   response.sendRedirect("index.jsp?updatesuccessfull");
                   cn.close();
               }
               catch(Exception e)
               {
                   out.println(e.getMessage());
               }
                                
         %>
  
