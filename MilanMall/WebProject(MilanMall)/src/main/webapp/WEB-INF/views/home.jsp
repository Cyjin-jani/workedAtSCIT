<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>[MilanMall에 오신걸 환영합니다.]</title>
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
/* Set the width of the sidebar to 120px */
.w3-sidebar {width: 120px;background: #222;}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {margin-left: 120px}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
	
	$(function(){
		
		$('.buybtn').on('click', function(){
			var prod_num = $(this).next('.prod_numHid').val();
			
			location.href="product/goPdView?prod_num="+prod_num;
		});
		
	});
	function fakeQA(){
		alert("문의가 성공적으로 접수되었습니다.");
		return true;
	}
	
</script>
<body class="w3-black">
	<!-- Icon Bar (Sidebar - hidden on small screens) -->
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
  <!-- Avatar image in top left corner -->
  <img src="resources/image/milanmain.jpg" style="width:100%">
  <a href="#" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>HOME</p>
  </a>
  <a href="#about" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>ABOUT</p>
  </a>
  <a href="#shopping" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa w3-xxlarge"> <img src="resources/image/shopping_cart.png" style="width:50px"></i>
    <p>SHOP</p>
  </a>
  <a href="board/list" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa w3-xxlarge"> <img src="resources/image/board-icon.png" style="width:50px"></i>
    <p>REVIEW BOARD</p>
  </a>
  
</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="#" class="w3-bar-item w3-button" style="width:25% !important">HOME</a>
    <a href="#about" class="w3-bar-item w3-button" style="width:25% !important">ABOUT</a>
    <a href="#shopping" class="w3-bar-item w3-button" style="width:25% !important">SHOP</a>
     <a href="board/list" class="w3-bar-item w3-button" style="width:25% !important">REVIEW BOARD</a>
  </div>
</div>

<!-- Page Content -->
<div class="w3-padding-large" id="main">
  <!-- Header/Home -->
  <header class="w3-container w3-padding-32 w3-center w3-black" id="home">
  
  <c:choose>
  <c:when test="${loginId == null }">
   <div align="right">
	   <!--회원가입 페이지로 이동 -->
	    <a href="member/joinForm">
	    <button class="w3-button">
	      JOIN NOW
	    </button>
	    </a>
	    
	    <!--로그인 페이지로 이동 -->
	    <a href="member/loginForm">
	    <button class="w3-button">
	      LOGIN
	    </button>
	    </a>
	    </div>
	</c:when>
	<c:otherwise>
		 <div align="right">
	   <!--회원정보 페이지로 이동 -->
	     <a href="member/updateForm">
	    <button class="w3-button" id="memberinfo">
	      ${name }'s Info
	    </button>
	    </a>
	    
	     <a href="product/gobuyComplete">
	    <button class="w3-button" id="memberinfo">
	      My Order
	    </button>
	    </a>
	    
	     <a href="product/goMyCart">
	    <button class="w3-button" id="memberinfo">
	     	My Cart
	    </button>
	    </a>
	    
	    <!--로그인 페이지로 이동 -->
	    <a href="member/logout">
	    <button class="w3-button">
	      LOGOUT
	    </button>
	    </a>
	    </div>
	</c:otherwise> 
	</c:choose> 
    
    <br>
    <h1 class="w3-jumbo">We are ACMILAN.</h1>
    <p>Association Calcio Milano in Italy</p>
    <img src="resources/image/mainhome.png" alt="boy" class="w3-image" width="992" height="1108">
  </header>

  <!-- About Section -->
  <div class="w3-content w3-justify w3-text-grey w3-padding-64" id="about">
    <h2 class="w3-text-light-grey">MILAN STORE</h2>
    <hr style="width:200px" class="w3-opacity">
    <p>
	Inside Milan Store, <br>
	you will find the all kinds of items about the club, 
	its history, its key players and the jerseys. <br>
	The customer service is open daily, from 09:00 until 18:00. 
    </p>
    <h3 class="w3-padding-16 w3-text-light-grey">What we have</h3>
    <p class="w3-wide">Jersys</p>
    <p class="w3-wide">Training clothes</p>
    <p class="w3-wide">souvenir</p>
    <p class="w3-wide">Ball</p>
    <p class="w3-wide">Cap</p>
    <p class="w3-wide">Shirts</p>
    <p class="w3-wide">Pants</p>
	<br>
    
    <div class="w3-row w3-center w3-padding-16 w3-section w3-light-grey">
      <div class="w3-quarter w3-section">
        <span class="w3-xlarge">30+</span><br>
        Products
      </div>
      <div class="w3-quarter w3-section">
        <span class="w3-xlarge">S~XL</span><br>
        Size
      </div>
      <div class="w3-quarter w3-section">
        <span class="w3-xlarge">89+</span><br>
        Available Countries
      </div>
      <div class="w3-quarter w3-section">
        <span class="w3-xlarge">30%</span><br>
        Sales
      </div>
    </div>
    
   
    <!-- 쇼핑몰 제품 리스트 보여주기 -->
    
   <div style="height: 20px;"  id="shopping"></div>
	<c:forEach var="prd" items="${productList }">
    	<p></p>
    	<div style="float: left; width: 33%; height: 280px;">
	
			<img style="size: 150px;" alt="" src="<c:url value="${prd.prod_imgpath }" />"> <br>
			<span>${prd.prod_name }</span> <br>
	 		<c:choose>
		 		<c:when test="${prd.prod_ea != 0}">
					<span>￦ ${prd.prod_price } </span>
				</c:when>
				<c:otherwise>
					SOLD OUT
				</c:otherwise>
			</c:choose>
			 <br>
		<input type="button" class="w3-button w3-white buybtn" value="Buy" > 
		<input type="hidden" value="${prd.prod_num}" class="prod_numHid">
		<div style="height: 20px;"> <br> </div>
		
		</div>
		
    </c:forEach>
    <div style="float: left; width: 33%; height: 280px;" ></div>
    <div style="float: left; width: 33%; height: 280px;"></div>
    <br>
     <br>
     <br>
    
    
     <c:if test="${loginId != null}">
  	  <div class="w3-justify" style="width: 100%">
        <form onsubmit="return fakeQA()">
        <h2 align="left">Contact</h2>
        <p>Questions? Go ahead.</p>
          <p><input class="w3-input w3-border" type="text" placeholder="Name" name="Name" required></p>
          <p><input class="w3-input w3-border" type="email" placeholder="Email" name="Email" required></p>
          <p><input class="w3-input w3-border" type="text" placeholder="Subject" name="Subject" required></p>
          <p><input class="w3-input w3-border" type="text" placeholder="Message" name="Message" required></p>
          <button type="submit" class="w3-button w3-block w3-black">Send</button>
        </form>
      </div>
      </c:if>

    <!-- Footer -->
  <footer class="w3-content w3-padding-64 w3-text-grey w3-xlarge">
  	 
       <div class="w3-justify">
        <h3>-Store-</h3>
        <p><i class="fa fa-fw fa-map-marker"></i> MilanMall</p>
        <p><i class="fa fa-fw fa-phone"></i> 0044123123</p>
        <p><i class="fa fa-fw fa-envelope"></i> acmilanist91@gmail.com</p>
        <h3>-We accept-</h3>
        <p><i class="fa fa-fw fa-credit-card"></i> Credit Card</p>
        <i class="fa fa-facebook-official w3-hover-opacity w3-large"></i>
        <i class="fa fa-instagram w3-hover-opacity w3-large"></i>
        <i class="fa fa-snapchat w3-hover-opacity w3-large"></i>
        <i class="fa fa-pinterest-p w3-hover-opacity w3-large"></i>
        <i class="fa fa-twitter w3-hover-opacity w3-large"></i>
        <i class="fa fa-linkedin w3-hover-opacity w3-large"></i>
      </div>
      
  	 <img src="resources/image/milanmain.jpg">
    <p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank" class="w3-hover-text-green">w3.css</a></p>
  <!-- End footer -->
  </footer>

<!-- END PAGE CONTENT -->
</div>
</div>
</body>
</html>
