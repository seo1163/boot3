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
	<c:import url="../temp/header_script.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<main class="form-signin">

  <form class="needs-validation" novalidate action="./login" method="post" enctype="multipart/form-data">
    
   
	
   <div class="container mt-4">
		<div class="row mt-4">
			<div class="alert alert-light" role="alert">
				<h4 style="text-transform: uppercase;">아이디 찾기</h4>
			</div>
		</div>


		<div class="row mt-4">
			<form action="findId" method="post">
				<div class="row mb-3">
					<label for="email" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-10">
						<input type="text" name="email" class="form-control" id="email">
					</div>
				</div>
<button type="submit" class="btn btn-primary">ID찾기</button>
			</form>

		</div>


	</div>


	
	</script>
</body>
</html>