<%@page import="java.sql.*,java.util.*"%>
    <%  
        int id=Integer.parseInt(request.getParameter("id"));
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
								<th>Product Name</th>
								<th>Category</th>
								<th>Subcategory</th>
                                                                <th>Brand</th>
                                                                <th>seller name</th>
                                                                <th>Block</th>         
							</tr>
						</thead>
						<tbody>
							
                                                            <%
                                                                int count=0;
                                                               Class.forName("com.mysql.jdbc.Driver");
                                                               Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                                                               Statement st=cn1.createStatement();  
                                                                ResultSet rs=st.executeQuery("select count(*) from product");
                                                               if(rs.next()){
                                                                 count=rs.getInt(1);  
                                                               }
                                                               ResultSet rs1=st.executeQuery("select * from product limit "+start+",4");
                                                               while(rs1.next())
                                                                 { 
                                                                     String pcode=rs1.getString("product_code");
                                                                     String product_name=rs1.getString("product_name"); 
                                                                     String Category=rs1.getString("Category");
                                                                     String Subcategory=rs1.getString("Subcategory");
                                                                     String Brand=rs1.getString("Brand");
                                                                     String seller_name=rs1.getString("seller_name");
                                                                     String Block=rs1.getString("Block");
                                                            %>
                                                            <tr class="rem1">
                                                                <td class="invert"><%=product_name%></td>
                                                                <td class="invert"><%=Category%></td>
                                                                <td class="invert"><%=Subcategory%></td>
                                                                <td class="invert"><%=Brand%></td>
                                                                <td class="invert"><%=seller_name%></td>
                                                                                                                               <%
                                                               if(Block.equals("Block"))
                                                               {
                                                                   %>
                                                                <td class="invert"><button id="<%=pcode%>" rel="<%=Block%>" class="btn btn-danger" style="background-color:red;color:white;border:none"><%=Block%></button></td>
                                                                <%
                                                                 }
                                                                else{
                                                                %>
                                                                  <td class="invert"><button id="<%=pcode%>" rel="<%=Block%>" class="btn btn-danger" style="background-color:blue;color:white;border:none"><%=Block%></button></td>
                                                                <%
                                                                    } 
                                                                    %>
                                                                 
                                                               </tr>
                                                              
                                                <%
                                                }
                                                %>                                                                
							
                                                         <br/>
							
						</tbody>
					</table>
				</div>
                        <%
                            int pages=count/5;
                            if(id==0||id==-1){
                        %>                               
                        <button id="<%=id+1%>" class="btn btn-primary next" style="margin-left:1150px"> next </button>    
                        <%
                        }
                        else{
                        %>
                        <button id="<%=id-1%>" class="btn btn-primary previous" style="margin-left:-50px"> previous </button>
                            <%
                            if(id<pages){
                        %>
                        <button id="<%=id+1%>" class="btn btn-primary next" style="margin-left:1150px"> next </button>
                        <%
                            }
                        }
                        %>
			
		</div>
                                
	</div>
    