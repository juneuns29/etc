<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Gallery</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/gallery/css/w3.css">
<link rel="stylesheet" type="text/css" href="/gallery/css/user.css">
<script type="text/javascript" src="/gallery/js/jquery-3.7.1.min.js"></script>
<style type="text/css">
	.w3-bar-block .w3-bar-item {
		padding:20px
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#food h3').css('display', 'none');
		$('#food').next().find('h3').css('display', 'none');
	});
</script>
</head>
<body>

	<div class="w3-content mxw800">
		<!-- Sidebar (hidden by default) -->
		<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
			<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button">Close Menu</a>
			<a href="#food" onclick="w3_close()" class="w3-bar-item w3-button">Food</a>
			<a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">About</a>
		</nav>
		
		<!-- Top menu -->
		<div class="w3-top">
			<div class="w3-white w3-xlarge" style="max-width: 800px;">
				<div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
				<div class="w3-right w3-padding-16">Mail</div>
				<div class="w3-center w3-padding-16">My Food</div>
			</div>
		</div>
		  
		<!-- !PAGE CONTENT! -->
		<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
		
			<!-- Photo Grid-->
			<div class="w3-col w3-center" id="food">
				
	<c:forEach var="data" items="${LIST}">
				<div class="inblock w3-card-4 w3-margin-bottom pdh10 w3-center mgr5" style="width: 360px; height: 750px;">
					<div class="w3-col w3-center">
						<div class="inblock" style="width: 340px; height: 530px; overflow: hidden;">
							<img src="/gallery/image/photo/${data.savename}" 
										alt="${data.oriname}" style="height:530px; width: auto;">
						</div>
						<div class="w3-col w3-margin-bottom">
							<b class="w3-col s3 w3-text-blue w3-right-align">제 목 : </b>
							<span class="w3-col s8 pdl10 w3-left-align">${data.title}</span>
						</div>
						<div class="w3-col w3-margin-top">
							<b class="w3-col s3 w3-text-blue w3-right-align">작성자 : </b>
							<span class="w3-col s3 pdl10 w3-left-align">${data.id}</span>
						</div>
						<div class="w3-col">
							<b class="w3-col s3 w3-text-blue w3-right-align">작성일 : </b>
							<span class="w3-col s8 pdl10 w3-left-align">${data.sdate}</span>
						</div>
						<div class="w3-half">
							<b class="w3-col s6 w3-text-blue w3-right-align">조회수 : </b>
							<span class="w3-col s6 pdl10 w3-left-align">${data.cnt}</span>
						</div>
					</div>
				</div>
	</c:forEach>

		<!--  -->
		<!-- Pagination -->
		<div class="w3-col w3-center w3-padding-32">
			<div class="w3-bar">
			  <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
			  <a href="#" class="w3-bar-item w3-black w3-button">1</a>
			  <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
			  <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
			  <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
			  <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
			</div>
		</div>
		  
		  <hr id="about">
		
		  <!-- About Section -->
		  <div class="w3-col w3-padding-32 w3-center">  
		    <h3>About Me, The Food Man</h3><br>
		    <img src="/gallery/image/photo/chef.jpg" alt="Me" class="w3-image" style="display:block;margin:auto" width="800" height="533">
		    <div class="w3-padding-32">
		      <h4><b>I am Who I Am!</b></h4>
		      <h6><i>With Passion For Real, Good Food</i></h6>
		      <p>Just me, myself and I, exploring the universe of unknownment. I have a heart of love and an interest of lorem ipsum and mauris neque quam blog. I want to share my world with you. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
		    </div>
		  </div>
		  <hr>
		  
		  <!-- Footer -->
		  <footer class="w3-row-padding w3-padding-32">
		    <div class="w3-third">
		      <h3>FOOTER</h3>
		      <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
		      <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
		    </div>
		  
		    <div class="w3-third">
		      <h3>BLOG POSTS</h3>
		      <ul class="w3-ul w3-hoverable">
		        <li class="w3-padding-16">
		          <img src="/gallery/image/photo/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">
		          <span class="w3-large">Lorem</span><br>
		          <span>Sed mattis nunc</span>
		        </li>
		        <li class="w3-padding-16">
		          <img src="/gallery/image/photo/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">
		          <span class="w3-large">Ipsum</span><br>
		          <span>Praes tinci sed</span>
		        </li> 
		      </ul>
		    </div>
		
		    <div class="w3-third w3-serif">
		      <h3>POPULAR TAGS</h3>
		      <p>
		        <span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Dinner</span>
		        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Salmon</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">France</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Drinks</span>
		        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Flavors</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Cuisine</span>
		        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Chicken</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Dressing</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Fried</span>
		        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Fish</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Duck</span>
		      </p>
		    </div>
		  </footer>
		
		<!-- End page content -->
		</div>
	</div>

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>

</body>
</html>
