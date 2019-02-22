<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Ubuntu:700);

.cool-link {
font-family: 'Ubuntu', sans-serif;
  display: inline-block;
  text-decoration: none;
  color: #584E4A;
}

.cool-link::after {
  content: '';
  display: block;
  width: 0;
  height: 2px;
  background: #000;
  transition: width .3s;
}

.cool-link:hover::after {
  width: 100%;
}

</style>
</head>
<body>
    <a class="cool-link" href="#">A link</a>
    <a class="cool-link" href="#">A link</a>
    <a class="cool-link" href="#">A cool link</a>

<a class="cool-link" href="http://youtu.be/t9nQDdrPgZ0">Check out the associated YouTube Screencast!</a>
</body>
</html>