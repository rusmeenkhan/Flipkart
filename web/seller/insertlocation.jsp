
<%@page import="java.sql.*,java.util.*"%>
    <%
        try{
                String email=null;
                Cookie ch[]=request.getCookies();
                for(int i=0;i<ch.length;i++)
                {
                  if(ch[i].getName().equals("seller"))
                  {
                      email=ch[i].getValue();
                      break;
                  }
                }
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
                 Statement st=cn.createStatement();
                 ResultSet rs=st.executeQuery("select * from seller where Email='"+email+"'");
                 if(rs.next()){
                        String scode=rs.getString("scode");
                        String Seller_Name=rs.getString("sname");
                        String Location=request.getParameter("Location");
                        String pincode=request.getParameter("pincode");
                        PreparedStatement ps=cn.prepareStatement("insert into Location (Location,pincode,scode) values(?,?,?)");
                        ps.setString(1,Location);
                        ps.setString(2,pincode);
                        ps.setString(3,scode);
                        ps.execute();
                        cn.close();
                        response.sendRedirect("places.jsp?success=1");
                }
        }
        catch(Exception e)
        {
            out.println(e.getMessage());
        }    
              
    %>