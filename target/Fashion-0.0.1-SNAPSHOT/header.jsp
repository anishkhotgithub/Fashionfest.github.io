<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init({easing:'ease-in-out-sine'});
</script>
<style type="text/css">
	/* body
	{
		background-image: url('https://images.unsplash.com/photo-1513151233558-d860c5398176?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHw%3D&w=1000&q=80');
	} */
	nav
	{
		background-color: #93AFDC;
	}
	
</style>
</head>

<body>
 <div class="" data-aos="fade-down-right">
 <nav class="navbar navbar-expand-lg navbar-dark">
  <center>
  <a class="navbar-brand" href="clothes.jsp">Fashionfest<span class="sr-only">(current)</a>
  </center>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     <c:if test="${u==null}">
    		<li class="nav-item">
        	<a class="nav-link" href="login.jsp">Login</a>
			</li> 
     </c:if>
    <li class="nav-item">
        <a class="nav-link" href="categoryclothes.jsp?gender=Mens">Mens</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="categoryclothes.jsp?gender=Womens">Womens</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="categoryclothes.jsp?gender=Kids">Kids</a>
      </li>
      <!--Expression Language (EL) -->
     
       <c:if test="${u.email!=null}">
        <c:if test="${u.role=='admin'}">
      		<li class="nav-item">
        		<a class="nav-link" href="UpdateBanner.jsp">Update Banner</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="addclothes.jsp">Add clothes</a>
      		</li>
      	</c:if>
      		<!-- <li class="nav-item">
        		<a class="nav-link" href="#"></a>
      		</li> -->
      	<li class="nav-item">
	        <a class="nav-link" href="login.jsp">Logout</a>
    	  </li>
		</c:if>  
		<li class="nav-item">
        		<a class="nav-link" href="cart.jsp">Cart</a>
      	</li>    
    </ul>
    <!-- <a href="books.jsp?sort=hightolow" class="btn btn-primary">High To Low</a>
    <a href="books.jsp?sort=lowtohigh" class="btn btn-danger">Low to High</a> -->
    <form class="form-inline my-2 my-lg-0" action="books.jsp">
      <input class="form-control mr-sm-2" type="search" name="bookname" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
</div>
</body>
</html>