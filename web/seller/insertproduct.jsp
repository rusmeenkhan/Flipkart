
<%@page import="java.sql.*,java.util.*"%>
    <%
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
                    if(request.getParameter("product_name")==null||request.getParameter("Brand")==null||request.getParameter("category")==null||request.getParameter("subcategory")==null||request.getParameter("no_of_item")==null||request.getParameter("MRP")==null||request.getParameter("offer_price")==null||request.getParameter("Discount")==null||request.getParameter("Specification")==null)
                    {
                        response.sendRedirect("index.jsp?allfieldrequired1");
                    }
                    else{ 
                        String Product_name=request.getParameter("product_name");
                        String Brand=request.getParameter("Brand");
                        String Category_code=request.getParameter("category");
                        String subcategory_code=request.getParameter("subcategory");
                        String no_of_item=request.getParameter("no_of_item");
                        String MRP=request.getParameter("MRP");
                        String offer_price=request.getParameter("offer_price");
                        String Discount=request.getParameter("Discount");
                        String size=request.getParameter("size");
                        String Specification=request.getParameter("Specification");
                        out.println(Specification);
                        ResultSet rs1=st.executeQuery("select * from subcategory where subccode='"+subcategory_code+"'");
                        if(rs1.next()){
                            String category=rs1.getString("Category");
                            String Subcategory=rs1.getString("Subcategory");
                        try{   
                           String pcode="";
                           LinkedList l=new LinkedList();
                           for(char c='a';c<='z';c++)
                           {
                               l.add(c+"");
                           }
                            for(char c='A';c<='Z';c++)
                           {
                               l.add(c+"");
                           }
                             for(char c='0';c<='9';c++)
                           {
                               l.add(c+"");
                           }
                           Collections.shuffle(l);
                            for(int i=1;i<=5;i++)
                           {
                              pcode+=l.get(i);

                           }
                            String Brand_code="";
                           LinkedList l1=new LinkedList();
                           for(char c1='a';c1<='z';c1++)
                           {
                               l1.add(c1+"");
                           }
                            for(char c1='A';c1<='Z';c1++)
                           {
                               l1.add(c1+"");
                           }
                             for(char c1='0';c1<='9';c1++)
                           {
                               l1.add(c1+"");
                           }
                           Collections.shuffle(l);
                            for(int i=1;i<=5;i++)
                           {
                              Brand_code+=l1.get(i);

                           }
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                            PreparedStatement ps=cn1.prepareStatement("insert into product (product_name,Category_code,Subcategory_code,product_code,Brand,Brand_code,seller_name,seller_code,No_of_item,MRP,offer_price,Discount,Specification,Category,Subcategory,size) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                            ps.setString(1,Product_name);
                            ps.setString(2,Category_code);
                            ps.setString(3,subcategory_code);
                            ps.setString(4,pcode);
                            ps.setString(5,Brand);
                            ps.setString(6,Brand_code);
                            ps.setString(7,Seller_Name);
                            ps.setString(8,scode);
                            ps.setString(9,no_of_item);
                            ps.setString(10,MRP);
                            ps.setString(11,offer_price);
                            ps.setString(12,Discount);
                            ps.setString(13,Specification);
                            ps.setString(14,category);
                            ps.setString(15,Subcategory);
                            ps.setString(16,size);
                            ps.execute();
                            cn.close();
                            response.sendRedirect("image.jsp?pid="+pcode+"&sn=1");
                            }
                            catch(Exception e)
                            {
                                out.println(e.getMessage());
                            }
                        }      
                }
            }
    %>