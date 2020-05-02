
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
        String pincode=request.getParameter("pin");
        String scode=request.getParameter("scode");                    
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
        Statement st=cn.createStatement();  
        st.execute("delete  from Location where pincode='"+pincode+"' AND scode='"+scode+"'");
        cn.close();
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
%>