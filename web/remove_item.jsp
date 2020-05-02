
<%@page import="java.sql.*,java.util.*"%>

<%   
    try{
            String ucode=request.getParameter("id");     
            String pcode=request.getParameter("rel"); 
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st=cn.createStatement();  
            st.execute("delete from temp where ucode='"+ucode+"' AND pcode='"+pcode+"'"); 
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
%>
                
   
    