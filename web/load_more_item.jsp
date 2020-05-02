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
            String id=request.getParameter("id");
            String item=request.getParameter("rel");
            int start=Integer.parseInt(id)*3+1;          
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Flipkart","root","");
            Statement st=cn.createStatement();
            String a[]=item.split(" ");
            String sql="select * from product where product_name='"+item+"'";
            for(int i=0;i<a.length;i++)
            {
                sql+="OR product_name like '"+a[i]+"%' OR product_name like '%"+a[i]+"' OR product_name like '%"+a[i]+"%' OR Brand like '"+a[i]+"%' OR Brand like '%"+a[i]+"'  OR Brand like '%"+a[i]+"%' OR Category like '"+a[i]+"%' OR Category like '%"+a[i]+"' OR Category like '%"+a[i]+"%' OR Subcategory like '"+a[i]+"%' OR Subcategory like '%"+a[i]+"' OR Subcategory like '%"+a[i]+"%' OR seller_name like '"+a[i]+"%' OR seller_name like '%"+a[i]+"' OR seller_name like '%"+a[i]+"%' OR Specification like '"+a[i]+"%' OR Specification like '%"+a[i]+"' OR Specification like '%"+a[i]+"%' ";
            }
            ResultSet rs=st.executeQuery(sql+" limit "+start+",3");
    %>
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


<%
        cn.close();  
      }
      catch(Exception e){
                out.println(e.getMessage());
      }

               %>