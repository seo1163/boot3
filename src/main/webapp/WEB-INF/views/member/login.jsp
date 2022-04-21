<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<main class="form-signin">

  <form class="needs-validation" novalidate action="./login" method="post" enctype="multipart/form-data">
    
   
	
    <div class="col-sm-6">
      <label for="floatingInput">ID</label>
      <input type="text" class="form-control" id="floatingInput" placeholder="ID" name="id">
    </div>
    <div class="col-sm-6">
      <label for="floatingPassword">Password</label>
      <input type="text" class="form-control" id="floatingPassword" placeholder="pw" name="pw">
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="1" name="remember"> Remember me
      </label>
    </div>
    <button class="w-50 btn btn-lg btn-primary" type="submit">Sign in</button>
    
  </form>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>