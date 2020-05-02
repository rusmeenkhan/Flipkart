
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
        String order_id=request.getParameter("id");
        String pcode=request.getParameter("pcode");
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
        Statement st=cn1.createStatement();  
        st.execute("update orders set confirmation_status='cancel' where order_id='"+order_id+"' AND pcode='"+pcode+"'");
        cn1.close();
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
%>