 
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
           var v=$(".load_more").attr("id");  
           var p =parseInt(v)+1;
           $(".load_more").attr("id",p);
           var x=$(".load_more").attr("rel");
           var y=$(".load_more").attr("ucode");
           alert(x);
           var u="page_"+x;
           $.post("load_more.jsp",{id:v,subccode:x,ucode:y},function(data){
              alert(data.length);
            if(data.length==27){
                 $("#"+x).fadeOut(10);
             }
             $("#"+u).append(data); 
           });         
       });
   }); 
    
</script>
<script>
   $(document).on("click",".load_more.item",function(){
           var v=$(".load_more.item").attr("id");
           var p =parseInt(v)+1;
           $(".load_more.item").attr("id",p);
           var x=$(this).attr("rel");
           $.post("load_more_item.jsp",{id:v,rel:x},function(data){
               if(data.length==760){
                 $(".load_more.item").fadeOut(10);
             }
             $("#khan").append(data);
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
            if(email!=null&&session.getAttribute(email)!=null){
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
                                       if(email!=null&&session.getAttribute(email)!=null){               
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
                                                       String subcategory_code=null;             
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

	<!-- top Products -->
	<div class="ads-grid py-sm-5 py-4" >
            <div class="container py-xl-4 py-lg-2" id="rusmeen">
			<!-- tittle heading -->
                <h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
                    <span>O</span>ur
                    <span>N</span>ew
                    <span>P</span>roducts
                </h3>
			<!-- //tittle heading -->
            <div class="row" >
                            <!-- product left -->
                <div class="agileinfo-ads-display col-lg-9" >
                    <div class="wrapper" >
                        <%
                            int No_of_product=0;
                            ResultSet rs10=st.executeQuery("select * from subcategory where  status=1");
                            while(rs10.next())
                                 { 
                                     String Subcategory=rs10.getString("Subcategory");
                                     String subcategory_code=rs10.getString("subccode");
                                     Connection cn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
                                     Statement st2=cn2.createStatement();
                                     ResultSet rs01=st2.executeQuery("select count(*) from product where  Block='Block' AND status=1 AND subcategory_code='"+subcategory_code+"'");
                                     if(rs01.next())
                                       { 
                                          No_of_product=rs01.getInt(1);
                                       }
                                     if(No_of_product>0){
                        %>
                                <!-- first section -->
                        <div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4" >
                            <h3 class="heading-tittle text-center font-italic">New <%=Subcategory%></h3>
                                <div class="row"  >
                                    <div class="row"  id="page_<%=subcategory_code%>" style="overflow:scroll;height:400px;overflow-x: hidden;width:100%">
                                        <%     
                                            int ic=0;
                                            String subccode=null;
                                            String product_code=null;
                                            int No_of_item=0;
                                            String seller_code=null;
                                            Statement st1=cn2.createStatement();
                                            ResultSet rs1=st1.executeQuery("select * from product where  Block='Block' AND status=1 AND subcategory_code='"+subcategory_code+"' limit 3");
                                            while(rs1.next())
                                               { 
                                                 String sn=rs1.getString("sn");
                                                 String pcode=rs1.getString("product_code");
                                                 String product_name=rs1.getString("product_name"); 
                                                 String MRP=rs1.getString("MRP");
                                                 String offer_price=rs1.getString("offer_price");
                                                 No_of_item=rs1.getInt("No_of_item");
                                                 seller_code=rs1.getString("seller_code");
                                                 subccode=rs1.getString("subcategory_code");
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
                                                                            cn2.close();
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
                            <div>
                                <%
                                 if(ic==0||ic==-1){
                                         %>
                                    <div class="col-md-3 product-men mt-5"  id="<%=subcategory_code%>">
                                                <button class="load_more" id="<%=ic+1%>" rel="<%=subcategory_code%>" ucode="<%=uscode%>" style="margin-top:150px">Load More</button>
                                    </div>
                                <%
                                    }
                                else{
                                %>
                                        <div class="col-md-3 product-men mt-5" >
                                             <button class="load_more" id="<%=ic-1%>" rel="<%=subcategory_code%>" ucode="<%=uscode%>" style="margin-top:150px;margin-left: 20px">Load prev</button>
                                        </div>
                                        <div class="col-md-3 product-men mt-5" id="<%=subcategory_code%>">
                                             <button class="load_more" id="<%=ic+1%>" rel="<%=subcategory_code%>" ucode="<%=uscode%>" style="margin-top:150px">Load More</button>
                                        </div>
                                <%
                                    }
                                %>


                            </div>
                        </div>
                                <%
                                    }
                                }
                                %>           
                                    </div>
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
			$(".scroll").mouseover(){
				$(this).stop();
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
            cn.close();
        }
        catch(NullPointerException e){
            response.sendRedirect("index.jsp");
        }

        %>
</body>

</html>