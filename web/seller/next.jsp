<%@page import="java.sql.*,java.util.*"%>
    <%  
        int id=Integer.parseInt(request.getParameter("id"));
        String seller_code=request.getParameter("rel");
        int start=id*4+1;          
    %>
    <div class="privacy py-sm-5 py-4" id="rusmeen">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>Pro</span>Ducts
			</h3>
			  <div class="table-responsive">
					<table class="timetable_sub">
						<thead>
							<tr>
                                                            <th>product Name</th>
                                                            <th>Quantity</th>
                                                            <th>price</th>
                                                            <th>Category</th>
                                                            <th>Sub category</th>
                                                            <th>Delete Product</th>
                                                            <th>Edit Product</th>
							</tr>
						</thead>
						<tbody>
							
                                                            <%
                                                                int ic=0;
                                                               Class.forName("com.mysql.jdbc.Driver");
                                                               Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                                                               Statement st1=cn1.createStatement(); 
                                                               int count=0;
                                                               ResultSet rs2=st1.executeQuery("select count(*) from product where Block='Block' AND seller_code='"+seller_code+"'");
                                                               if(rs2.next()){
                                                                 count=rs2.getInt(1);  
                                                               }
                                                               ResultSet rs1=st1.executeQuery("select * from product where Block='Block' AND seller_code='"+seller_code+"' limit "+start+",5");
                                                               while(rs1.next())
                                                                 { 
                                                                     String product_name=rs1.getString("product_name");
                                                                     String pcode=rs1.getString("product_code");
                                                                     String price=rs1.getString("Offer_price");
                                                                     String No_of_item=rs1.getString("No_of_item");
                                                                     String Category=rs1.getString("Category");
                                                                     String subcategory=rs1.getString("Subcategory");
                                                                    
                                                            %>
                                                            <tr class="rem1" id="c_<%=pcode%>">
                                                                <td class="invert"><%=product_name%></td>
                                                                <td class="invert"><%=No_of_item%></td>
                                                                <td class="invert"><%=price%></td>
                                                                <td class="invert"><%=Category%></td>
                                                                <td class="invert"><%=subcategory%></td>
                                                                <td class="invert"><button id="d_<%=pcode%>" rel="<%=seller_code%>" class="btn btn-danger" style="background-color:red;color:white;border:none">Delete Product</button></td>
                                                                <td class="invert"><a href="edit_product.jsp?id=<%=pcode%>&&scode=<%=seller_code%>" class="btn btn-danger" style="background-color:blue;color:white;border:none">Edit Product</a></td>
                                                            </tr>
                                                           <% 
                                                              }
                                                            %>
							
							
						</tbody>
					</table>
				</div>
                        <%
                            int pages=count/5;
                            if(id==0||id==-1){
                        %>                               
                        <button id="<%=id+1%>" rel="<%=seller_code%>" class="btn btn-primary next" style="margin-left:1150px"> next </button>    
                        <%
                        }
                        else{
                        %>
                        <button id="<%=id-1%>" rel="<%=seller_code%>" class="btn btn-primary previous" style="margin-left:-50px"> previous </button>
                            <%
                            if(id<pages){
                        %>
                        <button id="<%=id+1%>" rel="<%=seller_code%>" class="btn btn-primary next" style="margin-left:1150px"> next </button>
                        <%
                            }
                        }
                        %>
			
		</div>
                                
	</div>
    