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
		<div class="alert alert-primary" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">${board} List</h4>
		</div>
	</div>
	
	<div class="row mt-4">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Num</th>
					<th>Title</th>
					<th>Writer</th>
					<th>Hit</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.num}</td>
					<td><a class="link-success text-decoration-none" href="./detail?num=${vo.num}">${vo.title}</a></td>
					<td>${vo.writer}</td>
					<td>${vo.hit}</td>
					<td>${vo.regDate}</td>
				</tr>
			</c:forEach>	
			</tbody>
			
		</table>
	</div>
	
	<div class="row">
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" href="./list?pn=${pager.pre?pager.startNum-1:1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    <li class="page-item"><a class="page-link" href="./list?pn=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
		    </c:forEach>
		    
		    <li class="page-item">
		      <a class="page-link" href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	
	</div>
	
	
	
	<div class="row justify-content-between">
		<div class="col-5">
			<form class="d-flex" action="./list" method="get">
				<div class="col-4 me-2">
				<select name="kind" class="form-select " aria-label="Default select example">
				  <option value="col1">Title</option>
				  <option value="col2">Contents</option>
				  <option value="col3">Writer</option>
				</select>
				</div>
				<div class="col-6 me-2">
	        	<input name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
	        	</div>
	        	<div class="col-2">
	        	<button class="btn btn-outline-success" type="submit">Search</button>
	        	</div>
	      </form>
		</div>
		<div class="col-1">
			<a href="./add" type="button" class="btn btn-outline-primary">WRITE</a>
		</div>
	</div>

</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>