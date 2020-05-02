<%@page import="java.sql.*" %>
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
<!-- //bootstrap -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="js/jquery-1.11.1.min.js"></script>
<!--start-smoth-scrolling-->
<!-- fonts -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>

     <%
      try{
            String email=null;
            String seller_code=request.getParameter("rel");
            String item=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Flipkart","root","");
            Statement st=cn.createStatement();
            String a[]=item.split(" ");
            String sql="select * from orders where pname='"+item+"'";
            for(int i=0;i<a.length;i++)
            {
                sql+="OR pname like '"+a[i]+"%' OR pname like '%"+a[i]+"' OR pname like '%"+a[i]+"%' OR Email like '"+a[i]+"%' OR Email like '%"+a[i]+"'  OR Email like '%"+a[i]+"%' OR city like '"+a[i]+"%' OR city like '%"+a[i]+"' OR city like '%"+a[i]+"%' OR uname like '"+a[i]+"%' OR uname like '%"+a[i]+"' OR uname like '%"+a[i]+"%' OR mobile like '"+a[i]+"%' OR mobile like '%"+a[i]+"' OR mobile like '%"+a[i]+"%' limit 5";
            }
            ResultSet rs=st.executeQuery(sql  + "limit 5");
    %>
             <div class="container py-xl-4 py-lg-2" id="rusmeen">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>All </span>Orders
			</h3>

							
                                <% 
                                    int ic=0; 
                                    int count=0;
                                    while(rs.next()){ 
                                            String uname=rs.getString("uname");
                                            String quantity=rs.getString("quantity");
                                            String product_name=rs.getString("pname");
                                            String price=rs.getString("price");
                                            String pcode=rs.getString("pcode");
                                            String order_id=rs.getString("order_id");
                                            String delivery_status=rs.getString("delivery_status");
                                            Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/Flipkart","root","");
                                            Statement st1=cn1.createStatement();
                                            ResultSet rs2=st1.executeQuery("select count(*) from orders where confirmation_status='confirm' AND seller_code='"+seller_code+"'");
                                            if(rs2.next()){
                                              count=rs2.getInt(1);  
                                            }
                                         
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
                        int pages=count/5;
                        if(ic==0||ic==-1){
                        %>                               
                            <button id="<%=ic+1%>" rel="<%=seller_code%>" class="btn btn-primary next" style="margin-left:1150px"> next </button>    
                        <%
                        }
                        else{
                        %>
                        <button id="<%=ic-1%>" rel="<%=seller_code%>" class="btn btn-primary previous" style="margin-left:-50px"> previous </button>
                            <%
                            if(ic<pages){
                        %>
                        <button id="<%=ic+1%>" rel="<%=seller_code%>" class="btn btn-primary next" style="margin-left:1150px"> next </button>
                        <%
                            }
                        }
                        %>				
                </div>


        <%
                    cn.close();
                   }
                     catch(Exception e)
                     {
                         out.println(e.getMessage());
                    }
        %>