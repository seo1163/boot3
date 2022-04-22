<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div class="container mt-4">
		<div class="row mt-4">
			<div class="alert alert-light" role="alert">
				<h4 style="text-transform: uppercase;">${board}Write</h4>
			</div>
		</div>


		<div class="row mt-4">
			<form action="add" method="post" enctype="multipart/form-data">
				<div class="row mb-3">
					<label for="title" class="col-sm-2 col-form-label">Title</label>
					<div class="col-sm-10">
						<input type="text" name="title" class="form-control" id="title">
					</div>
				</div>
				<div class="row mb-3">
					<label for="writer" class="col-sm-2 col-form-label">Writer</label>
					<div class="col-sm-10">
						<input type="text" name="writer" class="form-control" id="writer">
					</div>
				</div>
				<div class="row mb-3">
					<label for="contents" class="col-sm-2 col-form-label">Contents</label>
					<div class="col-sm-10">
						<textarea name="contents" class="form-control" id="contents"></textarea>
					</div>
				</div>

				<div class="row mb-3">
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
				</div>




				<button type="submit" class="btn btn-primary">Write</button>
			</form>

		</div>


	</div>



</body>
</html>