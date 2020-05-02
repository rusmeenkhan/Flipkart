<%@page import="java.sql.*"%>
<%
            try
               {
                    String scode=request.getParameter("rel");
                    String Rating=request.getParameter("id");
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
                    ResultSet rs1=st.executeQuery("select * from seller_rating where ucode='"+ucode+"' AND scode='"+scode+"'");
                   if(rs1.next()){
                       st.execute("update seller_rating set Rating='"+Rating+"' where scode='"+scode+"' AND ucode='"+ucode+"'"); 
                   }
                   else{
                        PreparedStatement ps=cn.prepareStatement("insert into seller_rating (ucode,scode,Rating) values(?,?,?)");
                        ps.setString(1,ucode);
                        ps.setString(2,scode);
                        ps.setString(3,Rating);
                        ps.execute();
                   }
                   cn.close();
               }
               catch(Exception e)
               {
                   out.println(e.getMessage());
               }
                                
         %>
  
