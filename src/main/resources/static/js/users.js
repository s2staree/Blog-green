
/* joinForm.jsp 링크 */

let isUsernameSameCheck = false;

// 회원가입
$("#btnJoin").click(() => {
	
	join();

});

// 유저네임 중복체크
$("#btnUsernameSameCheck").click(() => {
	checkUsername();
});




/* loginForm.jsp 링크 */

$("#btnLogin").click(() => {
	login();
});




/* updateForm.jsp 링크 */

$("#btnDelete").click(() => {
	resign();
});

$("#btnUpdate").click(() => {
	update();
});




function join(){
	
		if (isUsernameSameCheck == false) {
		alert("유저네임 중복체크를 진행해 주세요.");
		return;
	}


	// 0. 통신 오브젝트 생성
	let data = {
		username: $("#username").val(),
		password: $("#password").val(),
		email: $("#email").val()
	};
	$.ajax("/join", {
		type: "POST",
		dataType: "json",
		data: JSON.stringify(data),
		headers: {
			"Content-Type": "application/json"
		}
	}).done((res) => {
		if (res.code == 1) {
			//				console.log(res);
			location.href = "/loginForm";
		}
	});
}


function checkUsername(){
	
	// 0. 통신 오브젝트 생성 (Get 요청은 body가 없다.)

	// 1. 사용자가 적은 username 값을 가져오기
	let username = $("#username").val();

	// 2. Ajax 통신
	$.ajax(`/users/usernameSameCheck?username=${username}`, {
		type: "GET",
		dataType: "json",	// 서버야~ 나는 json데이터를 기대해!
		async: true,	// 무적권 비동기!!! false 쓰지마!!!!
	}).done((res) => {

		if (res.code == 1) {
			// alert("통신 성공");
			if (res.data == false) {
				alert("아이디가 중복되지 않았습니다.")
				isUsernameSameCheck = true;
			} else {
				alert("아이디가 중복되었습니다. 다른 아이디를 사용해 주세요.")
				isUsernameSameCheck = false;
				$("#Username").val("");
			}
		}
	});
}


function login(){
	
	let data = {
		username: $("#username").val(),
		password: $("#password").val(),
	};

	$.ajax("/login", {
		type: "POST",
		dataType: "json",	// 응답 데이터
		data: JSON.stringify(data),	// http body에 들고갈 요청 데이터
		headers: {	// http header에 들고갈 요청 데이터
			"Content-Type": "application/json; charset=utf-8"
		}
	}).done((res) => {
		if (res.code == 1) {
			location.href = "/";
		} else {
			alert("로그인 실패, 아이디 패스워드를 확인해 주세요");
			//				history.back();
		}
	});

}


function resign(){
	
	let id = $("#id").val();

	$.ajax("/users/" + id, {
		type: "DELETE",
		dataType: "json"	// 응답 데이터

	}).done((res) => {
		if (res.code == 1) {
			alert("회원탈퇴 완료");
			location.href = "/";	// 메인 페이지로 이동
		} else {
			alert("회원탈퇴에 실패하였습니다.");
		}
	});
}


function update(){
	
	let data = {
		password: $("#password").val(),
		email: $("#email").val(),
	};

	let id = $("#id").val();

	$.ajax("/users/" + id, {
		type: "PUT",
		dataType: "json",	// 응답 데이터
		data: JSON.stringify(data),	// http body에 들고갈 요청 데이터
		headers: {	// http header에 들고갈 요청 데이터
			"Content-Type": "application/json; charset=utf-8"
		}
	}).done((res) => {
		if (res.code == 1) {
			alert("회원수정 완료");
			location.reload();	// f5(새로고침)와 같은 기능
		} else {
			alert("업데이트에 실패하였습니다.");
		}
	});
}