
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
	<title>Electro Store Ecommerce Category Bootstrap Responsive Web Template | Checkout :: w3layouts</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Electro Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"
	/>
        <script src="js/jquery-2.2.3.min.js"></script>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
   $(document).ready(function(){
       $(".btn.btn-danger").click(function(){
           var v=$(this).attr("id");
           var x=$(this).attr("rel");
           var p=("c_"+v+"_"+x).trim();
           $.post("order_cancel.jsp",{id:v,pcode:x},function(data){
               $("#"+p).fadeOut(10);
           });   
       });
   });   
</script> 
<script>
   $(document).ready(function(){
       $("#search").keyup(function(){
           var v=$(this).val();
           var u=$(this).attr("rel");
           $.post("search_order.jsp",{id:v,rel:u},function(data){
            $("#rusmeen").html(data);
           });  
       });
   }); 
    
</script>
<script>
   $(document).on("click",".btn.btn-primary.next",function(){
           var v=$(this).attr("id");
           var u=$(this).attr("rel");
           $.post("next_order.jsp",{id:v,rel:u},function(data){  
                  $("#rusmeen").html(data);
           });  
       });  
</script>
<script>
   $(document).on("click",".btn.btn-primary.previous",function(){
           var v=$(this).attr("id");
           var u=$(this).attr("rel");
           $.post("next_order.jsp",{id:v,rel:u},function(data){  
                  $("#rusmeen").html(data);
           });  
       });  
</script>
</head>

<body>
    <%
        try{
            String email=null;
            Cookie c[]=request.getCookies();
            for(int i=0;i<c.length;i++)
            {
              if(c[i].getName().equals("seller"))
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
                   ResultSet rs=st.executeQuery("select * from seller where Email='"+email+"'");
                   if(rs.next()){
                       String seller_code=rs.getString("scode");
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
							<a href="profile.jsp"  class="text-white">
								<i class="fas fa-user mr-2" id="pro"></i> My Profile</a>
                                    </li>                                       
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
	

	<!-- Button trigger modal(select-location) -->
	
	<!-- //shop locator (popup) -->

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
						<div class="col-10 agileits_search">
							<form class="form-inline" action="#" method="post">
                                                            <input class="form-control mr-sm-2" rel="<%=seller_code%>" id="search" type="search" placeholder="Search"  aria-label="Search" required>
								<button class="btn my-2 my-sm-0" type="submit">Search</button>
							</form>
						</div>
						<!-- //search -->
						<!-- cart details -->
						<div class="col-2 top_nav_right text-center mt-sm-0 mt-2">
							<div class="wthreecartaits wthreecartaits2 cart cart box_1" >
								
									<button class="btn w3view-cart" type="submit" name="submit" value="">
                                                                            <a href="checkout.jsp"><i  class="fas fa-cart-arrow-down" id="check"></i></a>
									</button>
						
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

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto text-center mr-xl-5">
						<li class="nav-item mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="index.jsp">Home
								<span class="sr-only">(current)</span>
							</a>
                                                </li>                                               
                                                <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="orders.jsp">
								Manage Orders
							</a>
						</li>
                                                <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="products.jsp">
								Manage Products
							</a>
						</li>
                                                <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="places.jsp">
								Manage My Places
							</a>
						</li>
				
						
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- //navigation -->

	<!-- banner-2 -->
	<div class="page-head_agile_info_w3l">

	</div>
	<!-- //banner-2 -->
	<!-- page -->
	
	<!-- //page -->
	<!-- checkout page -->
	<div class="privacy py-sm-5 py-4">
		<div class="container py-xl-4 py-lg-2" id="rusmeen">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>All </span>Orders
			</h3>

							
                                <% 
                                    int ic=0; 
                                    int count=0;
                                    ResultSet rs2=st.executeQuery("select count(*) from orders where confirmation_status='confirm' AND seller_code='"+seller_code+"'");
                                    if(rs2.next()){
                                      count=rs2.getInt(1);  
                                    }
                                   ResultSet rs1=st.executeQuery("select * from orders where confirmation_status='confirm' AND seller_code='"+seller_code+"' limit 5");
                                   while(rs1.next())
                                     { 
                                         String uname=rs1.getString("uname");
                                         String quantity=rs1.getString("quantity");
                                         String product_name=rs1.getString("pname");
                                         String price=rs1.getString("price");
                                         String pcode=rs1.getString("pcode");
                                         String order_id=rs1.getString("order_id");
                                         String delivery_status=rs1.getString("delivery_status");
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
	
	<!-- copyright -->
	<div class="copy-right py-3">
		<div class="container">
			<p class="text-center text-white">© 2018 Electro Store. All rights reserved | Design by
				<a href="http://w3layouts.com"> W3layouts.</a>
			</p>
		</div>
	</div>
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
	<script>
		$('.value-plus').on('click', function () {
			var divUpd = $(this).parent().find('.value'),
				newVal = parseInt(divUpd.text(), 10) + 1;
			divUpd.text(newVal);
		});

		$('.value-minus').on('click', function () {
			var divUpd = $(this).parent().find('.value'),
				newVal = parseInt(divUpd.text(), 10) - 1;
			if (newVal >= 1) divUpd.text(newVal);
		});
	</script>
	<!--quantity-->
	<script>
		$(document).ready(function (c) {
			$('.close1').on('click', function (c) {
				$('.rem1').fadeOut('slow', function (c) {
					$('.rem1').remove();
				});
			});
		});
	</script>
	<script>
		$(document).ready(function (c) {
			$('.close2').on('click', function (c) {
				$('.rem2').fadeOut('slow', function (c) {
					$('.rem2').remove();
				});
			});
		});
	</script>
	<script>
		$(document).ready(function (c) {
			$('.close3').on('click', function (c) {
				$('.rem3').fadeOut('slow', function (c) {
					$('.rem3').remove();
				});
			});
		});
	</script>
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
             }
        else
           {
            response.sendRedirect("index.jsp?loginRequired");
            }
        cn.close();
        }
        catch(Exception e){
        out.println(e.getMessage());
        }
        %>

</body>

</html>