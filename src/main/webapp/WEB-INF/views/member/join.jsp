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

 <div class="col-md-7 col-lg-8">
        
        <form class="needs-validation" novalidate action="./join" method="post" enctype="multipart/form-data">
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="id" class="form-label">ID</label>              
              <input type="text" name="id" class="form-control" id="id" placeholder="" value="" required>              
            </div>         

            <div class="col-12">
              <label for="pw" class="form-label">PW</label>
              <div class="col-sm-6">               
                <input type="text" name="pw" class="form-control" id="pw" placeholder="pw" required>
              <div class="invalid-feedback">
                  Your pw is required.
                </div>
              </div>
            </div>
            
             <div class="col-12">
              <label for="pw" class="form-label">NAME</label>
              <div class="col-sm-6">                
                <input type="text" name="name" class="form-control" id="name" placeholder="name" required>              
              </div>
            </div>

            <div class="col-12">
              <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
              <div class="col-sm-6">   
              <input type="email" name="email" class="form-control" id="email" placeholder="you@example.com">
              </div>
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="col-12">
              <label for="phone" class="form-label">Phone</label>
              <div class="col-sm-6">   
              <input type="text" name="phone" class="form-control" id="address" placeholder="000-0000-0000" required>       
              </div>      
            </div>         
                                  
         
         <button class="w-50 btn btn-primary btn-lg" type="submit" id="btn">회원가입</button>
         
		</div>
	</form>
		<div class="col-12">
			<div class="form-check">
  				<input class="form-check-input" type="checkbox" value="" id="all">
  				<label class="form-check-label" for="all"><!-- 라벨에 있는 for는 id랑 맞추는게 기본 -->
   					 checkbox-All
 				 </label>
			</div>
			<div class="form-check">
 				 <input class="form-check-input ch" type="checkbox" value="" id="checke1" >
  				<label class="form-check-label" for="checke1">
   				 check2
  			</label>
			</div>
		</div>
		
			<div class="col-12">
			<div class="form-check">
  				<input class="form-check-input ch" type="checkbox" value="" id="checke2">
  				<label class="form-check-label" for="checke2">
   					 check3
 				 </label>
			</div>
			<div class="form-check">
 				 <input class="form-check-input ch" type="checkbox" value="" id="checke3">
  				<label class="form-check-label" for="checke3">
   				check4
  			</label>
			</div>
		</div>
	
   </div>  
   <c:import url="../temp/header_script.jsp"></c:import>
	<script type="text/javascript">
	
		$("#all").click(function(){
			$(".ch").prop("checked",$("#all").prop("checked"));				
		});
		$(".ch").on("click",function(){
			let chekc = true;
			
			$(".ch").each(function(idx, item) {
				if(!$(item).prop("checked")){
					check=false;
				}
			});
			$("#all").prop("checked", check);
		})
	</script>
          

</body>
</html>