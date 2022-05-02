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
 
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
	<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="container mt-4">
	<div class="row mt-4">
		<div class="alert alert-light" role="alert">
	  		<h4 style="text-transform: uppercase;">${board} UPDATE</h4>
		</div>
	</div>
	
	<div class="row" id="list" >
		<!-- 상품 리스트 ajax, name, price, count -->		
	</div>
	
	<div class="row mt-4">
		<form action="update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="productNum" value="${vo.productNum}">
		  <div class="row mb-3">
		    <label for="productName" class="col-sm-2 col-form-label">제품명</label>
		    <div class="col-sm-10">
		      <input type="text" name="productName" class="form-control" id="productName">
		    </div>
		  </div>
		   <div class="row mb-3">
		    <label for="id" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-sm-10">
		      <input type="text" name="id" value="${member.id}" readonly class="form-control" id="id">
		    </div>
		  </div>	
		  <div class="row mb-3">
		    <label for="productPrice" class="col-sm-2 col-form-label">Price</label>
		    <div class="col-sm-10">
		      <input type="text" value="${vo.productPrice}" name="productPrice" class="form-control" id="productPrice">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="productCount" class="col-sm-2 col-form-label">수량</label>
		    <div class="col-sm-10">
		      <input type="text" value="${vo.productCount}" name="productCount" class="form-control" id="productCount">
		    </div>
		  </div>		  
		  
		 <div class="row mb-3">
		    <label for="productDeatil" class="col-sm-2 col-form-label">상세설명</label>
		    <div class="col-sm-10">
		      <textarea name="productDetail" class="form-control" id="productDetail"></textarea>
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <div class="form-check">
 				<input class="form-check-input sale" type="radio" value="1" ${vo.sale eq 1?'chekced':''} name="sale" id="flexRadioDefault1">
  				<label class="form-check-label" for="flexRadioDefault1">
   					판매
  				</label>
			</div>
			<div class="form-check">
  				<input class="form-check-input sale" type="radio" value="0" name="sale" id="flexRadioDefault2" ${vo.sale eq 0? 'chekced':''}>
  				<label class="form-check-label" for="flexRadioDefault2">
   					판매중지
  				</label>
			</div>
		  </div>	
		
		<button id="fileAdd" type="button" class="btn btn-danger d-block my-4">FileADD</button>  
		  <div>
		  	<c:forEach items="${vo.productFilesVOs}" var="fileVO">
		  		<h4>${fileVO.oriName}<button class="del" type="button" data-num="${fileVO.fileNum}">DELETE</button></h4>
		  	</c:forEach>
		  </div>
		  
		<div id="fileResult">
			
		</div>
		 
		  <button type="submit" id="add" class="btn btn-primary">Update</button>
		</form>
	
	</div>
	
	
</div>	

<script type="text/javascript" src="../resources/js/fileAdd.js"></script>
<script type="text/javascript" src="../js/summernote.js"></script>
<script type="text/javascript">
summernoteInit("productDetail","{vo.productDetail}");
fileAddInit(${vo.productFilesVOs.size()});
fileDeleteInit();
</script>
</body>
</html>