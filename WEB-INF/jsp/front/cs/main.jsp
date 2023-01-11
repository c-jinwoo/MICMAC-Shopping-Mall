<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mm" uri="/WEB-INF/tld/mm.tld"%>
<html lang="ko">
<link href="/common/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>

	function goList(page) {
		$("#curPage").val(page);
		$("#listForm").submit();
	}
 	function formBbs(){
		$("#bbsForm").attr('action', '/front/cs/form.do').submit();
	}
	function viewBbs(bbsno){
		$("#curPageview").val(${param.curPage});
		$("#bbsno").val(bbsno);
		$("#bbsForm").submit();
	}

</script>
<body>
<c:import url="/WEB-INF/jsp/front/common/header.jsp"/>

<div id="content">
	<div class="content_title">
		CUSTOMER SERVICE
	</div>
	<div class="main_content">
		<form id="listForm" action="/front/cs/main.do" method="post">
			<input type="hidden" id="bbs" name="bbs" value="${param.bbs}" />
			<input type="hidden" id="curPage" name="curPage" value=""/>
		</form>
		<c:choose>
		<c:when test="${param.bbs == '41'}">
			<div class="main_content_inner">
				<div class="table_01">
					<table>
						<colgroup>
							<col width="10%"/>
							<col width="60%"/>
							<col width="20%"/>
							<col width="10%"/>
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>SUBJECT</th>
								<th>DATE</th>
								<th>VIEW</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:choose>
									<c:when test="${not empty noticelist}">
										<c:forEach var="noticetoplist" items="${noticetoplist}">
											<tr>
												<td><div class="notice">공지</div></td>
												<td><b><a onclick="javascript:viewBbs('${noticetoplist.BBSNO}');">${noticetoplist.TITLE}</a></b>
													<c:if test="${noticetoplist.RCNT > 30 }">
														<span class="hit">hit!</span>
													</c:if>												
												</td>
												<td>${noticetoplist.WDATE}</td>
												<td>${noticetoplist.RCNT}</td>
											</tr>
										</c:forEach>
										<c:forEach var="noticelist" items="${noticelist}" varStatus="status">
											<tr>
												<td>${no - status.index}</td>
												<td><a onclick="javascript:viewBbs('${noticelist.BBSNO}');">${noticelist.TITLE}</a>
													<c:if test="${noticelist.RCNT > 30 }">
														<span class="hit">hit!</span>
													</c:if>													
												</td>
												<td>${noticelist.WDATE}</td>
												<td>${noticelist.RCNT}</td>												
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><td colspan="4">등록된 글이 없습니다.</td></tr>
									</c:otherwise>
								</c:choose>
							</tr>
							<form name="bbsForm" id="bbsForm" action="/front/cs/view.do" method="post">
								<input type="hidden" name="bbsno" id="bbsno" value=""/>
								<input type="hidden" name="bbs" id="bbs" value="<c:out value='${param.bbs}'/>"/>
								<input type="hidden" name="formtype" id="formtype" value="write"/>
								<input type="hidden" id="curPageview" name="curPageview" value=""/>
							</form>							
						</tbody>
					</table>
				</div>
				
			</div>
		<c:if test="${mm:getUserGradeNo() eq '100'}">
			<div class="main_content_footer">
				<div class="main_content_register" onclick="javascript:formBbs();">글쓰기</div>
			</div>
		</c:if>		
		</c:when>


		<c:when test="${param.bbs == '42'}">
			<div class="main_content_inner">
				<div class="table_01">
					<table>
						<colgroup>
							<col width="10%"/>
							<col width="60%"/>
							<col width="20%"/>
							<col width="10%"/>
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>SUBJECT</th>
								<th>NAME</th>
								<th>VIEW</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty qnalist}">
									<c:forEach var="qnalist" items="${qnalist}" varStatus="status">
										<c:if test="${qnalist.REPYN == 'N'}">
											<tr>
												<td>${no - status.index}</td>
												<td><a onclick="javascript:viewBbs('${qnalist.BBSNO}');">${qnalist.TITLE}</a>
													<c:if test="${qnalist.RCNT > 30 }">
															<span class="hit">hit!</span>
													</c:if>	
													<c:if test="${qnalist.SECYN eq 'Y'}">
														<span class="board_sec"><img src="/image/sitemng/sec_icon.png"/></span>
													</c:if>											
												</td>
												<td>${qnalist.WRITER}</td>
												<td>${qnalist.RCNT}</td>
											</tr>
										</c:if>
										<c:forEach var="qnalistrepl" items="${qnalistrepl}">
											<c:if test="${qnalist.BBSNO == qnalistrepl.REPNO}">
												<tr>
													<td></td>
													<td><a onclick="javascript:viewBbs('${qnalistrepl.BBSNO}');">└ ${qnalistrepl.TITLE}</a>
														<c:if test="${qnalistrepl.RCNT > 30 }">
															<span class="hit">hit!</span>
														</c:if>	
														<c:if test="${qnalistrepl.SECYN eq 'Y'}">
															<span class="board_sec"><img src="/image/sitemng/sec_icon.png"/></span>
														</c:if>											
													</td>
													<td>${qnalistrepl.WRITER}</td>
													<td>${qnalistrepl.RCNT}</td>
												</tr>
											</c:if>
										</c:forEach>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr><td colspan="4">등록된 글이 없습니다.</td></tr>
								</c:otherwise>
							</c:choose>
							<form name="bbsForm" id="bbsForm" action="/front/cs/view.do" method="post">
								<input type="hidden" name="bbsno" id="bbsno" value=""/>
								<input type="hidden" name="bbs" id="bbs" value="<c:out value='${param.bbs}'/>"/>
								<input type="hidden" name="formtype" id="formtype" value="write"/>
							</form>						
						</tbody>
					</table>
				</div> 		
			</div>
			<div class="main_content_footer">
				<div class="main_content_register" onclick="javascript:formBbs();">글쓰기</div>
			</div>
		</c:when>	
		</c:choose>	
		
		<div class="paging mt50">
			<ul class="paging_inner">
				<c:if test="${prevLink>0}">
					<li class="paging_no" onclick="javascript:goList('${prevLink}');">
						<
					</li>
				</c:if>
				<c:forEach var="i" items="${pageLinks}" varStatus="status">
					<c:choose>
						<c:when test="${curPage == i}">
							<li class="paging_no active">${i}</li>
						</c:when>
						<c:otherwise>
							<li class="paging_no" onclick="javascript:goList('${i}');">${i}</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${nextLink>0}">
					<li class="paging_no" onclick="javascript:goList('${nextLink}');">
						>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>
</body>
</html>