<%@page import="java.sql.*"%>
<%
            try
               {
                    String pcode=request.getParameter("pcode");
                    String Title=request.getParameter("Title");
                    String Description=request.getParameter("Description");
                    String ucode=null;
                    String email=null;
                    Cookie c[]=request.getCookies();
                    for(int i=0;i<c.length;i++)
                    {
                      if(c[i].getName().equals("user"))
                      {
                          email=c[i].getValue();
                          break;
                      }
                    }
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root",""); 
                    Statement st=cn.createStatement();
                    ResultSet rs=st.executeQuery("select * from user where Email='"+email+"'");
                    if(rs.next()){
                        ucode=rs.getString("ucode");
                    }
                    ResultSet rs1=st.executeQuery("select * from Review where ucode='"+ucode+"' AND pcode='"+pcode+"'");
                   if(rs1.next()){
                       st.execute("update Review set Title='"+Title+"',Description='"+Description+"' where pcode='"+pcode+"' AND ucode='"+ucode+"'"); 
                   }
                   else{
                        PreparedStatement ps=cn.prepareStatement("insert into Review (Title,Description,ucode,pcode) values(?,?,?,?)");
                        ps.setString(1,Title);
                        ps.setString(2,Description);
                        ps.setString(3,ucode);
                        ps.setString(4,pcode);
                        ps.execute();
                   }
                   cn.close();
                   response.sendRedirect("index.jsp?Review=1");
               }
               catch(Exception e)
               {
                   out.println(e.getMessage());
               }
                                
         %>
  
