<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<link rel="stylesheet" href="/common/css/bootstrap.min.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/js/bootstrap.min.js"></script>
<script>
	
	// 회원가입 및 아이디 찾기 후 로그인 시 redirect
	$(document).ready(function(){		
		var url ="${header.referer}";		
		url=url.split(".do").toString();

		var urlJoin=url.substring(url.length-12,url.length-1);
		$("#returnURLjoin").val(urlJoin);

		var urlFind=url.substring(url.length-5,url.length-1);
		$("#returnURLfind").val(urlFind);

	});	

	function beforeSubmit(){
		if(!$("#userId").val()){alert("아이디를 입력하세요");return false;}
		if(!$("#userPwd").val()){alert("비밀번호를 입력하세요");return false;}
	}

</script>
</head>
<body>
<c:import url="/WEB-INF/jsp/front/common/header.jsp"/>
<div id="content">
	<div class="content_title">LOGIN</div>
</div>
<div id="login_content">
	<div class="login_wrapper">
		<div class="login_content">
			<div class="login_content_innerleft">
				<p>회원로그인</p>
				</br></br>
				<form id="loginForm" name="loginForm" action="/front/login/loginExec.do" method="post" onsubmit="return beforeSubmit();">
					<input id="userId" name="userId" type="text" placeholder="아이디 입력" class="input_id">
					<input id="userPwd" name="userPwd" type="password" placeholder="비밀번호 입력" class="input_pw">
					<input id="returnURL" name="returnURL" type="hidden" value="${header.referer}"/>
					<input id="returnURLjoin" name="returnURLjoin" type="hidden" value=""/>
					<input id="returnURLfind" name="returnURLfind" type="hidden" value=""/>
					<input id="submit" type="submit" value="LOGIN" class="input_submit"/>
				</form>
			</div>

			<div class="login_content_innerright">
				<div class="login_content_innerright_top">
					<div class="login_joinment">
						미끄마끄 회원이 아니신가요?</br>
						회원가입을 하시면 보다 원활한 서비스를 이용할 수 있습니다.						
					</div>
					<div class="login_joinform" onclick="javascript:location.href='/front/member/join.do';">회원가입</div>
				</div>
				<div class="login_content_innerright_bottom">
					<div class="login_findment">
						아이디/비밀번호가 기억이 안 나시나요?</br>
						안전하고 빠르게 찾아드립니다.
					</div>
					<div class="login_findform" onclick="javascript:location.href='/front/member/find.do';">아이디/비밀번호 찾기</div>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>

</body>
</html>