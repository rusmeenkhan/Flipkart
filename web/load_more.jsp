<%@page import="java.sql.*,java.util.*"%>
<%  
            String id=request.getParameter("id");
            String uscode=request.getParameter("ucode");
            String subccode=request.getParameter("subccode");
            int start=Integer.parseInt(id)*3+1;  
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
            Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st1=cn1.createStatement();  
            ResultSet rs=st1.executeQuery("select * from user where Email='"+email+"'");
            if(rs.next()){
                 ucode=rs.getString("ucode");
            }
            ResultSet rs1=st1.executeQuery("select * from product where subcategory_code='"+subccode+"' limit "+start+",4");
            while(rs1.next())
                {
                    String scode=rs1.getString("seller_code");
                    String sn=rs1.getString("sn");
                    String pcode=rs1.getString("product_code");
                    String product_name=rs1.getString("product_name"); 
                    String MRP=rs1.getString("MRP");
                    String offer_price=rs1.getString("offer_price");
                    subccode=rs1.getString("subcategory_code");
                    %>
                      <div class="col-md-3 product-men mt-5" id="<%=pcode%>_d">
			 <div class="men-pro-item simpleCart_shelfItem">
			      <div class="men-thumb-item text-center">
                                    <img src="seller/products/1_<%=pcode%>.jpg" alt="" style="width:220px;height:300px">
                                    <div class="men-cart-pro">
					<div class="inner-men-cart-pro">
					   <a href="single.jsp?id=<%=pcode%>&scode=<%=scode%>" class="link-product-add-cart">Quick View</a>
					</div>
				    </div>											
			      </div>
			      <div class="item-info-product text-center border-top mt-3">
				    <h4 class="pt-1">
				      <a href="single.jsp?id=<%=pcode%>"><%=product_name%></a>
				    </h4>
			            <div class="info-product-price my-2">
					<span class="item_price"><%=offer_price%> rs/-</span>
					   <del><%=MRP%> rs/-</del>
				    </div>
				   <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                     <button id="p_<%=pcode%>" rel="Add" ucode="<%=uscode%>" class="btn btn-primary">Add to cart </button>	
                                   </div>
                              </div>
			 </div>
                    </div>              
               <%
                    }                    
                %>
                
   
    