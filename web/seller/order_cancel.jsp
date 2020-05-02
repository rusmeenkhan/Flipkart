
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
        String order_id=request.getParameter("id");
        String pcode=request.getParameter("pcode");
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
        Statement st=cn.createStatement();  
        st.execute("update orders set confirmation_status='cancel' where order_id='"+order_id+"' AND pcode='"+pcode+"'");
        cn.close();
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
%>