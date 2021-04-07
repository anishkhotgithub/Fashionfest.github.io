<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	.myclass
	{
		margin:0 auto;
	}	
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<form action='AddBrandServlet' id="clothes" method='post' enctype="multipart/form-data" class="myclass col-lg-6 col-md-9 col-sm-12 col-xs-12">
			<div class="form-group">
				<label>Enter Brand</label>
				<input type="text" name="brand" placeholder="Brand name" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Offer</label>
				<input type="text" name="offer" placeholder="Enter Ofeer" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Select Url</label>
				<input type="text" name="imageurl" placeholder="Select Image Url" class="form-control"/>
			</div>	
			<div class="form-group">
				<input type="submit" value="Add Clothes" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
		</form>
		</div>
</body>
</html>