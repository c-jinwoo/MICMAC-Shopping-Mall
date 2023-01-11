<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Error</title>
<link rel="stylesheet" type="text/css" href="/common/css/common.css" />
</head>
<body>
<div id="error">
	<div class="error_logo"></div>
	<div class="error_content">
		<div class="error_title">죄송합니다. 현재 서버 점검 중입니다.</div>
		<div class="error_content_inner">
			<p>존재하지 않는 주소를 입력하셨거나,</br>요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.</br></br>궁금한 점이 있으시면 언제든 고객센터를 통해 문의해 주시기 바랍니다.</br></br>감사합니다.
		</div>
	</div>
	<div class="error_nav">
		<div class="error_btn">
			<div class="btn pink btn_main" onclick="location.href='/front/main/main.do';">메인으로</div>
			<div class="btn gray btn_return" onclick="javascript:history.back();">이전페이지</div>
		</div>
	</div>
</div>
</body>
</html>