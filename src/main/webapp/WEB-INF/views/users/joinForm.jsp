<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form action="/join" method="post">
		<div class="mb-3 mt-3">
			<input id="inputUsername" type="text" class="form-control" placeholder="Enter username" name="username">
			<button id="btnUsernameCheck" class="btn btn-warning" type="button">유저네임 중복체크</button>
		</div>
		<div class="mb-3">
			<input type="password" class="form-control"
				placeholder="Enter password" name="password">
		</div>
		<div class="mb-3">
			<input type="email" class="form-control" placeholder="Enter email" name="email">
		</div>
		<button type="submit" class="btn btn-primary">회원가입</button>
	</form>
</div>

<script>
	$("#btnUsernameCheck").click(()=>{
		// 0. 통신 오브젝트 생성 (Get 요청은 body가 없다.)

		
		// 1. 사용자가 적은 username 값을 가져오기
		let body = {
			username: $("#inputUsername").val();
		};
		
		// 2. Ajax 통신
		
	});
</script>
<%@ include file="../layout/footer.jsp"%>

