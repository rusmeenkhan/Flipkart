
    <%@page import="java.sql.*,java.util.*"%>
    <%
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st=cn.createStatement();
            if(request.getParameter("id")==null||request.getParameter("name")==null||request.getParameter("mob")==null||request.getParameter("Email")==null){
                response.sendRedirect("index.jsp?allFeildRequired");
            }
            else
            {
                    String uscode=request.getParameter("id");  
                    String Name=request.getParameter("name");
                    String mobile=request.getParameter("mob");
                    String Email=request.getParameter("Email");
                    String landmark=request.getParameter("landmark");
                    String city=request.getParameter("city");
                    String addresstype=request.getParameter("addtype");  
                    String email=null;
                    Cookie ch[]=request.getCookies();
                    for(int i=0;i<ch.length;i++)
                        {        
                          if(ch[i].getName().equals("user"))
                          {
                              email=ch[i].getValue();
                              break;
                          }
                        }
                    String order_id="";     
                    LinkedList l=new LinkedList();
                    for(char c='a';c<='z';c++)
                    {
                        l.add(c+"");
                    }
                     for(char c='A';c<='Z';c++)
                    {
                        l.add(c+"");
                    }
                      for(char c='0';c<='9';c++)
                    {
                        l.add(c+"");
                    }
                    Collections.shuffle(l);
                     for(int i=1;i<=5;i++)
                    {
                       order_id+=l.get(i);

                    }
                    if(email!=null&&session.getAttribute(email)!=null)
                      {       
                        String size=null;
                        String pcode=null;
                        String ucode=null;
                        String seller_code=null;
                        String product_name=null;
                        Class.forName("com.mysql.jdbc.Driver");
                        
                        Connection cn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                        Statement st2=cn2.createStatement();
                        ResultSet rs4=st2.executeQuery("select * from user where Email='"+email+"'");
                        if(rs4.next())
                        {
                            ucode=rs4.getString("ucode");
                        }
                        ResultSet rs=st2.executeQuery("select * from temp where ucode='"+uscode+"'");
                        while(rs.next())
                        { 
                            int quantity=0;
                            int price=0;
                            pcode=rs.getString("pcode"); 
                            Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                            Statement st1=cn1.createStatement();
                            ResultSet rs1=st1.executeQuery("select * from product where product_code='"+pcode+"'");
                            while(rs1.next())
                            { 
                                seller_code=rs1.getString("seller_code");
                                product_name=rs1.getString("product_name");
                                size=rs1.getString("size");
                            }
                            
                            Connection cn3=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                            Statement st3=cn3.createStatement();
                            ResultSet rs2=st3.executeQuery("select * from temp where ucode='"+uscode+"' AND pcode='"+pcode+"'");
                            if(rs2.next())
                            { 
                               quantity=rs2.getInt("quantity");
                               price=rs2.getInt("price");
                            }
                            PreparedStatement ps=cn.prepareStatement("insert into orders (uname,Email,pcode,ucode,mobile,city,landmark,addresstype,order_id,seller_code,quantity,price,pname,size) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");                                   
                            ps.setString(1,Name);
                            ps.setString(2,Email);
                            ps.setString(3,pcode);
                            ps.setString(4,ucode);
                            ps.setString(5,mobile);
                            ps.setString(6,city);
                            ps.setString(7,landmark);
                            ps.setString(8,addresstype);
                            ps.setString(9,order_id);  
                            ps.setString(10,seller_code);
                            ps.setInt(11,quantity);
                            ps.setInt(12,price);
                            ps.setString(13,product_name);
                            ps.setString(14,size);
                            ps.execute(); 
                            cn1.close();
                        }
                        st.execute("update temp set ucode='"+ucode+"' where ucode='"+uscode+"'");
                        st.execute("update temp_address set ucode='"+ucode+"' where ucode='"+uscode+"'");
                        response.sendRedirect("payment.jsp?id="+order_id);
                   }
            else
                {
                    PreparedStatement ps=cn.prepareStatement("insert into temp_address (Name,mobile,Email,landmark,city,address_type,ucode) values (?,?,?,?,?,?,?)");
                    ps.setString(1,Name);
                    ps.setString(2,mobile);
                    ps.setString(3,Email);
                    ps.setString(4,landmark);
                    ps.setString(5,city);
                    ps.setString(6,addresstype);
                    ps.setString(7,uscode);
                    ps.execute();
                    cn.close();
                    %>
                    
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
	<title>Electro Store Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>
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
      <script src="js/jquery-2.2.3.min.js"></script>
	<!-- menu style -->
	<!-- //Custom-Files -->

	<!-- web fonts -->
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //web fonts -->

</head>

<body>
    


	<!-- shop locator (popup) -->
	<!-- //header-bottom -->
	<!-- navigation -->
	
	<!-- //navigation -->

	<!-- banner -->
	
	<!-- //banner -->
<div class="agile-main-top">
		<div class="container-fluid">
			<div class="row main-top-w3l py-2">
				<div class="col-lg-4 header-most-top">
					<p class="text-white text-lg-left text-center">Offer Zone Top Deals & Discounts
						<i class="fas fa-shopping-cart ml-1"></i>
					</p>
				</div>
				
			</div>
		</div>
	</div>
	<!-- top Products -->
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
								<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" required>
								<button class="btn my-2 my-sm-0" type="submit">Search</button>
							</form>
						</div>
						<!-- //search -->
						<!-- cart details -->
						<div class="col-2 top_nav_right text-center mt-sm-0 mt-2">
							<div class="wthreecartaits wthreecartaits2 cart cart box_1">
								<form action="#" method="post" class="last">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="display" value="1">
									<button class="btn w3view-cart" type="submit" name="submit" value="">
										<i class="fas fa-cart-arrow-down"></i>
									</button>
								</form>
							</div>
						</div>
						<!-- //cart details -->
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="row">
				<!-- product left -->
				<div class="agileinfo-ads-display col-lg-10">
					<div class="wrapper">
						<!-- first section -->
						
							<h3 style="margin-left: 650px">User Login</h3>
							<div class="row">
								<div class="modal-body">
                                                                    <form action="check1.jsp?id=<%=order_id%>" method="post" style="margin-left: 400px">
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
                                                                                                                               
                                                                                </p>
                                                                        </form>
                                                                </div>
							</div>
												<!-- //first section -->
						<!-- second section -->
						
				</div>
				<!-- //product left -->

				<!-- product right -->
				
			</div>
		</div>

        
	<!-- middle section -->
		<!-- middle section -->

	<!-- footer -->
	
	<!-- //footer -->
	<!-- copyright -->
	

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
       
</body>

</html>
                    
                    
                    
                  <%
                 }
            }
            
        }
        catch(Exception e){
        out.println(e.getMessage());
        }
                %>