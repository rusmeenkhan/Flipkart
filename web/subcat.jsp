
<%@page import="java.sql.*,java.util.*"%>
<%
            String category=request.getParameter("id");
            out.println(category);
          /*  Class.forName("com.mysql.jdbc.Driver");
            Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st=cn1.createStatement();  
            ResultSet rs=st.executeQuery("select * from Subcategory where ccode='"+category+"'");
            while(rs.next())
                  {
                      String subccode=rs.getString("Subcategory");
                      out.println(subccode);
                    }
                     cn1.close();
                     //response.sendRedirect("checkout.jsp");*/
    %>