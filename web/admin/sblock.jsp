<%@page import="java.sql.*,java.util.*"%>
 <%
        try
        { 
            String scode=request.getParameter("id");
            String rel=request.getParameter("rel");
            String email=null;
            Cookie c[]=request.getCookies();
            for(int i=0;i<c.length;i++){
                if(c[i].getName().equals("seller")){
                    email=c[i].getValue();      
                    break;
                }
            }     
            //out.println(email);
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st = cn.createStatement();
            if(rel.equals("Block"))
            {
               st.execute("update seller set block='Unblock' where scode='"+scode+"'"); 
            }
            
            else{
                
                st.execute("update seller set block='Block' where scode='"+scode+"'"); 
            }
        } 
        catch(Exception e)
                         {
                          out.println(e.getMessage());        
                         } 
 %>                    