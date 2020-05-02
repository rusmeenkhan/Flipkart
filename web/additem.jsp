
<%@page import="java.sql.*,java.util.*"%>
<%
            String pcode=request.getParameter("id");
            String email=null;
            String uscode=null;
            Cookie cu[]=request.getCookies();
            for(int i=0;i<cu.length;i++){
              if(cu[i].getName().equals("user")){
                  email=cu[i].getValue();
                  break;
              }
            }
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st=cn.createStatement(); 
            if(email==null){   
                Cookie ch[]=request.getCookies();
                  for(int i=0;i<ch.length;i++){
                    if(ch[i].getName().equals("nuser")){
                        uscode=ch[i].getValue();
                        break;
                    }
                  }
            }
            else{
                String ucode=null;  
                ResultSet rs=st.executeQuery("select * from user where email='"+email+"'");
                if(rs.next()){
                     ucode=rs.getString("ucode");
                }  
                uscode=ucode; 
            } 
             ResultSet rs3=st.executeQuery("select * from temp where pcode='"+pcode+"' AND ucode='"+uscode+"'");
                    if(rs3.next()){
                           st.execute("delete  from temp where ucode='"+uscode+"'AND pcode='"+pcode+"' ");
                           ResultSet rs2=st.executeQuery("select count(*) from temp where ucode='"+uscode+"' AND pcode='"+pcode+"'");
                             if(rs2.next()){ 
                                    int No_of_item=rs2.getInt(1);
                                    out.println(No_of_item+"_Add to cart");
                                }
                    }
                    else{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                        Statement st1=cn1.createStatement();
                        ResultSet rs1=st1.executeQuery("select * from product where product_code='"+pcode+"'");
                        if(rs1.next()){
                                int price=Integer.parseInt(rs1.getString("Offer_price"));
                                PreparedStatement ps=cn1.prepareStatement("insert into temp (pcode,ucode,price) values(?,?,?)");
                                ps.setString(1,pcode);
                                ps.setString(2,uscode); 
                                ps.setInt(3,price);
                                ps.execute(); 
                                ResultSet rs2=st1.executeQuery("select count(*) from temp where ucode='"+uscode+"'");
                                if(rs2.next()){ 
                                       int No_of_item=rs2.getInt(1);
                                       out.println(No_of_item+"_Remove from cart");
                                   }
                             cn1.close();
                           }
                    }        
    %>