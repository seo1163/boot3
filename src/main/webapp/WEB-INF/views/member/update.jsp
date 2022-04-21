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

<div class="container mt-4">
	<div class="row mt-4">
		<div class="alert alert-light" role="alert">
	  		<h4 style="text-transform: uppercase;">${board} Update</h4>
		</div>
	</div>
	
	
	<div class="row mt-4">
		<form action="update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${dto.id}">
		  <div class="row mb-3">
		    <label  for="email"  class="col-sm-2 col-form-label">Email</label>
		    <div class="col-sm-10">
		      <input type="text" value="${dto.email}" name="email" class="form-control" id="email">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="name" class="col-sm-2 col-form-label">NAME</label>
		    <div class="col-sm-10">
		      <input type="text" value="${dto.name}" name="name" class="form-control" id="name">
		    </div>
		  </div>
		 <div class="row mb-3">
		    <label for="phone" class="col-sm-2 col-form-label">PHONE</label>
		    <div class="col-sm-10">
		      <textarea name="phone" class="form-control" id="phone">${dto.phone}</textarea>
		    </div>
		  </div>
		  
		  <!-- <div class="row mb-3">
		    <label for="files" class="col-sm-2 col-form-label">File</label>
		    <div class="col-sm-10">
		      <input type="file" name="files" class="form-control" id="files">
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="files" class="col-sm-2 col-form-label">File</label>
		    <div class="col-sm-10">
		      <input type="file" name="files" class="form-control" id="files">
		    </div>
		  </div>-->
		  
		  
		  
		 
		  <button type="submit" class="btn btn-primary">Update</button>
		</form>
	
	</div>
	
	
</div>	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>