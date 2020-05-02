<%@page import="java.sql.*,java.util.*"%>
 <%
        try
        { 
            String status=request.getParameter("rel").trim();
            String scode=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st = cn.createStatement();
            if(status.equals("Approve")){
               st.execute("update seller set status=1 where scode='"+scode+"'"); 
            }
            else{
                st.execute("update seller set status=0 where scode='"+scode+"'");

            }
                
        } 
        catch(Exception e){
                out.println(e.getMessage());        
        } 
 %>                    