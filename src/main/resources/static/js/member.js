$("#btnDelete").click(function(){
	
 $.ajax({
	type:"DELETE",
	url:"/delete/"+$("#id").text()
 })
 .done(function(resp){
	alert("회원정보 삭제 성공");
	location.href="/list";
 })
 .fail(function(){
	alert("회원정보 삭제 실패");
 })
})

$("#btnModify").click(function(){
	let dataParam={
		"email" : $("#email").val(),
		"addr" : $("#addr").val(),
		"memo" : $("#memo").val(),
		"id" : $("#id").val()
	}
	
	$.ajax({
		type:"PUT",
		url:"/update/",
		data:JSON.stringify(dataParam),
		contentType:"application/json;charset=utf-8"
	})
	.done(function(){
		alert("성공")
		location.href="/list";
	})
	.fail(function(){
		alert("수정실패")
	})
})