<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
<!-- header-->
<c:import url="./temp/header.jsp"></c:import>

	<div class="caotainer mt-2">
		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://jyptfstorage01.blob.core.windows.net/mainbanner/LOCO-WEB-980-440.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
				<div class="carousel-item">
					<img
						src="https://jyptfstorage01.blob.core.windows.net/mainbanner/pc.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
				<div class="carousel-item">
					<img
						src="https://jyptfstorage01.blob.core.windows.net/mainbanner/TW_TheFeel_JYP%20banner_980x440.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

<div class="container">
	<input type="text" id="v1">
	
	<input type="checkbox" class="num" name="num" value="a">
	<input type="checkbox" class="num" name="num" value="b">
	<input type="checkbox" class="num" name="num" value="c">
	<input type="checkbox" class="num" name="num" value="d">
	
	<button id="btn1">GET</button>
	<button id="btn2">POST</button>
	<button id="btn3">Ajax</button>
</div>
	
	<c:import url="./temp/header_script.jsp"></c:import>
	<script type="text/javascript">
	$('#btn1').click(function(){
		let v = $('#v1').val()
		console.log(v);
		$.get("./getTest?msg="+v,function(data){
			console.log(data.trim());
		});
	});
	
	//btn2를 click하면 v1의 입력된 값을 /postTest 요청 파라미터로 전송
	//응답으로 getResult.jsp로 받아서 오면됨
	
	$('#btn2').click(function(){
		let v = $('#v1').val()
		console.log(v);
		$.post("./postTest",{msg:v},function(result){
			console.log(result.trim());
		});
	});
	
	$('#btn3').click(function(){
		let ar = [1,2,3];
		let nums=[];
		
		$(".num").each(function(idx,item){
			if($(item).prop("checked")){
				console.log($(item).val());
				nums.push($(item).val());
			}
		});
		let v = $("#v1").val();
		$.ajax({
			type :"POST",
		 	url	   : "./arryTest",
		 	traditional:true,
		 	data:{
		 		msg:v,
		 		numbers : ar,
		 		nums:nums
		 	},
		 	success:function(d){
		 		console.log(d.trim());
		 	},
		 	error:function(){
		 		alert('에러가 발생했습니다');
		 	}
		})
	})
	

	</script>
	
</body>
</html>
