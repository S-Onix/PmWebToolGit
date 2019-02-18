<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script id="text/javascript">
window.onload = function() {
    if (getCookie("mid")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
        document.frm.mid.value = getCookie("mid"); //input 이름이 id인곳에 getCookie("id")값을 넣어줌
        document.frm.savemid.checked = true; // 체크는 체크됨으로
    }
}

function setCookie(name, value, expiredays) //쿠키 저장함수
{
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires="
            + todayDate.toGMTString() + ";"
}

function getCookie(Name) { // 쿠키 불러오는 함수
    var search = Name + "=";
    if (document.cookie.length > 0) { // if there are any cookies
        offset = document.cookie.indexOf(search);
        if (offset != -1) { // if cookie exists
            offset += search.length; // set index of beginning of value
            end = document.cookie.indexOf(";", offset); // set index of end of cookie value
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
}

function go_login() { 
	if (document.frm.mid.value == "") {
		alert("아이디를 입력해주세요");
		document.frm.mid.focus();
	} else if (document.frm.password.value == "") {
		alert("비밀번호를 입력해주세요");
		document.frm.password.focus();
	} else if (document.frm.savemid.checked == true) { // 아이디 저장을 체크 하였을때
        setCookie("id", document.frm.mid.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
    } else if (document.frm.savemid.checked == false) { // 아이디 저장을 체크 하지 않았을때
        setCookie("id", document.frm.mid.value, 0); //날짜를 0으로 저장하여 쿠키삭제
	} else { 
	document.frm.action = "PmServlet?command=login";
	document.frm.submit();
 }
}

$(function() {
	$("#box1").draggable();
});
</script>


<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Raleway:100,400,700);
body {
  background-image: url("https://lh4.googleusercontent.com/-3eBjuQpOGFw/U47yh_-OycI/AAAAAAAAI2U/uaU5pK49N1w/s1600/normal.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
  font-family: Raleway, Open Sans, Droid Sans, Roboto, arial, sans-serif;
}

.blurred-bg {
  background-image: url("https://lh3.googleusercontent.com/-m8TxQMObg6c/U474EWu7Y9I/AAAAAAAAI2k/xkRGoIEC1iU/s1600/blur.jpg");
  background-repeat: no-repeat;
  -moz-background-size: cover;
  -o-background-size: cover;
  -webkit-background-size: cover;
  background-size: cover;
  background-attachment: fixed;
}
.blurred-bg.tinted {
  background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjEuMCIgeDI9IjAuNSIgeTI9IjAuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIgc3RvcC1vcGFjaXR5PSIwLjIiLz48c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmZmZmZmYiIHN0b3Atb3BhY2l0eT0iMC4yIi8+PC9saW5lYXJHcmFkaWVudD48L2RlZnM+PHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgZmlsbD0idXJsKCNncmFkKSIgLz48L3N2Zz4g'), url("https://lh3.googleusercontent.com/-m8TxQMObg6c/U474EWu7Y9I/AAAAAAAAI2k/xkRGoIEC1iU/s1600/blur.jpg");
  background-size: 100%;
  background-image: -moz-linear-gradient(90deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.2)), url("https://lh3.googleusercontent.com/-m8TxQMObg6c/U474EWu7Y9I/AAAAAAAAI2k/xkRGoIEC1iU/s1600/blur.jpg");
  background-image: -webkit-linear-gradient(90deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.2)), url("https://lh3.googleusercontent.com/-m8TxQMObg6c/U474EWu7Y9I/AAAAAAAAI2k/xkRGoIEC1iU/s1600/blur.jpg");
  background-image: linear-gradient(0deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.2)), url("https://lh3.googleusercontent.com/-m8TxQMObg6c/U474EWu7Y9I/AAAAAAAAI2k/xkRGoIEC1iU/s1600/blur.jpg");
}
.blurred-bg.shaded {
  background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjEuMCIgeDI9IjAuNSIgeTI9IjAuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzAwMDAwMCIgc3RvcC1vcGFjaXR5PSIwLjIiLz48c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMwMDAwMDAiIHN0b3Atb3BhY2l0eT0iMC4yIi8+PC9saW5lYXJHcmFkaWVudD48L2RlZnM+PHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgZmlsbD0idXJsKCNncmFkKSIgLz48L3N2Zz4g'), url("https://lh3.googleusercontent.com/-m8TxQMObg6c/U474EWu7Y9I/AAAAAAAAI2k/xkRGoIEC1iU/s1600/blur.jpg");
  background-size: 100%;
  background-image: -moz-linear-gradient(90deg, rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)), url("https://lh3.googleusercontent.com/-m8TxQMObg6c/U474EWu7Y9I/AAAAAAAAI2k/xkRGoIEC1iU/s1600/blur.jpg");
  background-image: -webkit-linear-gradient(90deg, rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)), url("https://lh3.googleusercontent.com/-m8TxQMObg6c/U474EWu7Y9I/AAAAAAAAI2k/xkRGoIEC1iU/s1600/blur.jpg");
  background-image: linear-gradient(0deg, rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)), url("https://lh3.googleusercontent.com/-m8TxQMObg6c/U474EWu7Y9I/AAAAAAAAI2k/xkRGoIEC1iU/s1600/blur.jpg");
}

.box {
  width: 500px;
  height: 300px;
  left: -webkit-calc(50% - 250px);
  top: 20%;
  position: absolute;
  border-radius: 5px;
  -moz-box-shadow: 0 20px 30px rgba(0, 0, 0, 0.6);
  -webkit-box-shadow: 0 20px 30px rgba(0, 0, 0, 0.6);
  box-shadow: 0 20px 30px rgba(0, 0, 0, 0.6);
  border: 1px solid rgba(255, 255, 255, 0.3);
  padding: 20px;
  text-align: center;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
  display: flex;
  transition: box-shadow 0.3s ease;
}
.box:active {
  cursor: move;
  -moz-box-shadow: 0 20px 50px rgba(0, 0, 0, 0.9);
  -webkit-box-shadow: 0 20px 50px rgba(0, 0, 0, 0.9);
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.9);
}
.box .content {
  margin: auto;
}

h1,
h2,
a,
p {
  color: white;
  font-weight: 100;
}
.tinted h1, .tinted
h2, .tinted
a, .tinted
p {
  color: black;
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.2);
}

h2 {
  font-size: 14px;
}

p {
  margin: 20px;
}
p.related {
  text-transform: uppercase;
  font-weight: 700;
  color: #444;
}
p.related a {
  font-weight: 700;
  text-decoration: none;
}
p.related a:hover {
  text-decoration: underline;
}
.login-text{
	background: none;
	width: 70%;
	height: 25px;
}
.login-wrap{
	padding-top: 15px;
}
.login-btn-wrap{
	padding-top: 20px;
}
#saveId{
	background: none;
	padding-right: 190px;
}
.loginSubButton{
	background: none;
	border: none;
	cursor: pointer;
}
.loginSubmit{
	background: none;
	width: 71%;
	height: 30px;
	cursor: pointer;
}
input{
	background-color: white;
}
</style>

</head>
<body>
<form name="frm" method="post">

<div id="box1" class="box blurred-bg tinted">
  <div class="content">
  <div id="text-id" class="login-wrap">
  	<input type="text" name="mid" size="20" class="login-text" placeholder="아이디 입력"> 
  </div>
  <div id="text-pw" class="login-wrap">
    <input type="password" name="password" size="20" class="login-text" placeholder="비밀번호 입력">
  </div>
  <div id="saveId" class="login-wrap">
				<input type="checkbox" name="savemid"> SAVE ID
  </div>
  <div id="submit-btn" class="login-wrap">
  <input type="button" value="LOGIN" class="loginSubmit" onclick="go_login()">
  </div>
  
  <div class="login-btn-wrap">
			<input type="button" value="Change" class="loginSubButton" onclick="location='PmServlet?command=change_pw_form'"> |
			<input type="button" value="Cancle" class="loginSubButton" onclick="location='PmServlet?command=index'">
		</div>
    <p class="related">See also: <a href="https://codepen.io/ariona/details/LVZLGP/" target="_blank">Staged Dropdown Animation</a></p>  
  </div>
</div>
</form>
</body>
</html>