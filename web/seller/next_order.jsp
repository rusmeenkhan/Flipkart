<%@page import="java.sql.*,java.util.*"%>
    <%  
        int id=Integer.parseInt(request.getParameter("id"));
        String seller_code=request.getParameter("rel");
        int start=id*4+1;          
    %>
    <div class="privacy py-sm-5 py-4" id="rusmeen">
		<div class="container py-xl-4 py-lg-2">
						
                                <% 
                                    int ic=0; 
                                    int count=0;
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                                    Statement st=cn1.createStatement(); 
                                    ResultSet rs2=st.executeQuery("select count(*) from orders where confirmation_status='confirm' AND seller_code='"+seller_code+"'");
                                    if(rs2.next()){
                                      count=rs2.getInt(1);  
                                    }
                                   ResultSet rs1=st.executeQuery("select * from orders where confirmation_status='confirm' AND seller_code='"+seller_code+"' limit "+start+",5");
                                   while(rs1.next())
                                     { 
                                         String uname=rs1.getString("uname");
                                         String quantity=rs1.getString("quantity");
                                         String product_name=rs1.getString("pname");
                                         String price=rs1.getString("price");
                                         String pcode=rs1.getString("pcode");
                                         String order_id=rs1.getString("order_id");
                                         String delivery_status=rs1.getString("delivery_status");
                                %>

                                    <div >
                                        <div class="row">
                                            <h3 style="margin-bottom:20px"><a href="order_detail.jsp?id=<%=order_id%>"><%=order_id%></a></h3>
                                        </div>
                                        <div class="row" id="c_<%=order_id%>_<%=pcode%>">
                                            <div class="col-md-2"> 
                                                <a href="single.jsp?id=<%=pcode%>">
                                                        <img src="products/1_<%=pcode%>.jpg" alt=" " class="img-responsive" style="height:100px;width:90px">
                                                </a>
                                            </div>
                                                        <div class="col-md-2" ><a href="single.jsp?id=<%=pcode%>"> <%=product_name%> </a></div>
                                            <div class="col-md-2"> Qty. <%=quantity%></div>
                                            <div class="col-md-2" >
                                                 price
                                                 <br>
                                                <%=price%>
                                            </div>
                                            <div class="col-md-2" >User Name:<br> <%=uname%></div>
                                            <%
                                            if(delivery_status.equals("delivered")){
                                            %>
                                            <div class="col-md-2" > 
                                                <a href="order_detail.jsp?id=<%=order_id%>"><button style="background-color:blue;color:white;border:none">product Delivered</button></a>
                                            </div>
                                            <%
                                            }
                                            else{
                                            %>
                                            <div class="col-md-2" > 
                                              <button rel="<%=pcode%>" id="<%=order_id%>" class="btn btn-danger" style="background-color:red;color:white;border:none">Cancel</button>
                                            </div>
                                            <%
                                            }
                                            %>
                                        </div>
                                        <br>
                                        <br>
                                        <h1> <hr></h1>
                                    </div>
                        <%   
                        }
                        %>                                                                
							
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
                            if(id<pages-1){
                        %>
                        <button id="<%=id+1%>" rel="<%=seller_code%>" class="btn btn-primary next" style="margin-left:1150px"> next </button>
                        <%
                            }
                        }
                        %>
			
		</div>
    