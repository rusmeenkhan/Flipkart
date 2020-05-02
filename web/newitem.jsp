
<%@page import="java.sql.*,java.util.*"%>

<%         try{ 
            String subccode=request.getParameter("id");           
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st1=cn1.createStatement();  
            ResultSet rs1=st1.executeQuery("select * from product where subcategory_code='"+subccode+"' AND product_code NOT IN (select pcode from temp)  order by RAND()  limit 1");
            while(rs1.next())
                {
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
                                    <img src="seller/products/<%=pcode%>.jpg" alt="" style="width:220px;height:300px">
                                    <div class="men-cart-pro">
					<div class="inner-men-cart-pro">
					   <a href="single.jsp?id=<%=pcode%>" class="link-product-add-cart">Quick View</a>
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
				   <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">                                                                                           														<input type="hidden" name="cmd" value="_cart" />
					<button id="<%=pcode%>"  rel="<%=subccode%>" class="btn btn-primary">Add to cart</button>	                                           
				   </div>
                              </div>
			 </div>
                    </div>              
               <%
                    } 
                    cn1.close();
                    }
                    catch(Exception e){
                    out.println(e.getMessage());
                    }
                %>
                
   
    