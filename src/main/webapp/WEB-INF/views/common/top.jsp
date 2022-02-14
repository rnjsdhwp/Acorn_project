<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="urlHome" value="/"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%
	/*
	 * request를 통해 session을 얻어올 수 있으며
	 * 내부 인자가 true인 경우 session이 없으면 별도로 생성하고
	 * false이면 별도로 생성하지 않고 null을 반환한다.
	 */
	HttpSession topSession = request.getSession(false);
	String sessionId = (String)topSession.getAttribute("id");
%> 
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path }/resources/css/top.css" rel="stylesheet">
    <title>Document</title>
    <style>
        h1 {
            margin-left: 43%;
         
        }
    </style>
</head>

<body>
    <header>
        <div class="home-wrap">
            <h1>
                <a href="${urlHome }">같이가자</a>
            </h1>
            <div class="home-menu">
                <div class="serach-inner">
                    <form name="kwd_f1" method="GET" action="/search">
                        <input type="text" name="keyw" id="keybox" value="" placeholder="검색어를 입력하세요.">
                        <button type="button" onclick="" class="btn btn-danger">검색</button>
                    </form>
                </div>
				<% if(sessionId == null){ %>
                <div class="user-inner">
                    <a href="${urlHome }index?formPath=login" class="login">로그인</a>
                </div>
                <%}else{ %>
                <div class="user-inner">
                    <a href="${urlHome }login/logoutProc" class="logout">로그아웃</a>
                </div>
                <div class="user-inner">
                    <a href="${urlHome }membership/info" class="myPage">마이페이지</a>
                </div>
                <%} %>
    
            </div>
        </div>
        <nav>
            <span class="arrow-left" style="display:none;"></span>
            <div id="top">
                <ul>
                    <li><a href="${urlHome }index?formPath=region" class=""><span>지역별 추천</span></a></li>
                    <li><a href="${urlHome }index?formPath=thema" class="before"><span>테마별 추천</span></a></li>
                    <li><a href="${urlHome }review/reviewList" class="before"><span>리뷰 보기</span></a></li>
                </ul>
            </div>
            <span class="arrow-right"></span>
        </nav>
    </header>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>