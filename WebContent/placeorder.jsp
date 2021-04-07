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
        border-radius: 10px;
        box-shadow: 12px 12px 22px grey;
      }
      img{
        border-top-left-radius: 30px;
        height: 900%;
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
   <jsp:include page="header.jsp"></jsp:include>
  <section class="Form my-4 mx-5">
    <div class="container">
      <div class="row no-gutters">
        <div class="col-lg-5">
          <img src="https://i.pinimg.com/736x/b0/98/aa/b098aab38c8efb4916a5a65dd8913b52.jpg" class="img-fluid" alt="">
        </div>
        <div class="col-lg-7 px-5 pt-5">
          <h4>Place Order</h4>
          <form action="" method="post">
            <div class="form-row">
              <div class="col-lg-7">
                <input type="text" name="name" placeholder="Your-Name" value="${u.name}" class="form-control my-3 p-4">
              </div>
             </div>
             <div class="form-row">
              <div class="col-lg-7">
                <input type="text" name="clothesname" placeholder="clothes brand" value="${param.brandname}" class="form-control my-3 p-4">
              </div>
             </div>
             <div class="form-row">
             	<div class="col-lg-7">
                <input type="text" name="size" value="${param.inlineRadioOptions}" placeholder="size" class="form-control my-3 p-4" readonly>
              </div>
             </div>
             <div class="form-row">
              <div class="col-lg-7">
                <input type="text" name="phone" placeholder="Your number" class="form-control my-3 p-4">
              </div>
             </div>
             <div class="form-row">
              <div class="col-lg-7">
                <input type="text" name="price" value="${param.pricevalue}" placeholder="price" class="form-control my-3 p-4" readonly="readonly">
              </div>
             </div>
             <div class="form-row">
              <div class="col-lg-7">
                <textarea rows="4" cols="45" placeholder="Your Address" class="form-control my-3 p-4"></textarea>
              </div>
             </div>
             <div class="form-row">
              <div class="col-lg-7">
                <input type="submit" class="btn1 mt-3 mb-5" value="PlaceOrder">
              </div>
             </div>
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