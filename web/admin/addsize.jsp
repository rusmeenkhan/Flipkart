        <%@page import="java.sql.*,java.util.*"%>
        <%
                try{
                    String size=request.getParameter("size");
                    String Subcategory=request.getParameter("Subcategory");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root",""); 
                    PreparedStatement ps=cn.prepareStatement("insert into size (Subcategory,size) values(?,?)");
                    ps.setString(1,Subcategory);
                    ps.setString(2,size);
                    ps.execute();
                    cn.close();
                    response.sendRedirect("size.jsp?size_added");
            }
            catch(Exception e){
                out.println(e.getMessage());
            }
            
        %>
