
<%@page import="java.sql.*,java.util.*"%>
<%    try{
            String value=request.getParameter("id");
            String pcode=request.getParameter("rel");
            int quantity=Integer.parseInt(request.getParameter("quantity"));
            String uscode=null;
            String ucode=null;
            String email=null;
            int No_of_item=0;
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
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
            Statement st=cn.createStatement();  
             ResultSet rs=st.executeQuery("select * from user where Email='"+email+"'");
            if(rs.next()){
                ucode=rs.getString("ucode");
            }
            ResultSet rs4=st.executeQuery("select * from product where  product_code='"+pcode+"'");
            if(rs4.next()){
               No_of_item=rs4.getInt("No_of_item");
            }
            uscode=ucode;
           if(uscode==null){ 
                for(int i=0;i<c.length;i++)
                {
                  if(c[i].getName().equals("nuser"))
                  {
                      uscode=c[i].getValue();
                      break;
                  }
                }
           }
           int price=0;
            ResultSet rs1=st.executeQuery("select * from temp where ucode='"+uscode+"' AND pcode='"+pcode+"'");
            if(rs1.next()){
                quantity=rs1.getInt("quantity");
               if(value.equals("plus")){
                   if(No_of_item>quantity){
                        quantity=quantity+1; 
                   }
               }
               else if(value.equals("minus")){
                    if(quantity>0){
                   quantity=quantity-1;
                   }  
                    else{
                      quantity=0;  
                    }
                }
            }
            ResultSet rs3=st.executeQuery("select * from product where product_code='"+pcode+"'");
            if(rs3.next()){
             price=rs3.getInt("Offer_price");
            }
            int f_price=quantity*price;
            st.execute("update temp set quantity='"+quantity+"',price='"+f_price+"' where ucode='"+uscode+"' AND pcode='"+pcode+"'");
            st.execute("update orders set quantity='"+quantity+"',price='"+f_price+"' where ucode='"+uscode+"' AND pcode='"+pcode+"'");
            ResultSet rs2=st.executeQuery("select * from temp where ucode='"+uscode+"' AND pcode='"+pcode+"'");
            if(rs2.next()){
                     quantity=rs2.getInt("quantity");
                     out.println(quantity+"_"+f_price);
            }
            cn.close();
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
                         %>