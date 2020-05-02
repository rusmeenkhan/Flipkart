        <%@page import="java.sql.*,java.util.*"%>
        <%
            try{
                String category_code=request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root",""); 
                Statement st = cn.createStatement();
                st.execute("update category set status=0 where ccode='"+category_code+"'");
                st.execute("update subcategory set status=0 where ccode='"+category_code+"'");
                cn.close();
            }
            catch(Exception e){
                out.println(e.getMessage());
            }
            
        %>
