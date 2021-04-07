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
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">	
		<form action='CheckOTPServlet'method='post' class="col-lg-6 col-md-9 col-sm-12 col-xs-12 myclass">
			<div class="form-group">
				<label>Enter OTP</label>
				<input type="text" name="otp" placeholder="Enter otp" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Confirm OTP" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
		</div>
</body>
</html>