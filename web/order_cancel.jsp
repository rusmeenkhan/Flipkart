
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
        String order_id=request.getParameter("id");
        String pcode=request.getParameter("pcode");
        int quantity=0;
        int No_of_item=0;
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
        Statement st=cn.createStatement(); 
        ResultSet rs=st.executeQuery("select * from orders where order_id='"+order_id+"'  AND pcode='"+pcode+"'");
        if(rs.next()){
           quantity=rs.getInt("quantity");
        }
        ResultSet rs1=st.executeQuery("select * from product where  product_code='"+pcode+"'");
        if(rs1.next()){
           No_of_item=rs1.getInt("No_of_item");
        }
        No_of_item=No_of_item+quantity;
        st.execute("update orders set confirmation_status='cancel' where order_id='"+order_id+"' AND pcode='"+pcode+"'");
        st.execute("update product set No_of_item='"+No_of_item+"' where  product_code='"+pcode+"'");
        cn.close();
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
%>