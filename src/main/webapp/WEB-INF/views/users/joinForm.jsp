<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
		<div class="mb-3 mt-3">
			<input id="username" type="text" class="form-control" placeholder="Enter username">
			<button id="btnUsernameSameCheck" class="btn btn-warning" type="button">유저네임 중복체크</button>
		</div>
		<div class="mb-3">
			<input id="password" type="password" class="form-control"
				placeholder="Enter password">
		</div>
		<div class="mb-3">
			<input id="email" type="email" class="form-control" placeholder="Enter email">
		</div>
		<button id="btnJoin" type="button" class="btn btn-primary">회원가입</button>
	</form>
</div>

<script>

	let isUsernameSameCheck = false;
	
	// 회원가입
	$("#btnJoin").click(()=>{
		if(isUsernameSameCheck == false){
			alert("유저네임 중복체크를 진행해 주세요.");
			return;
		}
		
		
		// 0. 통신 오브젝트 생성
		let data = {
				username: $("#username").val(),
				password: $("#password").val(),
				email: $("#email").val()
		};
		$.ajax("/join",{
			type: "POST",
			dataType: "json",
			data: JSON.stringify(data),
			headers : {
				"Content-Type" : "application/json"
			}
		}).done((res)=>{
			if(res.code == 1){
//				console.log(res);
				location.href = "/loginForm";
			}
		});

	});
	
	// 유저네임 중복체크
	$("#btnUsernameSameCheck").click(()=>{
		// 0. 통신 오브젝트 생성 (Get 요청은 body가 없다.)

		
		// 1. 사용자가 적은 username 값을 가져오기
		let username = $("#username").val();
		
		// 2. Ajax 통신
		$.ajax("/users/usernameSameCheck?username=" + username,{
			type:"GET",
			dataType:"json",	// 서버야~ 나는 json데이터를 기대해!
			async:true,	// 무적권 비동기!!! false 쓰지마!!!!
		}).done((res)=>{
			console.log(res);		
			if(res.code == 1){
//				alert("통신 성공");
				if(res.data == false){
					alert("아이디가 중복되지 않았습니다.")
					isUsernameSameCheck = true;
				}else{
					alert("아이디가 중복되었습니다. 다른 아이디를 사용해 주세요.")
					isUsernameSameCheck = false;
					$("#Username").val("");
				}
			}
		});
	});
	

</script>
<%@ include file="../layout/footer.jsp"%>

