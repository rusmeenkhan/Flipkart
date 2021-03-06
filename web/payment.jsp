
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
	<title>Electro Store Ecommerce Category Bootstrap Responsive Web Template | Payment :: w3layouts</title>
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
        <script src="js/jquery-2.2.3.min.js"></script>
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
   $(document).on("click",".load_more.item",function(){
                var v=$(this).attr("id");  
                var p =parseInt(v)+1;
                $(".load_more_item").attr("id",p);
                var x=$(this).attr("rel");
                alert(x);
               
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

    
</head>

<body>
    <% 
        try{
            String pcode=null;
            String order_id=request.getParameter("id");
            String con_id=request.getParameter("con_id");
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
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
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
	<!-- //banner-2 -->
	<!-- page -->
	<div class="services-breadcrumb">
		<div class="agile_inner_breadcrumb">
			<div class="container">
				<ul class="w3_short">
					<li>
						<a href="index.jsp">Home</a>
						<i>|</i>
					</li>
					<li>Payment Page</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //page -->
	<!-- payment page-->
        
        
    <% 
        if(con_id==null){ 
    %>
        <div class="contact py-sm-5 py-4" id="rusmeen">
		<div class="container py-xl-4 py-lg-2" id="new">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>Review </span> Your
				<span>O</span>rder
			</h3>
                        <div class="row contact-grids agile-1 mb-5">
                            <div class="col-sm-8 contact-grid agileinfo-6 mt-sm-0 mt-2">
					<div class="contact-grid1 text-center">
						<div class="con-ic">
							<i ></i>
						</div>
                                            <h4 class="font-weight-bold mt-sm-4 mt-3 mb-3">Product Details</h4>
                                            			<hr>
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
                    <%
                     
                     String landmark=null;
                     String city=null;
                     String mobile=null;
                     ResultSet rs=st.executeQuery("select * from orders where order_id='"+order_id+"'");
                     while(rs.next())
                     {
                       int quantity=rs.getInt("quantity");
                       String Name=rs.getString("uname");
                       uscode=rs.getString("ucode");
                       String Email=rs.getString("Email");
                       mobile=rs.getString("mobile");
                       city=rs.getString("city");  
                       landmark=rs.getString("landmark"); 
                        pcode=rs.getString("pcode");
                        int offer_price=rs.getInt("price");
                       %>
			<!-- //tittle heading -->
			
                                <%
                                Statement st1=cn.createStatement();    
                                ResultSet rs1=st1.executeQuery("select * from product where product_code='"+pcode+"'");
                                if(rs1.next())
                                {
                                    String product_name=rs1.getString("product_name");
                                    String Brand=rs1.getString("Brand");
                                    
                                %>

						<tbody>
                                                    
							<tr class="rem1" id="r_<%=pcode%>">
								
								<td class="invert-image">
                                                                    <a href="single.jsp?id=<%=pcode%>">
                                                                            <img src="seller/products/1_<%=pcode%>.jpg" alt=" " class="img-responsive" style="height:100px;width:90px">
									</a>
								</td>
								<td class="invert">
									<div class="quantity">
										<div class="quantity-select">
                                                                                    <div class="entry value-minus" rel="<%=quantity%>" id="minus_<%=pcode%>">&nbsp;</div>
											<div class="entry value" id="q_<%=pcode%>">
												<span><%=quantity%></span>
											</div>
											<div class="entry value-plus active" rel="<%=quantity%>" id="plus_<%=pcode%>">&nbsp;</div>
										</div>
									</div>
								</td>
								<td class="invert"><%=product_name%></td>
								<td class="invert" id="p_<%=pcode%>"><%=offer_price%></td>
								<td class="invert">
									<div class="rem">
                                                                            <div class="close1" rel="<%=uscode%>" id="<%=pcode%>"> </div>
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
						
					</div>
				</div>
				<div class="col-sm-1 contact-grid agileinfo-6 mt-sm-0 mt-2">
					<div class="contact-grid1 text-center">
						<div class="con-ic">
							<i class="fas fa-map-marker-alt rounded-circle"></i>
						</div>
						<h4 class="font-weight-bold mt-sm-4 mt-3 mb-3">Address</h4>
						<p><%=landmark%>
							<label><%=city%></label>
						</p>
					</div>
				</div>
				<div class="col-sm-1 contact-grid agileinfo-6 my-sm-0 my-4">
					<div class="contact-grid1 text-center">
						<div class="con-ic">
							<i class="fas fa-phone rounded-circle"></i>
						</div>
						<h4 class="font-weight-bold mt-sm-4 mt-3 mb-3">Mobile</h4>
						<p>
                                                    <%=mobile%>
						</p>
					</div>
				</div>
				<div class="col-sm-2 contact-grid agileinfo-6">
					<div class="contact-grid1 text-center">
						<div class="con-ic">
							<i class="fas fa-envelope-open rounded-circle"></i>
						</div>
						<h4 class="font-weight-bold mt-sm-4 mt-3 mb-3">Email</h4>
						<p>
                                                     <%=email%>   
						</p>
					</div>
				</div>
                                               
                                                
			</div>
                                                <div class="resp-tabs-container hor_1">

						<div>
							<div class="vertical_post check_box_agile">
							Payment Method :<h2>COD</h2>								
							</div>
						</div>

                                                    <center>  <h1 ><a href="confirm_order.jsp?id=<%=order_id%>"> Place Order</a></h1></center>
                     </div>
                </div>
        </div>
        <%
         }
        else{
                String pr_code=null;
                ResultSet rs=st.executeQuery("select * from orders where order_id='"+con_id+"'");
                if(rs.next()){
                    pr_code=rs.getString("pcode");
                }

        %>
            <div class="contact py-sm-5 py-4" id="rusmeen">
		<div class="container py-xl-4 py-lg-2">
                    Order Succuessfull
                     <a href="view_bill.jsp?id=<%=con_id%>&pcode=<%=pr_code%>">View bill</a>
                    
                </div>
            </div>
        
        
        <%
        }
        %>
	
	<!-- //payment page -->

	<!-- middle section -->
	<!-- //copyright -->

	<!-- js-files -->
	<!-- jquery -->
	
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
				alert('The minimum orders quantity is 3. Please add more to your shopping cart before checking out');
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

	<!-- easy-responsive-tabs -->
	<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
	<script src="js/easyResponsiveTabs.js"></script>

	<script>
		$(document).ready(function () {
			//Horizontal Tab
			$('#parentHorizontalTab').easyResponsiveTabs({
				type: 'default', //Types: default, vertical, accordion
				width: 'auto', //auto or any width like 600px
				fit: true, // 100% fit in a container
				tabidentify: 'hor_1', // The tab groups identifier
				activate: function (event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#nested-tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
		});
	</script>
	<!-- //easy-responsive-tabs -->

	<!-- credit-card -->
	<script src="js/creditly.js"></script>
	<link rel="stylesheet" href="css/creditly.css" type="text/css" media="all" />
	<script>
		$(function () {
			var creditly = Creditly.initialize(
				'.creditly-wrapper .expiration-month-and-year',
				'.creditly-wrapper .credit-card-number',
				'.creditly-wrapper .security-code',
				'.creditly-wrapper .card-type');


			$(".creditly-card-form .submit").click(function (e) {
				e.preventDefault();
				var output = creditly.validate();
				if (output) {
					// Your validated credit card output
					console.log(output);
				}
			});
		});
	</script>

	<!-- creditly2 (for paypal) -->
	<script src="js/creditly2.js"></script>
	<script>
		$(function () {
			var creditly = Creditly2.initialize(
				'.creditly-wrapper .expiration-month-and-year-2',
				'.creditly-wrapper .credit-card-number-2',
				'.creditly-wrapper .security-code-2',
				'.creditly-wrapper .card-type');

			$(".creditly-card-form-2 .submit").click(function (e) {
				e.preventDefault();
				var output = creditly.validate();
				if (output) {
					// Your validated credit card output
					console.log(output);
				}
			});
		});
	</script>

	<!-- //credit-card -->


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