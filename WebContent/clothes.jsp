<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	    .carousel-item
        {
          height: 25rem;
          background: #777;
        }
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
 <%-- <jsp:include page="clothesbanner.jsp"></jsp:include> --%>
<jsp:include page="brand.jsp"></jsp:include>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/Fashionfest"
					   user="root"
					   password="root"
					   var="con"/>
	<c:if test="${param.clothesname==null}">
	<sql:query var="rs" dataSource="${con}">
		select * from clothes
	</sql:query>
	</c:if>
	<c:if test="${param.clothesname!=null}">
	<sql:query var="rs" dataSource="${con}">
		select * from clothes where brandname like '%' ? '%'
		<sql:param>${param.clothesname}</sql:param>
	</sql:query>
	</c:if>
	<div class="">
		<h1>Best Clothes</h1>
		<div class="row">
			<c:forEach items="${rs.rows}" var="row">
				<div class=m-0>	
					<div class="card" style="width: 16rem; margin-top:10px">
						<center><a href="imageslideshow.jsp?id=${row.clothesid}"><img src="ImageServlet?id=${row.clothesid}" onmouseover="this.src='ImageServlet2?id=${row.clothesid}'" onmouseout="this.src='ImageServlet?id=${row.clothesid}'" style="width: 250px;height: 300px;" class="card-img-top" alt="..."></a></center>
							<div class="card-body">
								<h5 class="card-title">${row.brandname}</h5>
								<p class="card-text">${row.category}</p>
							</div>
							<ul class="list-group list-group-flush">
								<center><li class="list-group-item"><h4>RS.${row.price}  <strike>${row.pricestrike}</strike></h4></li></center>
							</ul>
							<div class="card-body">
								<%-- <a href="AddToCartServlet?id=${row.clothesid}" class="btn btn-primary btn-block">Add To Cart</a> --%>
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
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>