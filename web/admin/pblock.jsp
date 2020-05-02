<%@page import="java.sql.*,java.util.*"%>
 <%
        try
        { 
            String pcode=request.getParameter("id");
            String rel=request.getParameter("rel");
            String email=null;
            Cookie c[]=request.getCookies();
            for(int i=0;i<c.length;i++){
                if(c[i].getName().equals("product")){
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
               st.execute("update product set block='Unblock' where product_code='"+pcode+"'"); 
            }
            
            else{
                
                st.execute("update product set block='Block' where product_code='"+pcode+"'"); 
            }
        } 
        catch(Exception e)
                         {
                          out.println(e.getMessage());        
                         } 
 %>                    