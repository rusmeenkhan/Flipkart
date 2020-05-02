<%-- 
    Document   : check
    Created on : 18 Dec, 2018, 3:34:16 PM
    Author     : Rusmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<%
    try{
        String order_id=request.getParameter("id");
        String uscode=null;
        Cookie c1[]=request.getCookies();
        for(int i=0;i<c1.length;i++){
            if(c1[i].getName().equals("nuser")){
                uscode=c1[i].getValue();
                break;
            }
        }  
        String email=null;
        String pass=null;
        Cookie c[]=request.getCookies();
        for(int i=0;i<c.length;i++){
            if(c[i].getName().equals("user")){
                email=c[i].getValue();
                break;
            }
        }
        if(email==null){
            if(request.getParameter("email")==null){
                response.sendRedirect("index.jsp?err=1");
            }
            else{
                email=request.getParameter("email");
            }
        }
        if(request.getParameter("pass")==null){
            response.sendRedirect("index.jsp?pass required");
        }
        else{
                pass=request.getParameter("pass");    
                String pcode=null;
                int quantity=0;
                int price=0;
                String size=null;
                String seller_code=null;
                String product_name=null;
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("select * from user where Email='"+email+"' AND block=0");
                if(rs.next()){
                    if(rs.getString("pass").equals(pass)){
                        String ucode=rs.getString("ucode"); 
                        Cookie co=new Cookie("user",email);
                        co.setMaxAge(6000);
                        response.addCookie(co);
                        session.setAttribute(email,pass);
                        session.setMaxInactiveInterval(1000);
                        Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
                        Statement st1=cn1.createStatement();
                        ResultSet rs2=st1.executeQuery("select * from temp where ucode='"+uscode+"'");
                        while(rs2.next())
                        { 
                            pcode=rs2.getString("pcode"); 
                            Connection cn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
                            Statement st2=cn2.createStatement();
                            ResultSet rs4=st2.executeQuery("select * from product where product_code='"+pcode+"'");
                            while(rs4.next())
                            { 
                                seller_code=rs4.getString("seller_code");
                                product_name=rs4.getString("product_name");
                                size=rs4.getString("size");
                            }
                            Statement st4=cn2.createStatement();
                            ResultSet rs3=st4.executeQuery("select * from temp where ucode='"+uscode+"' AND pcode='"+pcode+"'");
                            if(rs3.next())
                            { 
                                quantity=rs3.getInt("quantity");
                                price=rs3.getInt("price");
                            }
                            String Name=null;
                            String mobile=null;
                            String Email=null;
                            String landmark=null;
                            String city=null;
                            String addresstype=null;
                            Connection cn3=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
                            Statement st3=cn3.createStatement();
                            ResultSet rs1=st3.executeQuery("select * from temp_address where ucode='"+uscode+"'");
                            while(rs1.next())
                            {
                                Name=rs1.getString("Name");
                                mobile=rs1.getString("mobile");
                                Email=rs1.getString("email");
                                landmark=rs1.getString("landmark");
                                city=rs1.getString("city");
                                addresstype=rs1.getString("address_type"); 
                            }
                            Connection cn4=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                            PreparedStatement ps=cn4.prepareStatement("insert into orders (uname,Email,pcode,ucode,mobile,city,landmark,addresstype,order_id,seller_code,quantity,price,pname,size) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                            ps.setString(1,Name);
                            ps.setString(2,Email);
                            ps.setString(3,pcode);
                            ps.setString(4,ucode);
                            ps.setString(5,mobile);
                            ps.setString(6,city);
                            ps.setString(7,landmark);
                            ps.setString(8,addresstype);
                            ps.setString(9,order_id);
                            ps.setString(10,seller_code);
                            ps.setInt(11,quantity);
                            ps.setInt(12,price);
                            ps.setString(13,product_name);
                            ps.setString(14,size);
                            ps.execute();
                            cn.close();
                        }
                        st1.execute("update temp set ucode='"+ucode+"' where ucode='"+uscode+"'");
                        st1.execute("update temp_address set ucode='"+ucode+"' where ucode='"+uscode+"'");
                        response.sendRedirect("payment.jsp?id="+order_id);                                
                    }
                    else{
                        response.sendRedirect("index.jsp?passnotmatch");   
                    }
               }
               else{
                    response.sendRedirect("index.jsp?UserBlocked");
                    //out.println("User Blocked");
               }
        }
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
%>
