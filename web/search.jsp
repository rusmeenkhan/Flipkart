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
            int ic=0;
            String email=null;
            String item=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Flipkart","root","");
            Statement st=cn.createStatement();
            String a[]=item.split(" ");
            String sql="select * from product where product_name='"+item+"'";
            for(int i=0;i<a.length;i++)
            {
                sql+="OR product_name like '"+a[i]+"%' OR product_name like '%"+a[i]+"' OR product_name like '%"+a[i]+"%' OR Brand like '"+a[i]+"%' OR Brand like '%"+a[i]+"'  OR Brand like '%"+a[i]+"%' OR Category like '"+a[i]+"%' OR Category like '%"+a[i]+"' OR Category like '%"+a[i]+"%' OR Subcategory like '"+a[i]+"%' OR Subcategory like '%"+a[i]+"' OR Subcategory like '%"+a[i]+"%' OR seller_name like '"+a[i]+"%' OR seller_name like '%"+a[i]+"' OR seller_name like '%"+a[i]+"%'OR Specification like '"+a[i]+"%' OR Specification like '%"+a[i]+"' OR Specification like '%"+a[i]+"%' ";
            }
            ResultSet rs=st.executeQuery(sql +" limit 3");
    %>
            <div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4" id="khan">
                <h3 class="heading-tittle text-center font-italic">Searched Items</h3>
                    <div class="row" >
                        <%
                        while(rs.next())
                           { 
                               String product_code=rs.getString("product_code");
                               String product_name =rs.getString("product_name");
                              %> 
                          <div class="col-md-4 product-men mt-5" >
				<div class="men-pro-item simpleCart_shelfItem" >
				     <div class="men-thumb-item text-center">
                                         <a href="single.jsp?id=<%=product_code%>"><img src="seller/products/1_<%=product_code%>.jpg" style="width:200px;height:250px" alt="" /></a>				
							<div class="clck">
								<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
							</div>
						</div>
                                </div>
						<div class="item-info-product text-center border-top mt-4">
							<a href="single.jsp?id=<%=product_code%>" class="title title-info"><%=product_name%></a>
							
						</div>
		           </div>
                        <%
                           }  
                        %>
                            <div class="clearfix"> </div>
                    </div>
            </div>
                            <%
                                 if(ic==0||ic==-1){
                                %>
                                    <div class="col-md-3 product-men mt-5">
                                                <button class="load_more item" id="<%=ic+1%>" rel="<%=item%>" style="margin-top:150px">Load More</button>
                                    </div>
                                <%
                                }
                                else{
                                %>
                                        <div class="col-md-3 product-men mt-5">
                                             <button class="load_more item" id="<%=ic-1%>" rel="<%=item%>" style="margin-top:150px;margin-left: 20px">Load prev</button>
                                        </div>
                                        <div class="col-md-3 product-men mt-5">
                                             <button class="load_more item" id="<%=ic+1%>" rel="<%=item%>" style="margin-top:150px">Load More</button>
                                        </div>
                                <%
                                    }
                                %>

           


<%
        cn.close();  
      }
      catch(Exception e){
                out.println(e.getMessage());
      }

               %>