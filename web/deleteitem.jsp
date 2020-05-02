
<%@page import="java.sql.*,java.util.*"%>
<%
            String pcode=request.getParameter("id");
            String email=null;
            Cookie cu[]=request.getCookies();
            for(int i=0;i<cu.length;i++)
            {
              if(cu[i].getName().equals("user"))
              {
                  email=cu[i].getValue();
                  //out.println(email);
                  break;
              }
            }
            
            if(email==null)
            {   
                
                    String uscode=null;
                    Cookie ch[]=request.getCookies();
                    for(int i=0;i<ch.length;i++)
                    {
                      if(ch[i].getName().equals("nuser"))
                      {
                          uscode=ch[i].getValue();
                          break;
                      }
                    }
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                    Statement st1=cn1.createStatement();  
                    st1.execute("delete from temp where pcode='"+pcode+"'");
                    ResultSet rs2=st1.executeQuery("select count(*) from temp where ucode='"+uscode+"'");
                    if(rs2.next())
                       { 
                           int No_of_item=rs2.getInt(1);
                           out.println(No_of_item);
                       }
                    cn1.close();                    
            }
            else
            {   
                     String ucode=null; 
                     Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                     Statement st=cn.createStatement();  
                     ResultSet rs=st.executeQuery("select * from user where email='"+email+"'");
                     if(rs.next())
                     {
                          ucode=rs.getString("ucode");
                     }           
                     Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                     Statement st1=cn1.createStatement();  
                     st1.execute("delete from temp where pcode='"+pcode+"'");
                     ResultSet rs2=st1.executeQuery("select count(*) from temp where ucode='"+ucode+"'");
                     if(rs2.next())
                        { 
                            int No_of_item=rs2.getInt(1);
                            out.println(No_of_item);
                        }
                     
                     cn1.close();
            }
                     //response.sendRedirect("checkout.jsp");
    %>