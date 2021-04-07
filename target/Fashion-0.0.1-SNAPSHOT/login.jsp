<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Anish, Bot!</title>
    <style>
      *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
      }
      body{
        background: rgb(219 226 226);
      }
      .row{
        background: white;
        border-radius: 30px;
        box-shadow: 12px 12px 22px grey;
      }
      img{
        border-top-left-radius: 30px;
        height: 800%;
        width: 100%
      }
      .btn1{
        border: none;
        outline: none;
        height: 50px;
        width: 100%;
        background-color: black;
        color: white;
        border-radius: 4px;
        font-weight: bold;
      }
      .btn1:hover{
        background: white;
        border: 1px;
        color: black;
      }
    </style>
  </head>
  <body>
  <%
			session.removeAttribute("u");
    		session.invalidate();
  %>
   <jsp:include page="header.jsp"></jsp:include>
  <section class="Form my-4 mx-5">
    <div class="container">
      <div class="row no-gutters">
        <div class="col-lg-5">
          <img src="https://www.mychicobsession.com/wp-content/uploads/2018/08/model-outfits-9.jpg" class="img-fluid" alt="">
        </div>
        <div class="col-lg-7 px-5 pt-5">
          <h1 class="font-weight-bold py-3">Sign in</h1>
          <h4>Sign in to your account</h4>
          <form action="LoginServlet" method="post">
            <div class="form-row">
              <div class="col-lg-7">
                <input type="text" placeholder="Email-Address" name="email"  class="form-control my-3 p-4">
              </div>
             </div>
             <div class="form-row">
              <div class="col-lg-7">
                <input type="password" placeholder="*******" name="password" class="form-control my-3 p-4">
              </div>
             </div>
             <div class="form-row">
              <div class="col-lg-7">
                <input type="submit" value="Login" class="btn1 mt-3 mb-5">
              </div>
             </div>
             <a href="collectemail.jsp">Forgot password</a>
             <p>Don't have a account? <a href="register.jsp">Register here</a></p>
          </form>
        </div>
        
      </div>
    </div>
  </section>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>