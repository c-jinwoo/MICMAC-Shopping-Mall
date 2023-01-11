<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.lang.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>

<html lang="ko">
<head>
<link rel="stylesheet" href="/common/css/bootstrap.min.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
</script>
</head>
<body>
<c:import url="/WEB-INF/jsp/front/common/header.jsp"/>

<div id="content">
	<div class="content_title">WELCOME</div>
</div>
<div id="join_sc_content">
	<div class="join_sc_content_inner">
		<div class="join_sc_ment">
			<div class="join_sc_left"></div>
			<div class="join_sc_right">
				<div class="join_sc_title">
					<b>미끄마끄 회원가입을 진심으로 환영합니다.</b>
				</div>
				<div class="join_sc_body">
					<b><c:out value="${name}"/></b>&nbsp&nbsp회원님의 가입이 완료되었습니다.
					</br></br></br></br>
					아이디&nbsp&nbsp&nbsp:&nbsp&nbsp&nbsp<b><c:out value="${id}"/></b>
				</div>		
			</div>
		</div>
		<div class="join_sc_navi">
			<div class="join_sc_navi_inner">
				<div class="join_sc_login join_sc_finish" onclick="javascript=location.href='/front/login/login.do';">로그인</div>
				<div class="join_sc_main join_sc_finish" onclick="javascript=location.href='/front/main/main.do';">메인으로</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>
</body>
</html>