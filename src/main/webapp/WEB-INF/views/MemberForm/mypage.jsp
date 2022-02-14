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
    <title>마이 페이지</title>
</head>
<body>
    <center>
    <div class = "start" style="width: 700px; height: 1000px;">
        <h1>마이 페이지</h1>
        <hr>
        <form class="row g-3" action="${urlHome }">
            <div class="col-12">
                <label class="form-label">아이디</label>
                <input type="text" class="form-control" value="${mem.id }" readonly="readonly">
            </div>
            <div class="col-md-6">
            <label for="inputPassword4" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="inputEmail4" value="" readonly="readonly">
            </div>
            <div class="col-md-6">
            <label for="inputPassword4" class="form-label">비밀번호(확인)</label>
            <input type="password" class="form-control" id="inputPassword4" value="" readonly="readonly">
            </div>
            <div class="col-12">
                <label class="form-label">이름</label>
                <input type="text" class="form-control" readonly="readonly" value="${mem.name }">
            </div>
            <div class="col-12">
                <label for="inputEmail4" class="form-label">이메일</label>
                <input type="email" class="form-control" id="inputEmail4" readonly="readonly" value="${mem.email }">
            </div>
            <div class="col-md-4">
                <label for="inputState" class="form-label">관심지역</label>
                <select id="inputState" class="form-select" readonly="readonly">
                    <option selected>${mem.interestedRegion }</option>
                    <option>서울</option>
                    <option>제주</option>
                    <option>부산</option>
                    <option>강원도</option>
                </select>
            </div>
            <div></div>
            <div class="col-md-2">
                <label for="inputZip" class="form-label">우편번호</label>
                <input type="text" class="form-control" id="inputZip" readonly="readonly" value="${mem.zipcode }"> 
            </div>
            <div class="col-lg-2">
                <button type="submit" class="btn btn-danger" id="search" readonly="readonly">검색</button>
            </div>
            <div class="col-12">
            <label for="inputAddress" class="form-label">주소</label>
            <input type="text" class="form-control" id="inputAddress" placeholder="주소" readonly="readonly" value="${mem.addr1 }">
            </div>
            <div class="col-12">
            <label for="inputAddress2" class="form-label">상세주소</label>
            <input type="text" class="form-control" id="inputAddress2" placeholder="상세 주소" readonly="readonly" value="${mem.addr2 }">
            </div>
            <div class="d-grid gap-2" style="margin-top: 50px;">
            <button type="submit" class="btn btn-danger">홈으로</button>
            </form>
            </div>
            <form action="${urlHome }membership/modify">
            <div class="d-grid gap-2" style="margin-top: 50px;">
                <button type="submit" class="btn btn-danger">회원 정보 수정</button>
                </div>
            </form>
            <form action="${urlHome }membership/withdrawal">
            <div class="d-grid gap-2" style="margin-top: 50px;">
                <button type="submit" class="btn btn-danger">회원 탈퇴</button>
                </div>
            </form>
    </div>
</center>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>