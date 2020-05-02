
<%@page import="java.sql.*,java.util.*"%>
<%
    
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
            if(email==null){
                out.println("login");
            }
            else{
                    String pcode=request.getParameter("pcode");
                    String ucode=request.getParameter("ucode");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                    Statement st=cn.createStatement(); 
                    ResultSet rs3=st.executeQuery("select * from wishlist where pcode='"+pcode+"' AND ucode='"+ucode+"'");
                    if(rs3.next()){
                            st.execute("delete  from wishlist where ucode='"+ucode+"'AND pcode='"+pcode+"' ");
                            ResultSet rs2=st.executeQuery("select count(*) from wishlist where ucode='"+ucode+"'");
                              if(rs2.next())
                                 { 
                                     int No_of_item=rs2.getInt(1);
                                     out.println(No_of_item+"_Add to wishlist");
                                 }
                    }
                    else{
                                PreparedStatement ps=cn.prepareStatement("insert into wishlist (pcode,ucode) values(?,?)");
                                ps.setString(1,pcode);
                                ps.setString(2,ucode);
                                ps.execute();
                             ResultSet rs2=st.executeQuery("select count(*) from wishlist where ucode='"+ucode+"'");
                             if(rs2.next())
                                { 
                                    int No_of_item=rs2.getInt(1);
                                    out.println(No_of_item+"_Remove from wishlist");
                                }

                             cn.close();

                    }    
            }
    %>