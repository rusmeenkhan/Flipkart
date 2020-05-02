<%@page import="java.sql.*"%>
<%
            try
               {
                   String product_code=request.getParameter("Product");
                   //out.println(product_code);
                   int quantity=Integer.parseInt(request.getParameter("quantity"));
                   int No_of_item=0;
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root",""); 
                   Statement st = cn.createStatement();
                   ResultSet rs=st.executeQuery("select * from product where product_code='"+product_code+"'");
                   if(rs.next()){
                       No_of_item=rs.getInt("No_of_item");
                   }
                   No_of_item=No_of_item+quantity;
                   st.execute("update product set No_of_item='"+No_of_item+"' where product_code='"+product_code+"'");
                   response.sendRedirect("index.jsp?addedsuccessfully");
                   cn.close();
               }
               catch(Exception e)
               {
                   out.println(e.getMessage());
               }
                                
         %>
  
