<%@page import="java.sql.*,java.util.*"%>
    <%  
        int id=Integer.parseInt(request.getParameter("id"));
        int start=id*4+1;          
    %>
    <div class="privacy py-sm-5 py-4" id="rusmeen">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>U</span>sers
			</h3>
			   <div class="table-responsive">
					<table class="timetable_sub">
						<thead>
							<tr>
								<th>User Name</th>
								<th>Email</th>
                                                                <th>Block</th>
                                                                
							</tr>
						</thead>
						<tbody>
							
                                                            <%
                                                                int count=0;
                                                               Class.forName("com.mysql.jdbc.Driver");
                                                               Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                                                               Statement st=cn1.createStatement(); 
                                                               ResultSet rs2=st.executeQuery("select count(*) from user");
                                                               if(rs2.next()){
                                                                 count=rs2.getInt(1);  
                                                               }
                                                               ResultSet rs1=st.executeQuery("select * from user limit "+start+",5");
                                                               while(rs1.next())
                                                                 { 
                                                                     String sn=rs1.getString("sn");
                                                                     String uname=rs1.getString("Name"); 
                                                                     String Email=rs1.getString("Email");
                                                                     String ucode=rs1.getString("ucode");
                                                                     String Block=rs1.getString("block");
                                                            %>
                                                            <tr class="rem1">
                                                                <td class="invert"><%=uname%></td>
                                                                <td class="invert"><%=Email%></td>
                                                                <%
                                                              if(Block.equals("Block"))
                                                               {
                                                                   %>
                                                                <td class="invert"><button id="<%=ucode%>" rel="<%=Block%>" class="btn btn-danger" style="background-color:red;color:white;border:none"><%=Block%></button></td>
                                                                <%
                                                                 }
                                                                else{
                                                                %>
                                                                  <td class="invert"><button id="<%=ucode%>" rel="<%=Block%>" class="btn btn-danger" style="background-color:blue;color:white;border:none"><%=Block%></button></td>
                                                                <%
                                                                    }
                                                                   %>   
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
    