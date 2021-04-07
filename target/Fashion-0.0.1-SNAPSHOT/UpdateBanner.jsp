<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/Fashionfest"
					   user="root"
					   password="root"
					   var="con"/>
					
		<sql:query var="rs" dataSource="${con}">
			select * from Bannmerimage where bannerid=?
			<sql:param>${param.id}</sql:param>
		</sql:query>
	
		<div class="container">	
		<%-- <c:forEach items="${rs.rows}" var="row"> --%>
			<form action='UpdateBannerImage' method='post' class="myclass col-lg-6 col-md-9 col-sm-12 col-xs-12">
			<div class="form-group">
				<label>Banner id</label>
				<input type="text" name="bannerid" value="${param.bannerid}"  class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Offer</label>
				<input type="text" name="offer" value="${row.Offer}"  class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter image url1</label>
				<input type="text" name="bimage1" value="${row.bimage1}" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter image url2</label>
				<input type="text" name="bimage2" value="${row.bimage2}" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter image url3</label>
				<input type="text" name="bimage3" value="${row.bimage3}" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Update Banner" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
		<%-- </c:forEach> --%>
		</div>
</body>
</html>