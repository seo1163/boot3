/**
 * 
 */
 
 	function summernoteInit(selector, code){
 	//summernote
$("#"+selector).summernote({
	height:400,
	placeholder:'내용을 입력하세요',
	callbacks: {
		onImageUpload:function(files){
			//files upload한 이미지 파일객체
			let formData = new FormData();
			formData.append("file", files[0]);
			// /board/summerFileUpload
 			$.ajax({
				type:"POST",
				url:"./summerFileUpload",
				data:formData,
				contentType:false,
				processData:false,
				success:function(data){
					$(".note-image-input").val('')
					formData.delete(formData.get("file").name)
					console.log(formData.get("file").name);
					$("#"+selector).summernote('editor.insertImage', data.trim());
				}
				
			}); 
			},//onImageUpload 끝
			onMediaDelete:function(files){
				let fileName = $(files[0]).attr("src");
				console.log(fileName);
				$.ajax({
					type:"GET",
					url:"./summerFileDelete",
					data:{
						fileName:fileName
					},
					success:function(data){
						console.log(data);
					}
				});
			}//onMediaDelete 끝			
		}
	});
	
	$("#"+selector).summernote('code', code);
}
 
 
	
	
	