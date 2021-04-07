<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<style>
  *
  {
    margin: 0;
    padding: 0;
  }
  .product-small-img img
  {
    height: 92px;
    margin: 10px 0;
    cursor: pointer;
    display: block;
    opacity: 6;
  }
  .product-small-img img:hover
  {
    opacity: 1;
  }
  .product-small-img
  {
    float: left;
  }
  .product
  {
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    position: absolute;
  }
  .img-container img
  {
    height: 400px;
    width: 500px;
  }
  .img-container
  {
    float: right;
    padding: 10px;
  }
  .form-check-label
  {
  	font-size: 30px;
  }  
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
  <sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/Fashionfest"
					   user="root"
					   password="root"
					   var="con"/>
	<sql:query var="rs" dataSource="${con}">
		select * from clothes where clothesid=?
		<sql:param>${param.id}</sql:param>
	</sql:query>
  <div class="product" style="margin-top: 40px;">
  	<div class="row">
  	<c:forEach items="${rs.rows}" var="row">
    <div class="product-small-img">
        <img src="ImageServlet?id=${row.clothesid}"  onclick="myfunction(this)">
        <img src="ImageServlet2?id=${row.clothesid}" onclick="myfunction(this)" >
        <img src="ImageServlet3?id=${row.clothesid}" onclick="myfunction(this)">
        <img src="ImageServlet4?id=${row.clothesid}" onclick="myfunction(this)">
        <!--<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1N2WhsXlVvP9GQ6QcsuW-sbijUJBHgXQSqAZEeJ4sodvHgLT_8vP_y8r3ExgHYmGFkL4&usqp=CAU" onclick="myfunction(this)">  
     --></div>
    <div class="img-container">
      <img id="imagebox" src="ImageServlet?id=${row.clothesid}">
    </div>
    </div>
    <center>
   <form action="AddToCartServlet">
   <div class="form-check form-check-inline">
    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="S" checked="checked">
    <label class="form-check-label" for="inlineRadio1">S</label>
  </div>
  <div class="form-check form-check-inline">
    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="M">
    <label class="form-check-label" for="inlineRadio2">M</label>
  </div>
  <div class="form-check form-check-inline">
    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="XL" >
    <label class="form-check-label" for="inlineRadio3">XL</label>
  </div>
  <div class="form-check form-check-inline">
    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="XXL" >
    <label class="form-check-label" for="inlineRadio3">XXL</label>
  </div>
  <div class="form-check form-check-inline">
    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="XXXL" >
    <label class="form-check-label" for="inlineRadio3">XXXL</label>
  </div>
  </center>
  <input type="text" name="brandname" value="${row.brandname}" hidden>
  <center><h3 style="margin-top: 30px;" name="price">Rs.${row.price}</h3><strike>${row.pricestrike}</strike></center>
  <h1>${row.description}</h1>
  <input type="text" name="id" value="${row.clothesid}" hidden>
 	<input type="text" name="pricevalue" value="${row.price}" hidden>
  </c:forEach>
  <%-- <a href="OrderController?id=${row.clothesid}" class="btn btn-primary btn-danger">Order</a> --%>
  <input type="submit" value="Add to Cart" class="btn btn-primary btn-block">
    </form>
    </div>
    <script>
        function myfunction(smallImg)
        {
          var fullImg=document.getElementById("imagebox");
          fullImg.src=smallImg.src;
        }
    </script>
</body>
</html>
