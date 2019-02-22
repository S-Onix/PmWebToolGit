<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
.joinInputBox{
	background: none;
	width: 70%;
	height: 20px;
}
.join-wrap{
	padding-top: 15px;
}
.join-btn-wrap{
	padding-top: 20px;
}
.joinInputBox{
	background: none;
}
#text-id{
	padding-left: 54px;
	width: 88%;
}
#join-id{
	width: 79.4%
}
#saveId{
	background: none;
	padding-right: 190px;
}
.check-btn{
	background: none;
	border: none;
	cursor: pointer;
	height: 25px;
}
.joinSubmit{
	background: none;
	width: 71%;
	height: 30px;
	cursor: pointer;
}
.joinSubButton{
	width: 80px;
    font-size: 15px;
	background: none;
	border: none;
	cursor: pointer;
}

</style>

<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
/* $(function() {
	$("#box1").draggable();
}); */
</script>

</head>
<body>

<div id="box1" class="box blurred-bg tinted">
  <div class="content">
  <div id="text-id" class="join-wrap">
  	 <input type="text" name="mid" size="20" id="join-id" class="joinInputBox" placeholder="아이디 입력">
			      <input type="button" class="check-btn" onclick="idcheck()" value="CHECK">
			      <input type="hidden"    name="reid"> 
  </div>
  <div id="text-pw" class="join-wrap">
    <input type="password" name="password" class="joinInputBox" placeholder="비밀번호 입력">
  </div>
  <div id="text-name" class="join-wrap">
	<input type="text" name="mname" class="joinInputBox" placeholder="이름 입력">
  </div>
  <div id="submit-btn" class="join-wrap">
  <input type="button" value="JOIN" class="joinSubmit" onclick="go_save()">
  </div>
  
  <div class="join-btn-wrap">
			<input type="button" value="cancle" class="joinSubButton" onclick="location='PmServlet?command=index'">
		</div>
    <p class="related">See also: <a href="https://codepen.io/ariona/details/LVZLGP/" target="_blank">Staged Dropdown Animation</a></p>  
  </div>
</div>
</body>
</html>