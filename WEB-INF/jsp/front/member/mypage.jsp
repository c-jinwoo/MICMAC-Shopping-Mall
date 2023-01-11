<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.lang.*" %>
<%@ page import="com.micmac.session.UserSessionManager" %>
<%@ taglib prefix="mm" uri="/WEB-INF/tld/mm.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<link rel="stylesheet" href="/common/css/bootstrap.min.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/common/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	$(document).ready(function(){
		/*if(<%= !UserSessionManager.isLogin() %>) {
			alert("로그인 해주세요");
			location.href="/front/login/login.do";
		}*/			
	});
	function resign(userId){
		if(!confirm('미끄마끄를 탈퇴하시겠습니까? 소유한 포인트는 모두 소진됩니다.')) return false;
		
		alert("탈퇴가 완료되었습니다");
		location.href="/front/member/resign.do?userId="+userId;
	}
</script>
</head>
<body>
<c:import url="/WEB-INF/jsp/front/common/header.jsp"/>
<div id="content">
	<div class="content_title">MY PAGE</div>
</div>
<div id="mypage_content">
	<div class="mypage_content_inner">

		<!--개인정보 영역-->
		<div class="mypage_personalinfo">
			<div class="personalinfo_title">개인 정보</div>
			<div class="table_06">
				<table>
					<colgroup>
						<col width="20%"/>					
						<col width="30%"/>					
						<col width="20%"/>					
						<col width="30%"/>
					</colgroup>
					<tbody>
						<tr>
							<td>아이디</td>
							<td><c:out value="${mm:getUserId()}"/></td>
							<td>핸드폰 번호</td>
							<td><c:out value="${mm:getPhoneNum()}"/></td>
							
						</tr>
						<tr>
							<td>이름</td>
							<td><c:out value="${mm:getUserNm()}"/></td>
							<td>성별</td>
							<td>
								<c:choose>
									<c:when test="${mm:getSex() == 'M'}">남자</c:when>
									<c:otherwise>여자</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>회원등급</td>
							<td>
								<c:choose>
									<c:when test="${mm:getUserGradeNo() == '1'}">일반회원</c:when>
									<c:when test="${mm:getUserGradeNo() == '50'}">VIP</c:when>
									<c:when test="${mm:getUserGradeNo() == '100'}">관리자</c:when>
								</c:choose>						
							</td>
							<td>포인트</td>
							<td><c:out value="${mm:getPoints()}"/>&nbsp점</td>
						</tr>
						<tr>
							<td>주소</td>
							<td colspan="3"><c:out value="${mm:getAddr1()}"/>&nbsp<c:out value="${mm:getAddr2()}"/></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="personalinfo_footer">
				<div class="personalinfo_footer_inner">
					<div class="personalinfo_edit personalinfo_btn" onclick="location.href='/front/member/editInfo.do';">수정하기</div>
					<div class="personalinfo_exit personalinfo_btn ml50" onclick="javascript:resign('${mm:getUserId()}');">탈퇴하기</div>
				</div>
			</div>
		</div>

		<!--주문 영역-->
		<div class="mypage_order mt50">
			<div class="order_title">주문 내역</div>
			<div class="table_07">
				<table>	
					<colgroup>
						<col width="15%"/>
						<col width="50%"/>
						<col width="20%"/>
						<col width="15%"/>
					</colgroup>
					<thead>
						<tr>
							<td>주문번호</td>
							<td>주문내용</td>
							<td>주문일자</td>
							<td>총 금액</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>옷 하나 샘플</td>
							<td>2018-10-23</td>
							<td>10000원</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>







	</div>
</div>
<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>

</body>
</html>