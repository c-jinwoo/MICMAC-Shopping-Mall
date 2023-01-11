<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mm" uri="/WEB-INF/tld/mm.tld"%>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	function editBbs(){
		if(!confirm('수정하시겠습니까?')) return false;
		$("#formtype").val("edit");
		$("#bbsForm").submit();
	}
	function deleteBbs(){
		if(!confirm('삭제하시겠습니까?')) return false;
		$("#formtype").val("delete");
		$("#bbsForm").attr('action','/front/cs/exec.do').submit();
	}
</script>
<body>
<c:import url="/WEB-INF/jsp/front/common/header.jsp"/>

<div id="content">
	<div class="content_title">
		CUSTOMER SERVICE
	</div>
	<div class="main_content">
		<div class="main_content_inner">
			<div class="table_02">
				<form name="bbsForm" id="bbsForm" action="/front/cs/form.do" method="post">
					<input type="hidden" name="bbsno" id="bbsno" value="${view.BBSNO}"/>
					<input type="hidden" name="formtype" id="formtype" value=""/>
					<input type="hidden" name="bbs" id="bbs" value="<c:out value='${param.bbs}'/>"/>
				</form>
				<table>
					<colgroup>
						<col width="70%" />
						<col width="30%"/>
					</colgroup>
					<tbody>						
						<tr>
							<td><c:out value="${view.TITLE}"/></td>
							<td><span>작성일 <c:out value="${view.WDATE}"/>&nbsp|&nbsp조회수 <c:out value="${view.RCNT}"/></span></td>
						</tr>
						<tr>
							<td colspan="2"><c:out value="${view.CONT}" escapeXml="false"/></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="main_content_footer">
				<div class="main_content_footer_inner_1">
					<c:if test="${mm:isLogin()}">
						<c:if test="${mm:getUserGradeNo() eq '100'}">
							<div class="main_content_btn main_content_reply" onclick="javascript:editBbs();">답변</div>
						</c:if>
					</c:if>				
				</div>
				<div class="main_content_footer_inner_2">
					<div class="main_content_list" onclick="javascript:location.href='/front/cs/main.do?bbs='+${param.bbs};">목록</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>
</body>
</html>