<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%-- <jsp:include page="header.jsp"></jsp:include> --%>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/Fashionfest"
					   user="root"
					   password="root"
					   var="con"/>
<sql:query var="rs" dataSource="${con}">
	select * from brand
</sql:query>
	<div class="container">
		<div class="row">
			<c:forEach items="${rs.rows}" var="row">
				<div class=m-0>	
					<div class="card" style="width: 13rem; margin-top:10px;margin-left: 20px;" >
						<center><a href="catchbrandclothes.jsp?id=${row.brandname}"><img src="${row.brandimage}" style="width: 200px;height: 200px;" class="card-img-top" alt="..."></a></center>
							<div class="card-body">
								<center>
								<b><h5 class="card-title">${row.brandname}</h5></b>
								<p class="card-text">${row.offer}</p>
								</center>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>
	
</body>
</html>