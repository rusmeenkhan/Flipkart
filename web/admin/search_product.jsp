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
            String item=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Flipkart","root","");
            Statement st=cn.createStatement();
            String a[]=item.split(" ");
            String sql="select * from product where product_name='"+item+"'";
            for(int i=0;i<a.length;i++)
            {
                sql+="OR product_name like '"+a[i]+"%' OR product_name like '%"+a[i]+"' OR product_name like '%"+a[i]+"%' OR Brand like '"+a[i]+"%' OR Brand like '%"+a[i]+"'  OR Brand like '%"+a[i]+"%' OR Subcategory like '"+a[i]+"%' OR Subcategory like '%"+a[i]+"' OR Subcategory like '%"+a[i]+"%'";
            }
            ResultSet rs=st.executeQuery(sql);
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
                                                               while(rs.next())
                                                                 { 
                                                                     String sn=rs.getString("sn");
                                                                     String pcode=rs.getString("product_code");
                                                                     String product_name=rs.getString("product_name"); 
                                                                     String Category=rs.getString("Category");
                                                                     String Subcategory=rs.getString("Subcategory");
                                                                     String Brand=rs.getString("Brand");
                                                                     String seller_name=rs.getString("seller_name");
                                                                     String Block=rs.getString("Block");
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
			
			
		</div>
	</div>


        <%
                    cn.close();
                   }
                     catch(Exception e)
                     {
                         out.println(e.getMessage());
                    }
        %>