<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<br /> <br />

		<div class="d-flex">
		
			<a href="/boards/${boards.id}/updateForm" class="btn btn-warning">수정하러가기</a>

			<form>
				<input id="id" type="hidden" value="${boards.id}" />
				<button id="btnDelete" class="btn btn-danger">삭제</button>
			</form>
		</div>

	<br />
	<div>
		<h3>${boards.title}</h3>
	</div>
	<hr />

	<div>${boards.content}</div>

</div>

<script>

	${"#btnDelete"}.click(()=>{
		deleteById();
	});
	
	funciton deleteById(){
			
		let id = $("#id").val();

		$.ajax("/boards/" + id, {
			type: "DELETE",
			dataType: "json",	// 응답 데이터
			async: true

		}).done((res) => {
			if (res.code == 1) {
//				alert("글삭제 완료");
				location.href = "/";	// 메인 페이지로 이동
			} else {
				alert("글삭제에 실패하였습니다.");
			}
		});
	}

</script>

<%@ include file="../layout/footer.jsp"%>

