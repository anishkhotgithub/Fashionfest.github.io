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
					
		<!-- Display only particular book -->
		<!-- Take bookid from last page books.jsp using ${param.bookid} -->   
		<sql:query var="rs" dataSource="${con}">
			select * from clothes where clothesid=?
			<sql:param>${param.bookid}</sql:param>
		</sql:query>
	
		<div class="container">
		<c:forEach items="${rs.rows}" var="row">
		<form action='UpdateClotheServlet' method='post' class="myclass col-lg-6 col-md-9 col-sm-12 col-xs-12">
			<div class="form-group">
				<label>Clothe id</label>
				<input type="text" name="clothesid" value="${row.clothesid}" readonly="readonly" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Brand Name</label>
				<input type="text" name="brandname" value="${row.brandname}" placeholder="Enter Brandname" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Type of clothe</label>
				<input type="text" name="category" value="${row.category}" placeholder="clothe category" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Price</label>
				<input type="text" name="price" value="${row.price}" placeholder="Enter Price" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Price Strike</label>
				<input type="text" name="pricestrike" value="${row.pricestrike}" placeholder="Enter Price" class="form-control"/>
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
				<label>Description</label>
				<input type="text" name="pricestrike" value="${row.description}" placeholder="Enter clothe description" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Update Book" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
		</c:forEach>
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</body>
</html>0