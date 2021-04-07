<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<jsp:include page="header.jsp"></jsp:include>
 	 <sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/Fashionfest"
					   user="root"
					   password="root"
					   var="con"/>
					
	<!-- Display only particular book -->
	<!-- Take bookid from last page books.jsp using ${param.bookid} -->   
	<c:if test="${param.gender!=null}">
		<sql:query var="rs" dataSource="${con}">
			select * from clothes where gender=?;
			<sql:param>	${param.gender}</sql:param>		
		</sql:query>
	</c:if>
	<c:if test="${param.id!=null}">
		<sql:query var="rs" dataSource="${con}">
			select * from clothes where clothesid=?;
			<sql:param>	${param.id}</sql:param>		
		</sql:query>
	</c:if>
			
	 <div class="">
		<div class="row">
						<c:forEach items="${rs.rows}" var="row">
						<div class=m-0 >	
							<div class="card" style="width: 16rem; margin-top:10px">
								<center><a href="imageslideshow.jsp?id=${row.clothesid}"><img src="ImageServlet?id=${row.clothesid}" onmouseover="this.src='ImageServlet2?id=${row.clothesid}'" onmouseout="this.src='ImageServlet?id=${row.clothesid}'" style="width: 250px;height: 300px;" class="card-img-top" alt="..."></a></center>
								<div class="card-body">
									<h5 class="card-title">${row.brandname}</h5>
									<p class="card-text">${row.category}</p>
						 		</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">RS.${row.price}</li>
								</ul>
								<div class="card-body">
								<a href="AddToCartServlet?id=${row.clothesid}" class="btn btn-primary btn-block">Add To Cart</a>
								<!-- <a href="#" class="btn btn-success">Buy</a> -->
								<c:if test="${u.role=='admin'}">
									<a href="DeleteServlet?clothesid=${row.clothesid}" class="btn btn-danger btn-block">Delete</a>
									<a href="edit.jsp?bookid=${row.clothesid}" class="btn btn-warning btn-block">Edit</a>
								</c:if>
							</div>
								
							</div>
						</div>
					</c:forEach>
		</div>
	</div>		   
</body>
</html>

