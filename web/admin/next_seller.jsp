<%@page import="java.sql.*,java.util.*"%>
    <%  
        int id=Integer.parseInt(request.getParameter("id"));
        int start=id*2;          
    %>
    <div class="privacy py-sm-5 py-4" id="rusmeen">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>Approved  Se</span>llers
			</h3>
			  <div class="table-responsive" >
					<table class="timetable_sub">
						<thead>
							<tr>
								<th>SL No.</th>
								<th>Seller Name</th>
								<th>Company</th>
								<th> Seller Code</th>
                                                                <th>Block</th>                                                               
							</tr>
						</thead>
						<tbody>
							
                                                            <%  
                                                                int count=0;
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                               Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                                                               Statement st=cn1.createStatement();
                                                                ResultSet rs1=st.executeQuery("select count(*) from seller");
                                                               if(rs1.next()){
                                                                 count=rs1.getInt(1);  
                                                               }
                                                               ResultSet rs2=st.executeQuery("select * from seller where status=1 limit "+start+",2");
                                                               while(rs2.next())
                                                                 { 
                                                                     String sn=rs2.getString("sn");
                                                                     String sname=rs2.getString("sname"); 
                                                                     String Company=rs2.getString("Company");
                                                                     String scode=rs2.getString("scode");
                                                                     String Block=rs2.getString("block");
                                                                     
                                                            %>
                                                            <tr class="rem1">
								<td class="invert"><%=sn%></td>
                                                                <td class="invert"><%=sname%></td>
                                                                <td class="invert"><%=Company%></td>
                                                                <td class="invert"><%=scode%></td>
                                                                                                                               <%
                                                               if(Block.equals("Block"))
                                                               {
                                                                   %>
                                                                <td class="invert"><button id="<%=scode%>" rel="<%=Block%>" class="btn btn-danger" style="background-color:red;color:white;border:none"><%=Block%></button></td>
                                                                <%
                                                                 }
                                                                else{
                                                                %>
                                                                  <td class="invert"><button id="<%=scode%>" rel="<%=Block%>" class="btn btn-danger" style="background-color:blue;color:white;border:none"><%=Block%></button></td>
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
                            int pages=count/2;
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
    