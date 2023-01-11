<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.lang.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<link rel="stylesheet" href="/common/css/bootstrap.min.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	$(document).ready(function(){

		// 아이디 찾기
		$("#IDsubmit").click(function(){

			if(!$("#IDuserName").val()){alert("이름을 입력하세요");return false;}
			if(!$("#IDuserPhonenum").val()){alert("핸드폰 번호를 입력하세요");return false;}

			$.ajax({
				url : "/front/member/findID.do",
				type : "POST",
				data : {"name":$("#IDuserName").val() , "phonenum":$("#IDuserPhonenum").val()},
				success : function(data){
					if(data != ""){
						$(".IDresult").html($("#IDuserName").val() +"님의 아이디는 <span class='red'>"+data+"</span> 입니다.");
					}
					else{
						alert("조회 결과가 없습니다");
					}
				},
				error : function(data){
					alert("조회 결과가 없습니다");
				}
			});			
		});

		// 비밀번호 찾기
		$("#PWsubmit").click(function(){
			if(!$("#PWuserID").val()){alert("아이디를 입력하세요");return false;}
			if(!$("#PWuserName").val()){alert("이름을 입력하세요");return false;}
			if(!$("#PWuserPhonenum").val()){alert("핸드폰 번호를 입력하세요");return false;}

			$.ajax({
				url : "/front/member/findPW.do",
				type : "POST",
				data : {"name":$("#PWuserName").val() , "phonenum":$("#PWuserPhonenum").val(), "id":$("#PWuserID").val()},
				success : function(data){
					if(data == true){
						$(".PWresult").html($("#PWuserName").val() +"님의 비밀번호를 <span class='red'>1234</span> 로 초기화 했습니다.</br>로그인 후 마이페이지에서 수정하세요.</br></br> <a href='/front/login/login.do'> > 로그인 하러가기</a>");
					}
					else{
						alert("조회 결과가 없습니다");
					}
				},
				error : function(data){
					alert("조회 결과가 없습니다");
				}
			});			
		});
	});

</script>
</head>
<body>
<c:import url="/WEB-INF/jsp/front/common/header.jsp"/>
<div id="content">
	<div class="content_title">FIND ID / PW</div>
</div>
<div id="find_content">
	<div class="find_wrapper">
		<div class="find_content">
			<div class="find_content_innerleft">
				<p>아이디 찾기</p>
				</br></br>
				<input id="IDuserName" name="IDuserName" type="text" placeholder="이름" class="input_name">
				<input id="IDuserPhonenum" name="IDuserPhonenum" type="text" placeholder="핸드폰번호 / 예시)010-0000-0000" class="input_phonenum">
				<div id="IDsubmit" class="input_submit input_submit_id">아이디 찾기</div>
				
				<div class="IDresult find_result"></div>
			</div>

			<div class="find_content_innerright">
				<p>비밀번호 찾기</p>
				</br></br>
				<input id="PWuserID" name="PWuserID" type="text" placeholder="아이디" class="input_id">
				<input id="PWuserName" name="PWuserName" type="text" placeholder="이름" class="input_name">
				<input id="PWuserPhonenum" name="PWuserPhonenum" type="text" placeholder="핸드폰번호 / 예시)010-0000-0000" class="input_phonenum">
				<div id="PWsubmit" class="input_submit">비밀번호 찾기</div>

				<div class="PWresult find_result"></div>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>

</body>
</html>