<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:url var="urlHome" value="/"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html> 
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path }/resources/css/signup.css" rel="stylesheet">
    <title>내 정보 수정</title>
</head>
<body>
    <center>
    <div class = "start">
        <h1>회원 정보 수정</h1>
        <hr>
        <form class="row g-3" action="${urlHome }membership/update" method="post">
            <div class="col-12">
                <label class="form-label">아이디</label>
                <input type="text" class="form-control"  name="id"  value="${mem.id }" readonly="readonly">
            </div>
            <div class="col-md-6">
            <label for="inputPassword4" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="inputEmail4" name="pw">
            </div>
            <div class="col-md-6">
            <label for="inputPassword4" class="form-label">비밀번호(확인)</label>
            <input type="password" class="form-control" id="inputPassword4">
            </div>
            <div class="col-12">
                <label class="form-label">이름</label>
                <input type="text" class="form-control" readonly="readonly" value="${mem.name }" name="name">
            </div>
            <div class="col-12">
                <label for="inputEmail4" class="form-label">이메일</label>
                <input type="email" class="form-control" id="inputEmail4" value="${mem.email }" name="email">
            </div>
            <div class="col-md-4">
                <label for="inputState" class="form-label">관심지역</label>
                <select id="inputState" class="form-select" name="interestedRegion">
                    <option>${mem.interestedRegion }</option>
                    <option>서울</option>
                    <option>제주</option>
                    <option>부산</option>
                    <option>강원도</option>
                </select>
            </div>
            <div></div>
            <div class="col-md-2">
                <label for="inputZip" class="form-label">우편번호</label>
                <input type="text" class="form-control" id="inputZip" value = "${mem.zipcode }" name="zipcode">
            </div>
            <div class="col-lg-2">
                <button class="btn btn-danger" id="search" onClick="findAddr()" type="button">검색</button>
            </div>
            <div class="col-12">
            <label for="inputAddress" class="form-label">주소</label>
            <input type="text" class="form-control" id="inputAddress" placeholder="주소" value="${mem.addr1 }" name="addr1">
            </div>
            <div class="col-12">
            <label for="inputAddress2" class="form-label">상세주소</label>
            <input type="text" class="form-control" id="inputAddress2" placeholder="상세 주소" value="${mem.addr2 }" name="addr2">
            </div>
            <div class="d-grid gap-2" style="margin-top: 50px;">
            <button type="submit" class="btn btn-danger">수정하기</button>
            </div>
        </form>
    </div>
</center>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <script type="text/javascript">
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {    	
	        	console.log(data);
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('inputZip').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("inputAddress").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("inputAddress").value = jibunAddr;
	            }
	        }
	    }).open();
	}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>