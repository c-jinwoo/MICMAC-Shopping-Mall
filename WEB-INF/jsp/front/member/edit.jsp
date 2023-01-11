<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.lang.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mm" uri="/WEB-INF/tld/mm.tld"%>
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
	$(document).ready(function(){	
	
		$(".edit_check_confirm").click(function(){
			var checkPW = $("#edit_check_pw").val();

			if(!$("#edit_check_pw").val()){
				alert("비밀번호를 입력해주세요");return false;
			}

			$.ajax({
				url : "/front/member/editCheck.do",
				type : "POST",
				data : {"check_id":"${mm:getUserId()}", "check_pwd":$("#edit_check_pw").val()},
				success : function(data){
					if(data){
						alert("본인 확인 되었습니다");	
						$(".edit_content_inner1").addClass("deactive");
						$(".edit_content_inner2").addClass("active");
					}
					else{
						alert("비밀번호가 일치하지 않습니다");
						$("#edit_check_pw").val("");$("#edit_check_pw").focus();
						return false;						
					}
				},
				error : function(){
					alert("존재하지 않는 계정입니다");
				}
			});	
		});

		/* 핸드폰번호 초기세팅 */
		var phonenum= "${mm:getPhoneNum()}";
		phonenum=phonenum.split("-");
		var phonenum1=phonenum[0];
		var phonenum2=phonenum[1];
		var phonenum3=phonenum[2];		
		$("#edit_phonenum1").val(phonenum1);		
		$("#edit_phonenum2").val(phonenum2);		
		$("#edit_phonenum3").val(phonenum3);

		/* 이메일 초기세팅 */
		var email="${mm:getEmail()}";
		email=email.split("@");
		var email1=email[0];
		var email2=email[1];
		$("#edit_email1").val(email1);
		$("#edit_email2").val(email2);

		$("#edit_phonenum2, #edit_phonenum3").keyup(function(){
			phonenumHandler(this);
		});
		$("#edit_pwcheck").focus(function(){
			$(this).val("");
		});
	});

	/* 비밀번호 세팅 */
	function pwHandler(val){
		var regExp1 = /[!@#$]/;
		var regExp2 = /[a-zA-Z0-9]/;
		var regExp3 = /\s/;

		if(!regExp1.test(val) || !regExp2.test(val) || regExp3.test(val) || val.length < 8 || val.length > 15){
			alert("사용 불가능 한 비밀번호입니다");
			$("#edit_pw").val("");
			$("#edit_pw").focus();
			return true;
		}
		else
			return false;
	}

	/* 핸드폰 번호 세팅 */
	function phonenumHandler(obj){
		var val = $(obj).val();
		var regExp = /^[0-9]+$/g;

		if(!regExp.test(val) && val !="" && val != null)
			$(obj).val("");

		if(val.length == 4)
			$("#edit_phonenum3").focus();		
	}
	
	/* 우편번호 세팅 */
	function searchZip(){
			new daum.Postcode({
				theme: {
					   bgColor: "#F5A9AB",
					   postcodeTextColor: "#F5A9AB",
					   emphTextColor: "#F5A9AB"
				},
				oncomplete: function(data) {					
					var fullAddr = ''; 
					var extraAddr = ''; 					
					if (data.userSelectedType === 'R') { 
						fullAddr = data.roadAddress;
					}
					else{ 
						fullAddr = data.jibunAddress;
					}
					if(data.userSelectedType === 'R'){
						if(data.bname !== ''){
							extraAddr += data.bname;
						}
						if(data.buildingName !== ''){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}						
						fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					}
					$("#edit_zip").val(data.zonecode); 
					$("#edit_addr1").val(fullAddr);
					$('#edit_addr2').focus();
				}
			}).open();
			
	}
		
	/* 이메일 세팅 */
	function emailSet(val){
		if(val == "null"){
			return;
		}
		$('#edit_email2').val(val);
	}

	function editApprove(){	
		
		if(!$('#edit_pw').val()){
			alert("비밀번호를 입력하세요");
			$("#edit_pw").focus();
			return false;
		}		
		if(!$('#edit_pwcheck').val()){
			alert("비밀번호를 확인하세요");
			$("#edit_pwcheck").focus();
			return false;
		}
		if($('#edit_pw').val() != $('#edit_pwcheck').val()){
			alert("비밀번호가 일치하지 않습니다");
			$("#edit_pwcheck").val("");
			$("#edit_pwcheck").focus();
			return false;
		}
		if($("#edit_phonenum1").val()=="") {
			alert("핸드폰 번호를 선택하세요");
			$("#edit_phonenum1").focus();
			return false;
		}
		if(!$("#edit_phonenum2").val() || $("#edit_phonenum2").val().length < 3) {
			alert("핸드폰 번호를 입력하세요");
			$("#edit_phonenum2").focus();
			return false;
		}
		if(!$("#edit_phonenum3").val() || $("#edit_phonenum3").val().length < 4) {
			alert("핸드폰 번호를 입력하세요");
			$("#edit_phonenum3").focus();
			return false;
		}
		if(!$('#edit_zip').val()){
			alert("우편번호를 입력하세요");
			searchZip();
			return false;
		}
		if(!$('#edit_addr1').val()){
			alert("주소를 입력하세요");
			searchZip();
			return false;
		}
		if(!$('#edit_addr2').val()){
			alert("상세주소를 입력하세요");
			$("#edit_addr2").focus();
			return false;
		}	
		if(pwHandler($("#edit_pw").val())) return false;		
			
		if(!$('#edit_email1').val()){
			alert("이메일 주소를 입력하세요");
			$("#edit_email1").focus();
			return false;
		}
		if(!$('#edit_email2').val()){
			alert("이메일 주소를 입력하세요");
			$("#edit_email2").focus();
			return false;
		}
		// 핸드폰, 이메일 조합
		$("#edit_phonenum").val($("#edit_phonenum1").val() + '-' + $("#edit_phonenum2").val() + '-' + $("#edit_phonenum3").val());
		$("#edit_email").val($("#edit_email1").val() + '@' + $("#edit_email2").val());
		
		if(!confirm('위 정보로 수정하시겠습니까?'))	return false;

		alert('수정이 완료되었습니다');
		$('#editForm').submit();
	}

	function editCancel(){
		if(!confirm('취소하시겠습니까? 작성된 내용은 저장되지 않습니다.')) return false;
		history.back();		
	}
</script>
</head>
<body>
<c:import url="/WEB-INF/jsp/front/common/header.jsp"/>

<div id="content">
	<div class="content_title">EDIT INFO</div>
</div>
<div id="edit_content">
	<div class="edit_content_inner edit_content_inner1">
		<div class="edit_title">본인 확인을 위해 비밀번호를 재입력 해주세요.</div>
		<div class="edit_check">
			<div class="table_06">
				<table style="width:70%;margin:0 auto;border:0;text-align:center;">
					<colgroup>
						<col width="50%"/>
						<col width="50%"/>
					</colgroup>
					<tbody>
						<tr>
							<td>아이디</td>
							<td><c:out value="${mm:getUserId()}"/></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="edit_check_pw" name="edit_check_pw" style="width:200px;height:35px;padding-left:10px;"/></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="edit_check_footer">
				<div class="edit_check_footer_inner">
					<div class="edit_check_confirm edit_check_btn">확인</div>
					<div class="edit_check_cancel edit_check_btn ml50" onclick="javascript:history.back();">취소</div>
				</div>
			</div>
		</div>
	</div>
	<div class="edit_content_inner edit_content_inner2">
		<div class="edit_header">
			<div class="edit_header_title">회원정보</div>
			<p><b><span class="red">*</span>표시 항목은 필수 입력 사항입니다.</b></p>
		</div>
		<div class="table_06">
			<form id="editForm" name="editForm" action="/front/member/editExec.do" method="post">			
				<input type="hidden" id="USERNO" name="USERNO" value="${mm:getUserNO()}"/>
				<input type="hidden" id="id" name="id" value="${mm:getUserId()}"/>
				<input type="hidden" id="name" name="name" value="${mm:getUserNm()}"/>
				<input type="hidden" id="edit_phonenum" name="edit_phonenum" value=""/>
				<input type="hidden" id="edit_email" name="edit_email" value=""/>
				<input type="hidden" id="sex" name="sex" value="${mm:getSex()}"/>
				<input type="hidden" id="gradeno" name="gradeno" value="${mm:getUserGradeNo()}"/>
				<input type="hidden" id="points" name="points" value="${mm:getPoints()}"/>
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
							<td>이름</td>
							<td><c:out value="${mm:getUserNm()}"/></td>
						</tr>
						<tr>
							<td>
								비밀번호&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="password" id="edit_pw" name="edit_pw" class="edit_input"><span style="margin-left:10px;">8~15자, 1개 이상의 특수문자(!,@,#,$)를 포함한 영어 대/소문자, 숫자</span>
							</td>
						</tr>
						<tr>
							<td>
								비밀번호 확인&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="password" id="edit_pwcheck" name="edit_pwcheck" class="edit_input">
							</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								<c:choose>
									<c:when test="${mm:getSex() == 'M'}">남자</c:when>
									<c:otherwise>여자</c:otherwise>								
								</c:choose>
							</td>
							<td>포인트</td>
							<td><c:out value="${mm:getPoints()}"/>&nbsp점
							</td>
						</tr>
						<tr>
							<td>
								핸드폰&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<select id="edit_phonenum1" name="edit_phonenum1" class="edit_select">
									<option id="edit_phonenum1" name="edit_phonenum1" value="">선택</option>
									<option id="edit_phonenum1" name="edit_phonenum1" value="010">010</option>
									<option id="edit_phonenum1" name="edit_phonenum1" value="011">011</option>
									<option id="edit_phonenum1" name="edit_phonenum1" value="016">016</option>
									<option id="edit_phonenum1" name="edit_phonenum1" value="017">017</option>
									<option id="edit_phonenum1" name="edit_phonenum1" value="018">018</option>
									<option id="edit_phonenum1" name="edit_phonenum1" value="019">019</option>
								</select> 
								&nbsp&nbsp-&nbsp&nbsp
								<input type="text" id="edit_phonenum2" name="edit_phonenum2" class="edit_input" maxlength="4">
								&nbsp&nbsp-&nbsp&nbsp
								<input type="text" id="edit_phonenum3" name="edit_phonenum3" class="edit_input" maxlength="4">
							</td>
						</tr>
						<tr>
							<td>
								우편번호&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="text" id="edit_zip" name="edit_zip" class="edit_input" onclick="javascript:searchZip();" value="${mm:getPostcode()}"><button type="button" class="search_zip" onclick="javascript:searchZip();">우편번호 찾기</button>
							</td>
						</tr>
						<tr style="height:120px">
							<td>
								주소&nbsp<span class="red">*</span></br></br>
								상세주소&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="text" id="edit_addr1" name="edit_addr1" class="edit_input" style="width:700px;" onclick="javascript:searchZip();" value="${mm:getAddr1()}"></br></br>
								<input type="text" id="edit_addr2" name="edit_addr2" class="edit_input" style="width:400px;" value="${mm:getAddr2()}"><span style="margin-left:10px;"><b>배송/수령을 위해 <span class="red">자세히</span> 기입바랍니다.</b></span>
							</td>
						</tr>
						<tr>
							<td>이메일&nbsp<span class="red">*</span></td>
							<td colspan="3">
								<input type="text" id="edit_email1" name="edit_email1" class="edit_input">
								&nbsp&nbsp@&nbsp&nbsp
								<input type="text" id="edit_email2" name="edit_email2" class="edit_input">&nbsp&nbsp
								<select id="edit_email2sel" name="edit_email2sel" class="edit_select" onchange="javascript:emailSet(this.value);">
									<option value="null">직접입력</option>
									<option id="email" name="email" value="naver.com">naver.com</option>
									<option id="email" name="email" value="hanmail.net">hanmail.net</option>
									<option id="email" name="email" value="nate.com">nate.com</option>
									<option id="email" name="email" value="gmail.com">gmail.com</option>
									<option id="email" name="email" value="hotmail.com">hotmail.com</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>생일</td>
							<td colspan="3">
								<input type="text" id="edit_bday" name="edit_bday" placeholder="1992-08-30" class="edit_input" value="${mm:getBday()}">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="edit_footer">
			<div class="edit_footer_inner">
				<div class="edit_approve edit_finish" onclick="javascript:editApprove();">수정</div>
				<div class="edit_cancel edit_finish ml50" onclick="javascript:editCancel();">취소</div>
			</div>
		</div>
	</div>	
</div>
<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>

</body>
</html>