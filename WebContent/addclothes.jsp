<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	.myclass
	{
		margin:0 auto;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>	
	$(document).ready(function(){
		  $(".show_clothes_form").click(function(){
		    $("#clothes").hide(2000);
		    $("#bannerclothes").show(2000);
		  });
		});
	$(document).ready(function(){
		  $(".show_banner_form").click(function(){
		    $("#bannerclothes").hide(2000);
		    $("#clothes").show(1000);
		  });
		});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<div class="container">
		<form action='AddClothesServlet' id="clothes" method='post' enctype="multipart/form-data" class="myclass col-lg-6 col-md-9 col-sm-12 col-xs-12">
			<div class="form-group">
				<label>Enter Brand Name</label>
				<input type="text" name="brandname" placeholder="Brand name" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Type of clothes</label>
				<input type="text" name="category" placeholder="Category" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Price</label>
				<input type="text" name="price" placeholder="Enter Price" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Price Strike</label>
				<input type="text" name="pricestrike" placeholder="Enter Price Strike" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Select Image1</label>
				<input type="file" name="image" placeholder="Select Image" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Select Image2</label>
				<input type="file" name="image2" placeholder="Select Image" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Select Image3</label>
				<input type="file" name="image3" placeholder="Select Image" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Select Image4</label>
				<input type="file" name="image4" placeholder="Select Image" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Select category </label><br>
				<select id="gender" name="gender">
					<option value="Mens">Mens</option>
					<option value="Womens">Womens</option>
					<option value="Kids">Kids</option>
				</select>
			</div>
			<div class="form-group">
				<label>Description</label><br>
				<textarea rows="4" cols="68" name="description"></textarea>
			</div>
			<div class="form-group">
				<input type="submit" value="Add Clothes" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			<a class="show_clothes_form" href="#"><p>Adding clothes for banner</p></a>
		</form>
		</div>
		<div class="container">
		<form action='AddBannerImage' id="bannerclothes" method='post' enctype="multipart/form-data" class="myclass col-lg-6 col-md-9 col-sm-12 col-xs-12" style="display: none; ">
			<div class="form-group">
				<label>Enter Offer</label>
				<input type="text" name="offer" placeholder="Offer" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Bannerimage 1</label>
				<input type="text" name="bimage1" placeholder="Select Image" class="form-control"/>
			</div>
				<div class="form-group">
				<label>Bannerimage 2</label>
				<input type="text" name="bimage2" placeholder="Select Image" class="form-control"/>
			</div>
				<div class="form-group">
				<label>Bannerimage 3</label>
				<input type="text" name="bimage3" placeholder="Select Image" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Add Clothes" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
			<a class="show_banner_form" href="#"><p>Adding clothes</p></a>
		</form>
		</div>
	</div>
</body>
</html>