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
            String sql="select * from product where product_name='"+item+"'";
            for(int i=0;i<a.length;i++)
            {
                sql+="OR product_name like '"+a[i]+"%' OR product_name like '%"+a[i]+"' OR product_name like '%"+a[i]+"%' OR Category  like '"+a[i]+"%' OR Category  like '%"+a[i]+"'  OR Category  like '%"+a[i]+"%' OR Subcategory like '"+a[i]+"%' OR Subcategory like '%"+a[i]+"' OR Subcategory like '%"+a[i]+"%' OR Brand like '"+a[i]+"%' OR Brand like '%"+a[i]+"' OR Brand like '%"+a[i]+"%' OR Specification  like '"+a[i]+"%' OR Specification  like '%"+a[i]+"' OR Specification  like '%"+a[i]+"%' ";
            }
            ResultSet rs=st.executeQuery(sql + "limit 5");
    %>
             <div class="container py-xl-4 py-lg-2" id="rusmeen">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>All </span>Orders	
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
                                                               
                                                               while(rs.next())
                                                                 { 
                                                                     String product_name=rs.getString("product_name");
                                                                     String pcode=rs.getString("product_code");
                                                                     String price=rs.getString("Offer_price");
                                                                     String No_of_item=rs.getString("No_of_item");
                                                                     String Category=rs.getString("Category");
                                                                     String subcategory=rs.getString("Subcategory");
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