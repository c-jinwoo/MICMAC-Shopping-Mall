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

var idDupl = "F";

	$(document).ready(function(){

		$(".ajaxIDcheck").click(function(){
			var regExp = /^[a-zA-Z0-9]{7,15}$/g;
			var idTry = $("#join_id").val();

			if(!regExp.test(idTry)){
				alert("사용 불가능한 아이디입니다");
				$("#join_id").val("");
				$("#join_id").focus();
				return false;
			}

			$.ajax({
				url : "/front/member/joinIDcheck.do",
				type : "POST",
				data : {"id":$("#join_id").val()},
				success : function(data){
					if(data){
						alert("사용 가능한 아이디입니다");
						idDupl = "T";
					}
					else{
						alert("사용 불가능한 아이디입니다");
						
					}
				}
			});			
		});
		
		$("#join_phonenum2, #join_phonenum3").keyup(function(){
			phonenumHandler(this);
		});
		$("#join_pwcheck").focus(function(){
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
			$("#join_pw").val("");
			$("#join_pw").focus();
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
			$("#join_phonenum3").focus();		
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
					$("#join_zip").val(data.zonecode); 
					$("#join_addr1").val(fullAddr);
					$('#join_addr2').focus();
				}
			}).open();
			
	}
		
	/* 이메일 세팅 */
	function emailSet(val){
		if(val == "null"){
			return;
		}
		$('#join_email2').val(val);
	}

	function joinApprove(){	
		
		if(!$('#join_id').val()){
			alert("아이디를 입력하세요");
			$("#join_id").focus();
			return false;
		}
		if(!$('#join_pw').val()){
			alert("비밀번호를 입력하세요");
			$("#join_pw").focus();
			return false;
		}		
		if(!$('#join_pwcheck').val()){
			alert("비밀번호를 확인하세요");
			$("#join_pwcheck").focus();
			return false;
		}
		if($('#join_pw').val() != $('#join_pwcheck').val()){
			alert("비밀번호가 일치하지 않습니다");
			$("#join_pwcheck").val("");
			$("#join_pwcheck").focus();
			return false;
		}		
		if(!$('#join_name').val()){
			alert("이름을 입력하세요");
			$("#join_name").focus();
			return false;
		}
		if(!$('input:radio[name=join_sex]').is(':checked')){
			alert("성별을 선택하세요");
			$(".join_radio").focus();
			return false;
		}
		if($("#join_phonenum1").val()=="") {
			alert("핸드폰 번호를 선택하세요");
			$("#join_phonenum1").focus();
			return false;
		}
		if(!$("#join_phonenum2").val() || $("#join_phonenum2").val().length < 3) {
			alert("핸드폰 번호를 입력하세요");
			$("#join_phonenum2").focus();
			return false;
		}
		if(!$("#join_phonenum3").val() || $("#join_phonenum3").val().length < 4) {
			alert("핸드폰 번호를 입력하세요");
			$("#join_phonenum3").focus();
			return false;
		}
		if(!$('#join_zip').val()){
			alert("우편번호를 입력하세요");
			searchZip();
			return false;
		}
		if(!$('#join_addr1').val()){
			alert("주소를 입력하세요");
			searchZip();
			return false;
		}
		if(!$('#join_addr2').val()){
			alert("상세주소를 입력하세요");
			$("#join_addr2").focus();
			return false;
		}	
		if(!$('#join_email1').val()){
			alert("이메일 주소를 입력하세요");
			$("#join_email1").focus();
			return false;
		}
		if(!$('#join_email2').val()){
			alert("이메일 주소를 입력하세요");
			$("#join_email2").focus();
			return false;
		}
		
		
		//조건 체크
		if(idDupl=="F"){
			alert("아이디 중복체크를 하시기 바랍니다");
			return false;
		}
		if(pwHandler($("#join_pw").val())) return false;
		

		if($("#join_bday").val()){
			var val = $("#join_bday").val();
			var regExp1 = /[-]/;
			var regExp2 = /[0-9]/;

			if(!regExp1.test(val) || !regExp2.test(val) || val.length !=10){
				alert("생년월일 형식에 맞지 않습니다");return false;
			}
		}



		// 핸드폰, 이메일 조합
		$("#join_phonenum").val($("#join_phonenum1").val() + '-' + $("#join_phonenum2").val() + '-' + $("#join_phonenum3").val());
		$("#join_email").val($("#join_email1").val() + '@' + $("#join_email2").val());
		
		if(!confirm('위 정보로 가입하시겠습니까?'))	return false;

		$('#joinForm').submit();
	}

	function joinCancel(){
		if(confirm('취소하시겠습니까? 작성된 내용은 저장되지 않습니다.')){
			history.back();
		}
	}




</script>
</head>
<body>
<c:import url="/WEB-INF/jsp/front/common/header.jsp"/>

<div id="content">
	<div class="content_title">JOIN US</div>
</div>
<div id="join_content">
	<div class="join_content_inner">
		<div class="join_header">
			<div class="join_header_title">회원정보</div>
			<p><b><span class="red">*</span>표시 항목은 필수 입력 사항입니다.</b></p>
		</div>
		<div class="table_06">
			<form id="joinForm" name="joinForm" action="/front/member/joinSuccess.do" method="post">
				<input type="hidden" id="join_phonenum" name="join_phonenum" value=""/>
				<input type="hidden" id="join_email" name="join_email" value=""/>
				<table>
					<colgroup>
						<col width="20%"/>					
						<col width="30%"/>					
						<col width="20%"/>					
						<col width="30%"/>
					</colgroup>
					<tbody>
						<tr>
							<td>
								아이디&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="text" id="join_id" name="join_id" class="join_input" maxlength="15"><span style="margin-left:10px;">7~15자, 영어 대/소문자, 숫자</span><button type="button" class="ajaxIDcheck">아이디 중복 확인</button>
							</td>
						</tr>
						<tr>
							<td>
								비밀번호&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="password" id="join_pw" name="join_pw" class="join_input"><span style="margin-left:10px;">8~15자, 1개 이상의 특수문자(!,@,#,$)를 포함한 영어 대/소문자, 숫자</span>
							</td>
						</tr>
						<tr>
							<td>
								비밀번호 확인&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="password" id="join_pwcheck" name="join_pwcheck" class="join_input">
							</td>
						</tr>
						<tr>
							<td>
								이름&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="text" id="join_name" name="join_name" class="join_input">
							</td>
						</tr>
						<tr>
							<td>
								성별&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="radio" id="join_sexM" name="join_sex" class="join_radio" value="M"><span>남자</span>&nbsp&nbsp
								<input type="radio" id="join_sexF" name="join_sex" class="join_radio" value="F">여자
							</td>
						</tr>
						<tr>
							<td>
								핸드폰&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<select id="join_phonenum1" name="join_phonenum1" class="join_select">
									<option id="join_phonenum1" name="join_phonenum1" value="">선택</option>
									<option id="join_phonenum1" name="join_phonenum1" value="010">010</option>
									<option id="join_phonenum1" name="join_phonenum1" value="011">011</option>
									<option id="join_phonenum1" name="join_phonenum1" value="016">016</option>
									<option id="join_phonenum1" name="join_phonenum1" value="017">017</option>
									<option id="join_phonenum1" name="join_phonenum1" value="018">018</option>
									<option id="join_phonenum1" name="join_phonenum1" value="019">019</option>
								</select> 
								&nbsp&nbsp-&nbsp&nbsp
								<input type="text" id="join_phonenum2" name="join_phonenum2" class="join_input" maxlength="4" >
								&nbsp&nbsp-&nbsp&nbsp
								<input type="text" id="join_phonenum3" name="join_phonenum3" class="join_input" maxlength="4" >
							</td>
						</tr>
						<tr>
							<td>
								우편번호&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="text" id="join_zip" name="join_zip" class="join_input" onclick="javascript:searchZip();"><button type="button" class="search_zip" onclick="javascript:searchZip();">우편번호 찾기</button>
							</td>
						</tr>
						<tr style="height:120px">
							<td>
								주소&nbsp<span class="red">*</span></br></br>
								상세주소&nbsp<span class="red">*</span>
							</td>
							<td colspan="3">
								<input type="text" id="join_addr1" name="join_addr1" class="join_input" style="width:700px;" onclick="javascript:searchZip();"></br></br>
								<input type="text" id="join_addr2" name="join_addr2" class="join_input" style="width:400px;"><span style="margin-left:10px;"><b>배송/수령을 위해 <span class="red">자세히</span> 기입바랍니다.</b></span>
							</td>
						</tr>
						<tr>
							<td>이메일&nbsp<span class="red">*</span></td>
							<td colspan="3">
								<input type="text" id="join_email1" name="join_email1" class="join_input">
								&nbsp&nbsp@&nbsp&nbsp
								<input type="text" id="join_email2" name="join_email2" class="join_input">&nbsp&nbsp
								<select id="join_email2sel" name="join_email2sel" class="join_select" onchange="javascript:emailSet(this.value);">
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
								<input type="text" id="join_bday" name="join_bday" placeholder="1992-08-30" class="join_input"><span style="margin-left:10px;">YYYY-MM-DD</span>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="join_footer">
			<div class="join_footer_inner">
				<div class="join_approve join_finish" onclick="javascript:joinApprove();">가입</div>
				<div class="join_cancel join_finish ml50" onclick="javascript:joinCancel();">취소</div>
			</div>
		</div>
	</div>	
</div>
<c:import url="/WEB-INF/jsp/front/common/footer.jsp"/>

</body>
</html>