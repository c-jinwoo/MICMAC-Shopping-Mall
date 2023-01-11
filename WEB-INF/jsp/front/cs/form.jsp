<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mm" uri="/WEB-INF/tld/mm.tld"%>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src='/smarteditor/js/HuskyEZCreator.js' charset="utf-8"></script>
<script>
	var oEditors = [];
	$(document).ready(function(){

		// 수정
		if("${param.formtype}" == "edit"){
			if("${view.TITLE}" !=  null){
				$("#bbsTitle").val("${view.TITLE}");
			}
			if("${view.TOPYN}" == "Y"){
				$("#bbsTopynSel").prop("checked", true);
			}
			if("${view.SECYN}" == "Y"){
				$("#bbsSecynSel").prop("checked", true);
			}
		}
		// 답변
		else if("${param.formtype}" == "reply"){
			if("${view.SECYN}" == "Y"){
				$('input[name=bbsSecyn]').val('Y');
			}
			$("#bbsTitle").val("[답변] - ${param.bbstitle}");
			$("#bbsRepyn").val("Y");
			$("#bbsRepno").val(${param.bbsno});
		}

		nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "bbsCont", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/smarteditor/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true
          },
			fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			  if(${param.formtype == "reply"}){
	              oEditors.getById["bbsCont"].exec("PASTE_HTML", ["[질문내용]</br>${view.CONT}</br></br>[답변]</br>"]);
			  }
			  else if(${param.formtype == "edit"}){
				  oEditors.getById["bbsCont"].exec("PASTE_HTML", ["${view.CONT}"]);
			  }
          },
          fCreator: "createSEditor2"
		});	  
	});

	function bbsExecApprove(){

		// 공지사항
		if(${param.bbs =='41'}){
			if ($('input[name=bbsTopynSel]').is(":checked")) {
				$('input[name=bbsTopyn]').val("Y");
			}
		}

		// QnA
		else if(${param.bbs == '42'}){
			if ($('input[name=bbsSecynSel]').is(":checked")) {
				$('input[name=bbsSecyn]').val("Y");
			}
		}

		// 공통
		if("${param.formtype}" == "edit"){
			$("#bbsno").val("${param.bbsno}");
		}

		if(!confirm('작성하시겠습니까?')) return false;
		oEditors.getById["bbsCont"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#bbsForm").submit();
	}

	function bbsExecCancel(){
		if(!confirm('작성을 취소하시겠습니까? 작성하신 글은 저장되지 않습니다.')) return false;
		history.back();
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
						<table>
							<colgroup>
								<col width="20%" />
								<col width="80%"/>
							</colgroup>
							<form id="bbsForm" name="bbsForm" action="/front/cs/exec.do" method="post">
								<input id="bbs" name="bbs" type="hidden" value="${param.bbs}"/>
								<input id="bbsno" name="bbsno" type="hidden" value=""/>
								<input id="bbsTopyn" name="bbsTopyn" type="hidden" value="N"/>
								<input id="formtype" name="formtype" type="hidden" value="${param.formtype}"/>
								<input id="bbsSecyn" name="bbsSecyn" type="hidden" value="N"/>
								<input id="bbsRepyn" name="bbsRepyn" type="hidden" value="N"/>
								<input id="bbsRepno" name="bbsRepno" type="hidden" value=""/>
								<tbody>						
									<tr>
										<td>제목</td>
										<td>
											<input id="bbsTitle" name="bbsTitle" type="text" style="width:90%;height:30px;padding-left:10px;"/>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<textarea id="bbsCont" name="bbsCont" type="text" style="width:100%;height:500px;"></textarea>								
										</td>
									</tr>
									<tr>
										<td>상단 공지</td>
										<td>
											<input id="bbsTopynSel" name="bbsTopynSel" type="checkbox" style="width:17px;height:17px;" value=""/>
										</td>
									</tr>
								</tbody>
							</form>
						</table>
					</div>
				</c:when>
				<c:when test="${param.bbs == '42'}">
					<div class="table_02">
						<table>
							<colgroup>
								<col width="20%" />
								<col width="80%"/>
							</colgroup>
							<form id="bbsForm" name="bbsForm" action="/front/cs/exec.do" method="post">
								<input id="bbs" name="bbs" type="hidden" value="${param.bbs}"/>
								<input id="bbsno" name="bbsno" type="hidden" value=""/>
								<input id="bbsTopyn" name="bbsTopyn" type="hidden" value="N"/>
								<input id="formtype" name="formtype" type="hidden" value="${param.formtype}"/>
								<input id="bbsSecyn" name="bbsSecyn" type="hidden" value="N"/>
								<input id="bbsRepyn" name="bbsRepyn" type="hidden" value="N"/>
								<input id="bbsRepno" name="bbsRepno" type="hidden" value=""/>
								<tbody>						
									<tr>
										<td>제목</td>
										<td>

											<input id="bbsTitle" name="bbsTitle" type="text" style="width:90%;height:30px;padding-left:10px;"/>
											
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<textarea id="bbsCont" name="bbsCont" type="text" style="width:100%;height:500px;"></textarea>								
										</td>
									</tr>
									<c:if test="${param.formtype ne 'reply'}">
										<tr>
											<td>비공개</td>
											<td>
												<input id="bbsSecynSel" name="bbsSecynSel" type="checkbox" style="width:20px;height:20px;" value=""/>
											</td>
										</tr>
									</c:if>
								</tbody>
							</form>
						</table>
					</div>
				</c:when>
			</c:choose>

			<div class="main_content_footer">
				<div class="main_content_footer_inner_form">
					<div class="main_content_btn main_content_approve" onclick="javascript:bbsExecApprove();">등록</div>
					<div class="main_content_btn main_content_cancel ml50" onclick="javascript:bbsExecCancel();">취소</div>
				</div>
			</div>


		</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>
</body>
</html>