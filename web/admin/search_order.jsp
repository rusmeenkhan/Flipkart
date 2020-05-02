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
            String sql="select * from orders where pname='"+item+"'";
            for(int i=0;i<a.length;i++)
            {
                sql+="OR pname like '"+a[i]+"%' OR pname like '%"+a[i]+"' OR pname like '%"+a[i]+"%' OR Email like '"+a[i]+"%' OR Email like '%"+a[i]+"'  OR Email like '%"+a[i]+"%' OR city like '"+a[i]+"%' OR city like '%"+a[i]+"' OR city like '%"+a[i]+"%' OR uname like '"+a[i]+"%' OR uname like '%"+a[i]+"' OR uname like '%"+a[i]+"%' OR mobile like '"+a[i]+"%' OR mobile like '%"+a[i]+"' OR mobile like '%"+a[i]+"%'";
            }
            ResultSet rs=st.executeQuery(sql);
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
                                                               while(rs.next())
                                                                 { 
                                                                     String sn=rs.getString("sn");
                                                                     String pcode=rs.getString("pcode");
                                                                     String pname=rs.getString("pname");
                                                                     String order_id=rs.getString("order_id");
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