
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">
    <%@page import="java.sql.*,java.util.*"%>
<head>
    <script src="js/jquery-2.2.3.min.js"></script>
	<title>Electro Store Ecommerce Category Bootstrap Responsive Web Template | Checkout :: w3layouts</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Electro Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"
	/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- //Meta tag Keywords -->

	<!-- Custom-Files -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Bootstrap css -->
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Main css -->
	<link rel="stylesheet" href="css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<!-- pop-up-box -->
	<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" />
	<!-- menu style -->
	<!-- //Custom-Files -->

	<!-- web fonts -->
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //web fonts -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script>
   $(document).ready(function(){
       $(".entry.value-minus").click(function(){
         var v= $(this).attr("id");
          var u= $(this).attr("rel");
          var x=v.substring(0,v.indexOf("_"));
          var z=v.substring(v.indexOf("_")+1);
          var p="q_"+z;
          var q="p_"+z;
          $.post("itemquantity.jsp",{id:x,rel:z,quantity:u},function(data){
              var a=data.substring(0,data.indexOf("_"));
              var b=data.substring(data.indexOf("_")+1);
              $("#"+p).html(a);
              $("#"+q).html(b);
       });
        }); 
       $(".entry.value-plus.active").click(function(){
            var v= $(this).attr("id");
            var u= $(this).attr("rel");
            var x=v.substring(0,v.indexOf("_"));
            var z=v.substring(v.indexOf("_")+1);
            var p="q_"+z;
            var q="p_"+z;
            $.post("itemquantity.jsp",{id:x,rel:z,quantity:u},function(data){
              var a=data.substring(0,data.indexOf("_"));
              var b=data.substring(data.indexOf("_")+1);
              $("#"+p).html(a); 
              $("#"+q).html(b);
       });    
   });
   });   
</script>
<script>
   $(document).ready(function(){
       $("#search").keyup(function(){
           var v=$(this).val();
           $.post("search.jsp",{id:v},function(data){
                  $("#rusmeen").html(data);
                  $("#carouselExampleIndicators").hide();
                  $("#new").hide();
           });  
       });
   }); 
    
</script>
<script>
   $(document).ready(function(){
       $(".close1").click(function(){
            var v= $(this).attr("id");
            var u=$(this).attr("rel");
            var p="r_"+v;
            $.post("remove_item.jsp",{id:u,rel:v},function(data){         
            $("#"+p).fadeOut(10);
            });
        }); 
   });
    
</script>
</head>

<body>
    <%
        try{
            String ucode=null;
            String uscode=null;
            String email=null;
            Cookie c[]=request.getCookies();
            for(int i=0;i<c.length;i++)
            {
              if(c[i].getName().equals("user"))
              {
                  email=c[i].getValue();
                  break;
              }
            }
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
            Statement st=cn.createStatement();
            if(email!=null&&session.getAttribute(email)!=null)
              {
                %>
                
	<!-- top-header -->
	<div class="agile-main-top">
            <div class="container-fluid">
                <div class="row main-top-w3l py-2">
                    <div class="col-lg-4 header-most-top">
                        <p class="text-white text-lg-left text-center">Offer Zone Top Deals & Discounts
                            <i class="fas fa-shopping-cart ml-1"></i>
                        </p>
                    </div>
                    <div class="col-lg-8 header-right mt-lg-0 mt-2">
                        <!-- header lists -->
                        <ul>
                                
                                <%
                                    ResultSet rs=st.executeQuery("select * from user where Email='"+email+"'");
                                    if(rs.next()){
                                         ucode=rs.getString("ucode");

                                  %>
                                <li class="text-center border-right text-white">
							<i class="fas fa-phone mr-2"></i> 001 234 5678
                                </li>
                                <li class="text-center border-right text-white">
                                        <a href="Myorder.jsp" class="text-white">
                                                <i class="fas fa-truck mr-2"></i>My Order</a>
                                </li>
                                <li class="text-center border-right text-white">
                                        <a href="profile.jsp"  class="text-white">
                                                <i class="fas fa-user mr-2" id="pro"></i> My Profile</a>
                                </li>
                                <%
                                }
                                %>
                                <li class="text-center text-white">
                                        <a href="logout.jsp" class="text-white">
                                                <i class="fas fa-sign-out-alt mr-2"></i>Logout </a>
                                </li>
                        </ul>
					<!-- //header lists -->
                    </div>
                </div>
            </div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center">Log In</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                </div>
            </div>
	</div>
	<!-- register -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Register</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                </div>
            </div>
	</div>
        <%
           }
        else
          {               
                Cookie c1[]=request.getCookies();
                for(int i=0;i<c1.length;i++){
                   if(c1[i].getName().equals("nuser")){
                          uscode=c1[i].getValue();
                          break;
                    }
                }               
                if(uscode==null){
                    uscode=""; 
                    String pcode=null;
                    LinkedList l=new LinkedList();
                    for(char cp='a';cp<='z';cp++)
                     {
                         l.add(cp+"");
                     }
                    for(char cp='A';cp<='Z';cp++)
                     {
                        l.add(cp+"");
                     }
                    for(char cp='0';cp<='9';cp++)
                     {
                      l.add(cp+"");
                     }
                      Collections.shuffle(l);
                    for(int i=1;i<=5;i++)
                     {
                       uscode+=l.get(i);
                      }
                   
                    Cookie co=new Cookie("nuser",uscode);
                    co.setMaxAge(6000);
                    response.addCookie(co);
                    session.setAttribute(uscode,pcode);
                    session.setMaxInactiveInterval(1000);

                }
        %>
        	<!-- top-header -->
	<div class="agile-main-top">
            <div class="container-fluid">
                <div class="row main-top-w3l py-2">
                    <div class="col-lg-4 header-most-top">
                        <p class="text-white text-lg-left text-center">Offer Zone Top Deals & Discounts
                                <i class="fas fa-shopping-cart ml-1"></i>
                        </p>
                    </div>
                    <div class="col-lg-8 header-right mt-lg-0 mt-2">
                            <!-- header lists -->
                        <ul>
                            <li class="text-center border-right text-white">
							<a class="play-icon popup-with-zoom-anim text-white" href="#small-dialog1">
								<i class="fas fa-map-marker mr-2"></i>Select Location</a>
                            </li>
                            <li class="text-center border-right text-white">
                                    <a href="#" data-toggle="modal" data-target="#exampleModal" class="text-white">
                                            <i class="fas fa-truck mr-2"></i>Track Order</a>
                            </li>
                            <li class="text-center border-right text-white">
							<i class="fas fa-phone mr-2"></i> 001 234 5678
                            </li>
                            <li class="text-center border-right text-white" >
                                    <a href="#" data-toggle="modal" data-target="#exampleModal" class="text-white">
                                            <i class="fas fa-sign-in-alt mr-2"></i> Log In </a>
                            </li>
                            <li class="text-center text-white">
                                    <a href="#" data-toggle="modal" data-target="#exampleModal2" class="text-white">
                                            <i class="fas fa-sign-out-alt mr-2"></i>Register </a>
                            </li>

                        </ul>
                            <!-- //header lists -->
                    </div>
                </div>
            </div>
	</div>

	<!-- Button trigger modal(select-location) -->
	<div id="small-dialog1" class="mfp-hide">
            <div class="select-city">
                <h3>
                        <i class="fas fa-map-marker"></i> Please Select Your Location</h3>

                <div class="clearfix"></div>
            </div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center">Log In</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="check.jsp" method="post">
                            <div class="form-group">
                                    <label class="col-form-label">Username</label>
                                    <input type="text" class="form-control" placeholder=" " name="email" required="">
                            </div>
                            <div class="form-group">
                                    <label class="col-form-label">Password</label>
                                    <input type="password" class="form-control" placeholder=" " name="pass" required="">
                            </div>
                            <div class="right-w3l">
                                    <input type="submit" class="form-control" value="Log in">
                            </div>
                                                                            <p class="text-center dont-do mt-3">Don't have an account?
                                    <a href="#" data-toggle="modal" data-target="#exampleModal2">
                                            Register Now</a>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
	</div>
	<!-- register -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                    <div class="modal-content">
                            <div class="modal-header">
					<h5 class="modal-title">Register</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
                            </div>
                            <div class="modal-body">
                                <form action="insert.jsp" method="post">
                                    <div class="form-group">
                                            <label class="col-form-label">Your Name</label>
                                            <input type="text" class="form-control" placeholder=" " name="Name" required="">
                                    </div>
                                    <div class="form-group">
                                            <label class="col-form-label">Email</label>
                                            <input type="email" class="form-control" placeholder=" " name="Email" required="">
                                    </div>
                                    <div class="form-group">
                                            <label class="col-form-label">Mobile</label>
                                            <input type="text" class="form-control" placeholder=" " name="mob"  required="">
                                    </div>
                                    <div class="form-group">
                                            <label class="col-form-label">Address</label>
                                            <input type="text" class="form-control" placeholder=" " name="Address" required="">
                                    </div>
                                <div class="form-group">
                                            <label class="col-form-label">Password</label>
                                            <input type="password" class="form-control" placeholder=" " name="pass" id="password1" required="">
                                    </div>
                                <div class="form-group">
                                            <label class="col-form-label">Confirm Password</label>
                                            <input type="password" class="form-control" placeholder=" " name="repass" id="password2" required="">
                                    </div>
                                    <div class="right-w3l">
                                            <input type="submit" class="form-control" value="Register">
                                    </div>

                            </form>
                        </div>
                    </div>
            </div>
	</div>
               
        <%
        }
        %>
	<!-- //top-header -->

	<!-- header-bottom-->
	<div class="header-bot">
            <div class="container">
                <div class="row header-bot_inner_wthreeinfo_header_mid">
				<!-- logo -->
                    <div class="col-md-3 logo_agile">
                        <h1 class="text-center">
                                <a href="index.jsp" class="font-weight-bold font-italic">
                                        <img src="images/logo2.png" alt=" " class="img-fluid">Electro Store
                                </a>
                        </h1>
                    </div>
				<!-- //logo -->
				<!-- header-bot -->
                    <div class="col-md-9 header mt-4 mb-md-0 mb-4">
                        <div class="row">
						<!-- search -->
                            <div class="col-8 agileits_search">
                                    <form class="form-inline" action="#" method="post">
                                            <input class="form-control mr-sm-2" id="search" type="search" placeholder="Search"  aria-label="Search" required>
                                            <button class="btn my-2 my-sm-0" type="submit">Search</button>
                                    </form>
                            </div>
                            <!-- //search -->
                            <!-- cart details -->
                            <div class="col-2 top_nav_right text-center mt-sm-0 mt-2">
                                <div class="wthreecartaits wthreecartaits2 cart cart box_1" >

                                    <%
                                        int product=0;
                                        ResultSet rs6=st.executeQuery("select count(*) from temp where ucode='"+ucode+"' OR ucode='"+uscode+"'");
                                        if(rs6.next()){
                                             product=rs6.getInt(1);
                                        }
                                       if(email!=null&&session.getAttribute(email)!=null)
                                            {               
                                            %>
                                                    <button class="btn w3view-cart" type="submit" name="submit" value="">
                                                        <a href="checkout.jsp?id=<%=ucode%>"><i  class="fas fa-cart-arrow-down" id="check"><%=product%></i></a>
                                                    </button>
                                           <%
                                            }
                                        else
                                           {                                              
                                                Cookie c1[]=request.getCookies();
                                                for(int i=0;i<c1.length;i++){
                                                    if(c1[i].getName().equals("nuser")){
                                                        uscode=c1[i].getValue();
                                                        break;
                                                    }
                                                }                                                                   
                                              %>
                                                    <button class="btn w3view-cart" type="submit" name="submit" value="">
                                                        <a href="checkout.jsp?id=<%=uscode%>"><i  class="fas fa-cart-arrow-down" id="check"><%=product%></i></a>
                                                    </button>
                                                    <%                                                     
                                                    }
                                                    %>

                                    </div>
                            </div>
                            <div class="col-2 top_nav_right text-center mt-sm-0 mt-2">
                                <div class="wthreecartaits wthreecartaits2 cart cart box_1" >
                                    <%
                                        int w_product=0;
                                        ResultSet rs7=st.executeQuery("select count(*) from wishlist where ucode='"+ucode+"'");
                                        if(rs7.next()){
                                             w_product=rs7.getInt(1);
                                        }
                                       if(email!=null&&session.getAttribute(email)!=null)
                                            {               
                                            %>
                                            <a href="My_wishlist.jsp?id=<%=ucode%>">
                                            <button class="btn w3view-cart fa fa-heart" id="wishlist" type="submit" name="submit" value="">
                                                 <i  id="wish"><%=w_product%></i>
                                            </button>
                                            </a>
                                    <%
                                            }
                                        else
                                           {                                                                                                                  
                                              %>
                                             <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button class="btn w3view-cart fa fa-heart" id="wishlist" type="submit" name="submit" value="">
                                                                <a href="#"><i  id="wish"><%=w_product%></i></a>
                                                            </button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                              <%
                                              }
                                              %>

                                </div>
                            </div>
						<!-- //cart details -->
                        </div>
                    </div>
                </div>
            </div>
         </div>
	<!-- shop locator (popup) -->
	<!-- //header-bottom -->
	<!-- navigation -->
        <div class="navbar-inner">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ml-auto text-center mr-xl-5">
                                    <li class="nav-item active mr-lg-2 mb-lg-0 mb-2">
                                            <a class="nav-link" href="index.jsp">Home
                                                    <span class="sr-only">(current)</span>
                                            </a>
                                    </li>                                    
                            <%  
                               ResultSet rs4=st.executeQuery("select *  from category where status=1 ");
                               while(rs4.next())  
                                    {
                                        String Category=rs4.getString("cname");   
                                        Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
                                        Statement st1=cn1.createStatement();
                                         int no_of_subcategory=0;
                                         ResultSet rs0=st1.executeQuery("select count(*)  from subcategory where Category='"+Category+"' AND  status=1 ");
                                         if(rs0.next())  
                                             {
                                                 no_of_subcategory=rs0.getInt(1);
                                             }
                                         if(no_of_subcategory>0){
                            %>
                                    <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <%=Category%>
                                        </a>
                                        <div class="dropdown-menu">
                                            <div class="agile_inner_drop_nav_info p-4">

                                                <div class="row">
                                                    <%  

                                                       ResultSet rs5=st1.executeQuery("select * from subcategory where Category='"+Category+"' AND status=1");
                                                       while(rs5.next())
                                                            { 
                                                                String Subcategory=rs5.getString("Subcategory");
                                                                String subcategory_code=rs5.getString("subccode");
                                                    %>
                                                        <div class="col-sm-6 multi-gd-img">
                                                                <ul class="multi-column-dropdown">
                                                                        <li>
                                                                                <a href="product.jsp?id=<%=subcategory_code%>"><%=Subcategory%></a>
                                                                        </li>																																			
                                                                </ul>
                                                        </div>
                                                    <%
                                                            }
                                                            cn1.close();
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                                <%
                                                }
                                                %>
                                    </li>
                                    <%
                                    }
                                    %>

                                    <li class="nav-item mr-lg-2 mb-lg-0 mb-2">
                                            <a class="nav-link" href="about.jsp">About Us</a>
                                    </li>


                                    <li class="nav-item">
                                            <a class="nav-link" href="contact.jsp">Contact Us</a>
                                    </li>
                            </ul>
                    </div>
                </nav>
            </div>
	</div>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<!-- Indicators-->
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
                    <div class="carousel-item item1 active">
                        <div class="container">
                            <div class="w3l-space-banner">
                                <div class="carousel-caption p-lg-5 p-sm-4 p-3">
                                    <p>Get flat
                                            <span>10%</span> Cashback</p>
                                    <h3 class="font-weight-bold pt-2 pb-lg-5 pb-4">The
                                            <span>Big</span>
                                            Sale
                                    </h3>
                                    <a class="button2" href="index.jsp">Shop Now </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item item2">
                        <div class="container">
                            <div class="w3l-space-banner">
                                <div class="carousel-caption p-lg-5 p-sm-4 p-3">
                                    <p>advanced
                                            <span>Wireless</span> earbuds</p>
                                    <h3 class="font-weight-bold pt-2 pb-lg-5 pb-4">Best
                                            <span>Headphone</span>
                                    </h3>
                                    <a class="button2" href="index.jsp">Shop Now </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item item3">
                        <div class="container">
                            <div class="w3l-space-banner">
                                <div class="carousel-caption p-lg-5 p-sm-4 p-3">
                                    <p>Get flat
                                            <span>10%</span> Cashback</p>
                                    <h3 class="font-weight-bold pt-2 pb-lg-5 pb-4">New
                                            <span>Standard</span>
                                    </h3>
                                    <a class="button2" href="index.jsp">Shop Now </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item item4">
                        <div class="container">
                            <div class="w3l-space-banner">
                                <div class="carousel-caption p-lg-5 p-sm-4 p-3">
                                    <p>Get Now
                                            <span>40%</span> Discount</p>
                                    <h3 class="font-weight-bold pt-2 pb-lg-5 pb-4">Today
                                            <span>Discount</span>
                                    </h3>
                                    <a class="button2" href="index.jsp">Shop Now </a>
                                </div>
                            </div>
                        </div>
                    </div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- //banner -->


       <div class="privacy py-sm-5 py-4" id="rusmeen">
		<div class="container py-xl-4 py-lg-2" id="new">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>C</span>heckout
			</h3>
			<!-- //tittle heading -->
			<div class="checkout-right">
				
				<div class="table-responsive">
					<table class="timetable_sub">
						<thead>
							<tr>
								<th>Product</th>
								<th>No. of Items</th>
								<th>Product Name</th>

								<th>Price</th>
								<th>Remove</th>
							</tr>
						</thead>
						<tbody>
                                                    <%  
                                                        String product_code=null;
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                                                        Statement st2=cn1.createStatement();  
                                                        ResultSet rs1=st2.executeQuery("select * from temp where ucode='"+uscode+"' OR ucode='"+ucode+"'");
                                                        while(rs1.next())
                                                            {     
                                                              product_code=rs1.getString("pcode");
                                                              int quantity=rs1.getInt("quantity");
                                                              int price=rs1.getInt("price");
                                                              Connection cn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                                                              Statement st1=cn2.createStatement();  
                                                              ResultSet rs=st1.executeQuery("select * from product where product_code='"+product_code+"'");
                                                              if(rs.next()){
                                                                  
                                                                 String product_name=rs.getString("product_name");
                                                    %>
                                                    
							<tr class="rem1" id="r_<%=product_code%>">
								
								<td class="invert-image">
									<a href="single.jsp">
                                                                            <img src="seller/products/1_<%=product_code%>.jpg" alt=" " class="img-responsive" style="height:100px;width:90px">
									</a>
								</td>
								<td class="invert">
									<div class="quantity">
										<div class="quantity-select">
                                                                                    <div class="entry value-minus" rel="<%=quantity%>" id="minus_<%=product_code%>">&nbsp;</div>
											<div class="entry value" id="q_<%=product_code%>">
												<span><%=quantity%></span>
											</div>
											<div class="entry value-plus active" rel="<%=quantity%>" id="plus_<%=product_code%>">&nbsp;</div>
										</div>
									</div>
								</td>
								<td class="invert"><%=product_name%></td>
								<td class="invert" id="p_<%=product_code%>"><%=price%></td>
								<td class="invert">
									<div class="rem">
                                                                            <div class="close1" rel="<%=uscode%>" id="<%=product_code%>"> </div>
									</div>
								</td>
							</tr>
							<%
                                                        }
                                                        }
                                                        %>
						</tbody>
					</table>
				</div>
			</div>
			<div class="checkout-left">
				<div class="address_form_agile mt-sm-5 mt-4">
					<h4 class="mb-sm-4 mb-3">Add a new Details</h4>
                                        <form action="prepayment.jsp?id=<%=uscode%>" method="post" class="creditly-card-form agileinfo_form">
						<div class="creditly-wrapper wthree, w3_agileits_wrapper">
							<div class="information-wrapper">
								<div class="first-row">
									<div class="controls form-group">
										<input class="billing-address-name form-control" type="text" name="name" placeholder="Full Name" required="">
									</div>
									<div class="w3_agileits_card_number_grids">
										<div class="w3_agileits_card_number_grid_left form-group">
											<div class="controls">
												<input type="text" name="mob"  class="form-control" placeholder="Mobile Number"  required="">
											</div>
										</div>
                                                                            	<div class="w3_agileits_card_number_grid_left form-group">
											<div class="controls">
												<input type="text" class="form-control" placeholder="Email" name="Email" required="">
											</div>
										</div>
										<div class="w3_agileits_card_number_grid_right form-group">
											<div class="controls">
												<input type="text" class="form-control" placeholder="Landmark" name="landmark" required="">
											</div>
										</div>
									</div>
									<div class="controls form-group">
										<input type="text" class="form-control" placeholder="Town/City" name="city" required="">
									</div>
									<div class="controls form-group">
										<select name="addtype" class="option-w3ls">
											<option>Select Address type</option>
											<option>Office</option>
											<option>Home</option>
											<option>Commercial</option>

										</select>
									</div>
								</div>
                                                            <%
                                                           // st.execute("Delete from temp where ucode='"+uscode+"'"); 
                                                            %>
								<button class="submit check_out btn">Delivery to this Address</button>
							</div>
						</div>
					</form>
					<div class="checkout-right-basket">
						<a href="prepayment.jsp?id=<%=product_code%>"Make a Payment
							<span class="far fa-hand-point-right"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //checkout page -->

	<!-- middle section -->
	<div class="join-w3l1 py-sm-5 py-4">
		<div class="container py-xl-4 py-lg-2">
			<div class="row">
				<div class="col-lg-6">
					<div class="join-agile text-left p-4">
						<div class="row">
							<div class="col-sm-7 offer-name">
								<h6>Smooth, Rich & Loud Audio</h6>
								<h4 class="mt-2 mb-3">Branded Headphones</h4>
								<p>Sale up to 25% off all in store</p>
							</div>
							<div class="col-sm-5 offerimg-w3l">
								<img src="images/off1.png" alt="" class="img-fluid">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mt-lg-0 mt-5">
					<div class="join-agile text-left p-4">
						<div class="row ">
							<div class="col-sm-7 offer-name">
								<h6>A Bigger Phone</h6>
								<h4 class="mt-2 mb-3">Smart Phones 5</h4>
								<p>Free shipping order over $100</p>
							</div>
							<div class="col-sm-5 offerimg-w3l">
								<img src="images/off2.png" alt="" class="img-fluid">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- middle section -->

	<!-- footer -->
	<!-- //copyright -->

	<!-- js-files -->
	<!-- jquery -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- //jquery -->

	<!-- nav smooth scroll -->
	<script>
		$(document).ready(function () {
			$(".dropdown").hover(
				function () {
					$('.dropdown-menu', this).stop(true, true).slideDown("fast");
					$(this).toggleClass('open');
				},
				function () {
					$('.dropdown-menu', this).stop(true, true).slideUp("fast");
					$(this).toggleClass('open');
				}
			);
		});
	</script>
	<!-- //nav smooth scroll -->

	<!-- popup modal (for location)-->
	<script src="js/jquery.magnific-popup.js"></script>
	<script>
		$(document).ready(function () {
			$('.popup-with-zoom-anim').magnificPopup({
				type: 'inline',
				fixedContentPos: false,
				fixedBgPos: true,
				overflowY: 'auto',
				closeBtnInside: true,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- //popup modal (for location)-->

	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
		paypals.minicarts.render(); //use only unique class names other than paypals.minicarts.Also Replace same class name in css and minicart.min.js

		paypals.minicarts.cart.on('checkout', function (evt) {
			var items = this.items(),
				len = items.length,
				total = 0,
				i;

			// Count the number of each item in the cart
			for (i = 0; i < len; i++) {
				total += items[i].get('quantity');
			}

			if (total < 3) {
				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
				evt.preventDefault();
			}
		});
	</script>
	<!-- //cart-js -->

	<!-- password-script -->
	<script>
		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}
	</script>
	<!-- //password-script -->

	<!-- quantity -->
	
	<!--quantity-->
	
	<!-- //quantity -->

	<!-- smoothscroll -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smoothscroll -->

	<!-- start-smooth-scrolling -->
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->

	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function () {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			*/
			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->
        <%
            }
            catch(Exception e){
              out.println(e.getMessage());
            }
        %>
</body>

</html>