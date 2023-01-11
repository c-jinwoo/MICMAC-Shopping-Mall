<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mm" uri="/WEB-INF/tld/mm.tld"%>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

	function listBbs(){		
		$("#listForm").submit();
	}
	function editBbs(){
		if(!confirm('수정하시겠습니까?')) return false;
		$("#formtype").val("edit");
		$("#bbsForm").submit();
	}
	function replyBbs(){
		if(!confirm('답변하시겠습니까?')) return false;
		$("#formtype").val("reply");
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
			<c:choose>
				<c:when test="${param.bbs == '41'}">
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
									<td><b><c:out value="${view.TITLE}"/></b></td>
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
									<div class="main_content_btn main_content_edit" onclick="javascript:editBbs();">수정</div>
									<div class="main_content_btn main_content_delete ml50" onclick="javascript:deleteBbs();">삭제</div>
								</c:if>
							</c:if>				
						</div>
						<div class="main_content_footer_inner_2">
							<form name="listForm" id="listForm" action="/front/cs/main.do" method="post">
								<input type="hidden" name="bbs" id="bbs" value="<c:out value='${param.bbs}'/>"/>
								<input type="hidden" name="curPage" id="curPage" value="${param.curPageview}"/>
							</form>
							<div class="main_content_list" onclick="javascript:listBbs();">목록</div>
						</div>	
					</div>
				</c:when>


				<c:when test="${param.bbs == '42'}">
					<c:choose>
						<c:when test="${view.viewRight eq 'Y'}">
							<div class="table_02">
								<form name="bbsForm" id="bbsForm" action="/front/cs/form.do" method="post">
									<input type="hidden" name="bbsno" id="bbsno" value="${view.BBSNO}"/>
									<input type="hidden" name="formtype" id="formtype" value=""/>
									<input type="hidden" name="bbs" id="bbs" value="<c:out value='${param.bbs}'/>"/>
									<input type="hidden" name="bbstitle" id="bbstitle" value="${view.TITLE}"/>
								</form>
								<table>
									<colgroup>
										<col width="70%" />
										<col width="30%"/>
									</colgroup>
									<tbody>						
										<tr>
											<td><b><c:out value="${view.TITLE}"/></b></td>
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
										<c:choose>
											<c:when test="${mm:getUserGradeNo() eq '100' && view.REPYN eq 'N'}">
												<div class="main_content_btn main_content_reply" onclick="javascript:replyBbs();">답변</div>
												<div class="main_content_btn main_content_reply ml50" onclick="javascript:deleteBbs();">삭제</div>	
											</c:when>
											<c:when test="${mm:getUserGradeNo() eq '100' && view.REPYN eq 'Y'}">
												<div class="main_content_btn main_content_reply" onclick="javascript:editBbs();">수정</div>
												<div class="main_content_btn main_content_reply ml50" onclick="javascript:deleteBbs();">삭제</div>	
											</c:when>
											<c:when test="${mm:getUserNO() == view.USERNO && view.USERNO != 1}">
												<div class="main_content_btn main_content_reply" onclick="javascript:editBbs();">수정</div>
												<div class="main_content_btn main_content_reply ml50" onclick="javascript:deleteBbs();">삭제</div>										
											</c:when>
										</c:choose>
									</c:if>
								</div>
								<div class="main_content_footer_inner_2">
									<div class="main_content_list" onclick="javascript:location.href='/front/cs/main.do?bbs='+${param.bbs};">목록</div>
								</div>	
							</div>
						</c:when>
						<c:otherwise>
							<div class="no_right_img">
								<img src="/image/sitemng/error_logo.png"/>								
							</div>
							<div class="no_right_content">
								글 읽기 권한이 없습니다.								
							</div>						
						</c:otherwise>
					</c:choose>
				</c:when>
			</c:choose>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>
</body>
</html>