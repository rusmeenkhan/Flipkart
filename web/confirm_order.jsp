
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
            String ucode=null;
            int quantity=0;
            String pcode=null;
            int No_of_item=0;
            String order_id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st=cn.createStatement();  
            ResultSet rs=st.executeQuery("select * from orders where order_id='"+order_id+"'");
            if(rs.next())
               {
                ucode=rs.getString("ucode"); 
                quantity=rs.getInt("quantity");
                pcode=rs.getString("pcode");
               }
            ResultSet rs1=st.executeQuery("select * from product where product_code='"+pcode+"'");
            if(rs1.next())
               {
                  No_of_item=rs1.getInt("No_of_item");
               }
            No_of_item=No_of_item-quantity;
            st.execute("Delete from temp where ucode='"+ucode+"'");
            st.execute("Delete from temp_address where ucode='"+ucode+"'");
            st.execute("update product set No_of_item='"+No_of_item+"' where  product_code='"+pcode+"'"); 
            st.execute("update orders set confirmation_status='confirm' where order_id='"+order_id+"'");        
            response.sendRedirect("payment.jsp?con_id="+order_id);
            cn.close();
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
    %>