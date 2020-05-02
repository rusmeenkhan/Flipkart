
<%@page import="java.sql.*,java.util.*"%>
<head>
	<title>Electro Store Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Electro Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"
	/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
       function display(v){
            $.post("cart.jsp",{id:v},function(data){
                        $("#cart").append(data);
                    }
            );
       }              
   $(document).on("click",".btn.btn-primary",function(){
           var x=$(this).attr("rel").trim();
           var y=$(this).attr("id").trim();
           var v=y.substring(y.indexOf("_")+1);
           var v2="p_"+v;
           $.post("additem.jsp",{id:v},function(data){
             var u=data.substring(0,data.indexOf("_"));
             var w=data.substring(data.indexOf("_")+1).trim();
             $("#check").html(u);
             $("#"+v2).html(w);
             if(w=="Add to cart"){
             $("#"+v2).css("background-color","blue");
         }
         else{
             $("#"+v2).css("background-color","red");
             
         }
         });
         });
        });
</script>
<script>
   $(document).ready(function(){
       $(".load_more").click(function(){
           var v=$(this).attr("id");  
           var p =parseInt(v)+1;
           $(".load_more").attr("id",p);
           var x=$(this).attr("rel");
           var u="page_"+x;
           $.post("load_more.jsp",{id:v,subccode:x},function(data){
               if(data.length==27){
                 $(".load_more").fadeOut(10);
             }
             $("#"+u).append(data); 
           });         
       });
   }); 
    
</script>
<script>
   $(document).ready(function(){
       $(".fa.fa-heart").click(function(){
         var v=$(this).attr("id");
         var ucode=$(this).attr("rel");
         var pcode=v.substring(0,v.indexOf("_"));
         $.post("wishlist.jsp",{ucode:ucode,pcode:pcode},function(data){
             var z=data.trim();
             if(z=="login"){
                 $("#exampleModal").modal();
            }
             else{
                    var p=data.substring(0,data.indexOf("_"));
                    var q=data.substring(data.indexOf("_")+1).trim();
                    $("#wish").html(p);
                    if(q=="Add to wishlist"){
                     $("#"+v).css("color","black");
                   }
                   else{
                       $("#"+v).css("color","red");
                   }  
            }
         });        
       });
   }); 
    
</script>
 
</head>

<body>

    <%
        try{
            String subcategory_code=null;
            String subccode=request.getParameter("id");
            String ucode=null;
            String uscode="";     
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
            Statement st=cn.createStatement();
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
                                                                subcategory_code=rs5.getString("subccode");
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
	

	<!-- top-header -->
	<!-- //navigation -->

	<!-- banner -->
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
							<a class="button2" href="product.html">Shop Now </a>
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
							<a class="button2" href="product.html">Shop Now </a>
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
							<a class="button2" href="product.html">Shop Now </a>
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
							<a class="button2" href="product.html">Shop Now </a>
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

	<!-- top Products -->
	<div class="ads-grid py-sm-5 py-4">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>O</span>ur
				<span>N</span>ew
				<span>P</span>roducts</h3>
			<!-- //tittle heading -->
			<div class="row">
				<!-- product left -->
				<div class="agileinfo-ads-display col-lg-9">
					<div class="wrapper" id="rusmeen">
						<!-- first section -->
						<div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4" >
							<h3 class="heading-tittle text-center font-italic">New Brand Mobiles</h3>
							<div class="row" id="page_<%=subccode%>">
                                                            
                                                            <%
                                                               int No_of_item=0;
                                                               int ic=0;
                                                               Class.forName("com.mysql.jdbc.Driver");
                                                               Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                                                               Statement st1=cn1.createStatement();  
                                                               ResultSet rs1=st1.executeQuery("select * from product where Block='Block' AND status=1 AND subcategory_code='"+subccode+"' limit 3");
                                                               while(rs1.next())
                                                                 { 
                                                                     String sn=rs1.getString("sn");
                                                                     String pcode=rs1.getString("product_code");
                                                                     String product_name=rs1.getString("product_name"); 
                                                                     String MRP=rs1.getString("MRP");
                                                                     String offer_price=rs1.getString("offer_price");
                                                                     String seller_code=rs1.getString("seller_code");
                                                                     subccode=rs1.getString("subcategory_code");
                                                                     No_of_item=rs1.getInt("No_of_item");
                                                                %>
                                                                    <div class="col-md-4 product-men mt-5" id="<%=pcode%>_d">
                                                    <div class="men-pro-item simpleCart_shelfItem">
                                                            <div class="men-thumb-item text-center">
                                                                <img src="seller/products/1_<%=pcode%>.jpg" alt="" style="width:180px;height:250px">
                                                                    <div class="men-cart-pro">
                                                                            <div class="inner-men-cart-pro">
                                                                                    <a href="single.jsp?id=<%=pcode%>&scode=<%=seller_code%>" class="link-product-add-cart">Quick View</a>
                                                                            </div>
                                                                    </div>
                                                                            
                                                            </div>
                                                            <%
                                                                Connection cn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
                                                                Statement st2=cn2.createStatement();
                                                                ResultSet rs8=st2.executeQuery("select * from wishlist where pcode='"+pcode+"' AND ucode='"+ucode+"'");
                                                                if(rs8.next()){
                                                                %>
                                                                <span class="fa fa-heart" id="<%=pcode%>_w" rel="<%=ucode%>" style="color:red"></span> 
                                                                <%  
                                                                }
                                                                else{
                                                                %>
                                                                <span class="fa fa-heart" id="<%=pcode%>_w" rel="<%=ucode%>"></span>
                                                                <%
                                                                }
                                                                %>
                                                            <div class="item-info-product text-center border-top mt-4">
                                                                                <h4 class="pt-1">
                                                                                        <a href="single.jsp?id=<%=pcode%>&scode=<%=seller_code%>"><%=product_name%></a>
                                                                                </h4>
                                                                                <div class="info-product-price my-2">
                                                                                        <span class="item_price"><%=offer_price%> rs/-</span>
                                                                                        <del><%=MRP%> rs/-</del>
                                                                                </div>
                                                                                <%
                                                                                 if(No_of_item>0){ 
                                                                                    ResultSet rs9=st2.executeQuery("select * from temp where pcode='"+pcode+"' AND ucode='"+uscode+"'");
                                                                                    if(rs9.next()){
                                                                                    %>
                                                                                      <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                                                                        <button id="p_<%=pcode%>" rel="Remove" ucode="<%=uscode%>" class="btn btn-primary" style="background-color:red">Remove From cart </button>	
                                                                                      </div> 
                                                                                    <%
                                                                                        cn1.close();
                                                                                    }
                                                                                    else{
                                                                                    %>
                                                                                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                                                                            <button id="p_<%=pcode%>" rel="Add" ucode="<%=uscode%>" class="btn btn-primary" >Add to cart </button>	
                                                                                        </div>
                                                                                    <%
                                                                                    }
                                                                                }
                                                                                else{
                                                                                %>
                                                                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                                                                        <h4 style="background-color:red">Out Of Stock </h4>	
                                                                                </div> 
                                                                                <%
                                                                                }
                                                                                %>
                                                                                
                                                                        </div>
                                                                </div>
                                                                    </div>
								
								<%
                                                                  }
                                                                %>
							
                                                        </div>
						</div>
						<!-- //first section -->
						<!-- second section -->
						
					</div>
                                <%
                                 if(ic==0||ic==-1){
                                         %>
                                    <div class="col-md-3 product-men mt-5">
                                                <button class="load_more" id="<%=ic+1%>" rel="<%=subccode%>" style="margin-top:150px">Load More</button>
                                    </div>
                                <%
                                    }
                                else
                                   {
                                %>
                                        <div class="col-md-3 product-men mt-5">
                                             <button class="load_more" id="<%=ic-1%>" rel="<%=subccode%>" style="margin-top:150px;margin-left: 20px">Load prev</button>
                                        </div>
                                        <div class="col-md-3 product-men mt-5">
                                             <button class="load_more" id="<%=ic+1%>" rel="<%=subccode%>" style="margin-top:150px">Load More</button>
                                        </div>
                                <%
                                    }
                                %>
				</div>
                        
				<!-- //product left -->

				<!-- product right -->
				<div class="col-lg-3 mt-lg-0 mt-4 p-lg-0">
					<div class="side-bar p-sm-4 p-3">
						<div class="search-hotel border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Search Here..</h3>
							<form action="#" method="post">
								<input type="search" placeholder="Product name..." name="search" required="">
								<input type="submit" value=" ">
							</form>
						</div>
						<!-- price -->
						<div class="range border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Price</h3>
							<div class="w3l-range">
								<ul>
									<li>
										<a href="#">Under $1,000</a>
									</li>
									<li class="my-1">
										<a href="#">$1,000 - $5,000</a>
									</li>
									<li>
										<a href="#">$5,000 - $10,000</a>
									</li>
									<li class="my-1">
										<a href="#">$10,000 - $20,000</a>
									</li>
									<li>
										<a href="#">$20,000 $30,000</a>
									</li>
									<li class="mt-1">
										<a href="#">Over $30,000</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- //price -->
						<!-- discounts -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Discount</h3>
							<ul>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">5% or More</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">10% or More</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">20% or More</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">30% or More</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">50% or More</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">60% or More</span>
								</li>
							</ul>
						</div>
						<!-- //discounts -->
						<!-- reviews -->
						<div class="customer-rev border-bottom left-side py-2">
							<h3 class="agileits-sear-head mb-3">Customer Review</h3>
							<ul>
								<li>
									<a href="#">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<span>5.0</span>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<span>4.0</span>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star-half"></i>
										<span>3.5</span>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<span>3.0</span>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star-half"></i>
										<span>2.5</span>
									</a>
								</li>
							</ul>
						</div>
						<!-- //reviews -->
						<!-- electronics -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Electronics</h3>
							<ul>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Accessories</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Cameras & Photography</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Car & Vehicle Electronics</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Computers & Accessories</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">GPS & Accessories</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Headphones</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Home Audio</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Home Theater, TV & Video</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Mobiles & Accessories</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Portable Media Players</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Tablets</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Telephones & Accessories</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Wearable Technology</span>
								</li>
							</ul>
						</div>
						<!-- //electronics -->
						<!-- delivery -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Cash On Delivery</h3>
							<ul>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Eligible for Cash On Delivery</span>
								</li>
							</ul>
						</div>
						<!-- //delivery -->
						<!-- arrivals -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">New Arrivals</h3>
							<ul>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Last 30 days</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">Last 90 days</span>
								</li>
							</ul>
						</div>
						<!-- //arrivals -->
						<!-- best seller -->
						<div class="f-grid py-2">
							<h3 class="agileits-sear-head mb-3">Best Seller</h3>
							<div class="box-scroll">
								<div class="scroll">
									<div class="row">
										<div class="col-lg-3 col-sm-2 col-3 left-mar">
											<img src="images/k1.jpg" alt="" class="img-fluid">
										</div>
										<div class="col-lg-9 col-sm-10 col-9 w3_mvd">
											<a href="">Samsung Galaxy On7 Prime (Gold, 4GB RAM + 64GB Memory)</a>
											<a href="" class="price-mar mt-2">$12,990.00</a>
										</div>
									</div>
									<div class="row my-4">
										<div class="col-lg-3 col-sm-2 col-3 left-mar">
											<img src="images/k2.jpg" alt="" class="img-fluid">
										</div>
										<div class="col-lg-9 col-sm-10 col-9 w3_mvd">
											<a href="">Haier 195 L 4 Star Direct-Cool Single Door Refrigerator</a>
											<a href="" class="price-mar mt-2">$12,499.00</a>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-3 col-sm-2 col-3 left-mar">
											<img src="images/k3.jpg" alt="" class="img-fluid">
										</div>
										<div class="col-lg-9 col-sm-10 col-9 w3_mvd">
											<a href="">Ambrane 13000 mAh Power Bank (P-1310 Premium)</a>
											<a href="" class="price-mar mt-2">$1,199.00 </a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- //best seller -->
					</div>
					<!-- //product right -->
				</div>
			</div>
		</div>
	</div>
	<!-- //top products -->

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
	<footer>
		<div class="footer-top-first">
			<div class="container py-md-5 py-sm-4 py-3">
				<!-- footer first section -->
				<h2 class="footer-top-head-w3l font-weight-bold mb-2">Electronics :</h2>
				<p class="footer-main mb-4">
					If you're considering a new laptop, looking for a powerful new car stereo or shopping for a new HDTV, we make it easy to
					find exactly what you need at a price you can afford. We offer Every Day Low Prices on TVs, laptops, cell phones, tablets
					and iPads, video games, desktop computers, cameras and camcorders, audio, video and more.</p>
				<!-- //footer first section -->
				<!-- footer second section -->
				<div class="row w3l-grids-footer border-top border-bottom py-sm-4 py-3">
					<div class="col-md-4 offer-footer">
						<div class="row">
							<div class="col-4 icon-fot">
								<i class="fas fa-dolly"></i>
							</div>
							<div class="col-8 text-form-footer">
								<h3>Free Shipping</h3>
								<p>on orders over $100</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 offer-footer my-md-0 my-4">
						<div class="row">
							<div class="col-4 icon-fot">
								<i class="fas fa-shipping-fast"></i>
							</div>
							<div class="col-8 text-form-footer">
								<h3>Fast Delivery</h3>
								<p>World Wide</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 offer-footer">
						<div class="row">
							<div class="col-4 icon-fot">
								<i class="far fa-thumbs-up"></i>
							</div>
							<div class="col-8 text-form-footer">
								<h3>Big Choice</h3>
								<p>of Products</p>
							</div>
						</div>
					</div>
				</div>
				<!-- //footer second section -->
			</div>
		</div>
		<!-- footer third section -->
		<div class="w3l-middlefooter-sec">
			<div class="container py-md-5 py-sm-4 py-3">
				<div class="row footer-info w3-agileits-info">
					<!-- footer categories -->
					<div class="col-md-3 col-sm-6 footer-grids">
						<h3 class="text-white font-weight-bold mb-3">Categories</h3>
						<ul>
							<li class="mb-3">
								<a href="product.html">Mobiles </a>
							</li>
							<li class="mb-3">
								<a href="product.html">Computers</a>
							</li>
							<li class="mb-3">
								<a href="product.html">TV, Audio</a>
							</li>
							<li class="mb-3">
								<a href="product2.html">Smartphones</a>
							</li>
							<li class="mb-3">
								<a href="product.html">Washing Machines</a>
							</li>
							<li>
								<a href="product2.html">Refrigerators</a>
							</li>
						</ul>
					</div>
					<!-- //footer categories -->
					<!-- quick links -->
					<div class="col-md-3 col-sm-6 footer-grids mt-sm-0 mt-4">
						<h3 class="text-white font-weight-bold mb-3">Quick Links</h3>
						<ul>
							<li class="mb-3">
								<a href="about.html">About Us</a>
							</li>
							<li class="mb-3">
								<a href="contact.html">Contact Us</a>
							</li>
							<li class="mb-3">
								<a href="help.html">Help</a>
							</li>
							<li class="mb-3">
								<a href="faqs.html">Faqs</a>
							</li>
							<li class="mb-3">
								<a href="terms.html">Terms of use</a>
							</li>
							<li>
								<a href="privacy.html">Privacy Policy</a>
							</li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-grids mt-md-0 mt-4">
						<h3 class="text-white font-weight-bold mb-3">Get in Touch</h3>
						<ul>
							<li class="mb-3">
								<i class="fas fa-map-marker"></i> 123 Sebastian, USA.</li>
							<li class="mb-3">
								<i class="fas fa-mobile"></i> 333 222 3333 </li>
							<li class="mb-3">
								<i class="fas fa-phone"></i> +222 11 4444 </li>
							<li class="mb-3">
								<i class="fas fa-envelope-open"></i>
								<a href="mailto:example@mail.com"> mail 1@example.com</a>
							</li>
							<li>
								<i class="fas fa-envelope-open"></i>
								<a href="mailto:example@mail.com"> mail 2@example.com</a>
							</li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-grids w3l-agileits mt-md-0 mt-4">
						<!-- newsletter -->
						<h3 class="text-white font-weight-bold mb-3">Newsletter</h3>
						<p class="mb-3">Free Delivery on your first order!</p>
						<form action="#" method="post">
							<div class="form-group">
								<input type="email" class="form-control" placeholder="Email" name="email" required="">
								<input type="submit" value="Go">
							</div>
						</form>
						<!-- //newsletter -->
						<!-- social icons -->
						<div class="footer-grids  w3l-socialmk mt-3">
							<h3 class="text-white font-weight-bold mb-3">Follow Us on</h3>
							<div class="social">
								<ul>
									<li>
										<a class="icon fb" href="#">
											<i class="fab fa-facebook-f"></i>
										</a>
									</li>
									<li>
										<a class="icon tw" href="#">
											<i class="fab fa-twitter"></i>
										</a>
									</li>
									<li>
										<a class="icon gp" href="#">
											<i class="fab fa-google-plus-g"></i>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- //social icons -->
					</div>
				</div>
				<!-- //quick links -->
			</div>
		</div>
		<!-- //footer third section -->

		<!-- footer fourth section -->
		<div class="agile-sometext py-md-5 py-sm-4 py-3">
			<div class="container">
				<!-- brands -->
				<div class="sub-some">
					<h5 class="font-weight-bold mb-2">Mobile & Tablets :</h5>
					<ul>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Android Phones</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Smartphones</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Feature Phones</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Unboxed Phones</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Refurbished Phones</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2"> Tablets</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">CDMA Phones</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Value Added Services</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Sell Old</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Used Mobiles</a>
						</li>
					</ul>
				</div>
				<div class="sub-some mt-4">
					<h5 class="font-weight-bold mb-2">Computers :</h5>
					<ul>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Laptops </a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Printers</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Routers</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Ink & Toner Cartridges</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Monitors</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Video Games</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Unboxed & Refurbished Laptops</a>
						</li>
						<li>
							<a href="product.html" class="border-right pr-2">Assembled Desktops</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Data Cards</a>
						</li>
					</ul>
				</div>
				<div class="sub-some mt-4">
					<h5 class="font-weight-bold mb-2">TV, Audio & Large Appliances :</h5>
					<ul>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">TVs & DTH</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Home Theatre Systems</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Hidden Cameras & CCTVs</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Refrigerators</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Washing Machines</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2"> Air Conditioners</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Cameras</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Speakers</a>
						</li>
					</ul>
				</div>
				<div class="sub-some mt-4">
					<h5 class="font-weight-bold mb-2">Mobile & Laptop Accessories :</h5>
					<ul>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Headphones</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Power Banks </a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Backpacks</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Mobile Cases & Covers</a>
						</li>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Pen Drives</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">External Hard Disks</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2"> Mouse</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Smart Watches & Fitness Bands</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">MicroSD Cards</a>
						</li>
					</ul>
				</div>
				<div class="sub-some mt-4">
					<h5 class="font-weight-bold mb-2">Appliances :</h5>
					<ul>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Trimmers</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Hair Dryers</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Emergency Lights</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Water Purifiers </a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Electric Kettles</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Hair Straighteners</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Induction Cooktops</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Sewing Machines</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2"> Geysers</a>
						</li>
					</ul>
				</div>
				<div class="sub-some mt-4">
					<h5 class="font-weight-bold mb-2">Popular on Electro Store</h5>
					<ul>
						<li class="m-sm-1">
							<a href="product.html" class="border-right pr-2">Offers & Coupons</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Couple Watches</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Gas Stoves</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2"> Air Coolers</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Air Purifiers</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Headphones</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2"> Headsets</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Pressure Cookers</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Sandwich Makers</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Air Friers</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Irons</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">LED TV</a>
						</li>
						<li class="m-sm-1">
							<a href="product2.html" class="border-right pr-2">Sandwich Makers</a>
						</li>
					</ul>
				</div>
				<!-- //brands -->
				<!-- payment -->
				<div class="sub-some child-momu mt-4">
					<h5 class="font-weight-bold mb-3">Payment Method</h5>
					<ul>
						<li>
							<img src="images/pay2.png" alt="">
						</li>
						<li>
							<img src="images/pay5.png" alt="">
						</li>
						<li>
							<img src="images/pay1.png" alt="">
						</li>
						<li>
							<img src="images/pay4.png" alt="">
						</li>
						<li>
							<img src="images/pay6.png" alt="">
						</li>
						<li>
							<img src="images/pay3.png" alt="">
						</li>
						<li>
							<img src="images/pay7.png" alt="">
						</li>
						<li>
							<img src="images/pay8.png" alt="">
						</li>
						<li>
							<img src="images/pay9.png" alt="">
						</li>
					</ul>
				</div>
				<!-- //payment -->
			</div>
		</div>
		<!-- //footer fourth section (text) -->
	</footer>
	<!-- //footer -->
	<!-- copyright -->
	<div class="copy-right py-3">
		<div class="container">
			<p class="text-center text-white">� 2018 Electro Store. All rights reserved | Design by
				<a href="http://w3layouts.com"> W3layouts.</a>
			</p>
		</div>
	</div>
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
	
	<!-- scroll seller -->
	<script src="js/scroll.js"></script>
	<!-- //scroll seller -->

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