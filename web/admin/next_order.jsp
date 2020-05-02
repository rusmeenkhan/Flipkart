<%@page import="java.sql.*,java.util.*"%>
    <%  
        int id=Integer.parseInt(request.getParameter("id"));
        int start=id*4+1;          
    %>
    <div class="privacy py-sm-5 py-4" id="rusmeen">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>All </span>Orders
			</h3>
			   <div class="table-responsive">
					<table class="timetable_sub">
						<thead>
							<tr>
                                                            <th>product Name</th>
                                                            <th>order id</th>                                                               
                                                            <th>Cancel</th>
                                                                
							</tr>
						</thead>
						<tbody>
							
                                                            <%
                                                               int count=0;
                                                               Class.forName("com.mysql.jdbc.Driver");
                                                               Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                                                               Statement st1=cn1.createStatement();  
                                                               ResultSet rs2=st1.executeQuery("select count(*) from orders");
                                                               if(rs2.next()){
                                                                 count=rs2.getInt(1);  
                                                               }
                                                               ResultSet rs1=st1.executeQuery("select * from orders  limit "+start+",5");
                                                               while(rs1.next())
                                                                 { 
                                                                     String sn=rs1.getString("sn");
                                                                     String pcode=rs1.getString("pcode");
                                                                     String pname=rs1.getString("pname");
                                                                     String order_id=rs1.getString("order_id");
                                                            %>
                                                            <tr class="rem1" id="d_<%=order_id%>_<%=pcode%>">
                                                               <td class="invert" id="<%=pcode%>"><%=pname%></td>
                                                                <td class="invert"><%=order_id%></td>
                                                              
                                                                <td class="invert"><button id="<%=order_id%>" rel="<%=pcode%>" class="btn btn-danger" style="background-color:red;color:white;border:none">Cancel</button></td>
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
                            <button id="<%=id+1%>" class="btn btn-primary next" style="margin-left:1150px"> next </button>    
                        <%
                        }
                        else{
                        %>
                        <button id="<%=id-1%>" class="btn btn-primary previous" style="margin-left:-50px"> previous </button>
                            <%
                            if(id<pages-1){
                        %>
                        <button id="<%=id+1%>" class="btn btn-primary next" style="margin-left:1150px"> next </button>
                        <%
                            }
                        }
                        %>
			
		</div>
	</div>
    