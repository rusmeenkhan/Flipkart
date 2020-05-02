
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
        String pcode=request.getParameter("id");
        String scode=request.getParameter("scode");                    
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
        Statement st=cn.createStatement();  
        st.execute("delete from product where product_code='"+pcode+"' AND seller_code='"+scode+"'");
        cn.close();
        out.println("deleted");
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
%>