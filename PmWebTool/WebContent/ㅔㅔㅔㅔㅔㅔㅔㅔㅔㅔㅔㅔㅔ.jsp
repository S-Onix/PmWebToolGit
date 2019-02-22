<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Ubuntu:700);
body {
  background-color: #f0f0f0;

}

.a-hover {
  font-family: 'Ubuntu', sans-serif;
  font-size: 20px;
  color: #584E4A;
  position: relative;
  text-transform: uppercase;
  text-decoration: none;
  padding-bottom: 8px;
}
.a-hover:before, .a-hover:after {
  content: '';
  position: absolute;
  bottom: 2px;
  left: 0;
  right: 0;
  height: 2px;
  background-color: #F37272;
}
.a-hover:before {
  opacity: 0;
  -webkit-transform: translateY(-8px);
          transform: translateY(-8px);
  transition: opacity 0s, -webkit-transform 0s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  transition: transform 0s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0s;
  transition: transform 0s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0s, -webkit-transform 0s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}
.a-hover:after {
  opacity: 0;
  -webkit-transform: translateY(4px);
          transform: translateY(4px);
  transition: opacity 0.2s, -webkit-transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0.2s;
  transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0.2s, -webkit-transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}
.a-hover:hover:before, .a-hover:hover:after, .a-hover:focus:before, .a-hover:focus:after {
  opacity: 1;
  -webkit-transform: translateY(0);
          transform: translateY(0);
}
.a-hover:hover:before, .a-hover:focus:before {
  transition: opacity 0.2s, -webkit-transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0.2s;
  transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0.2s, -webkit-transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}
.a-hover:hover:after, .a-hover:focus:after {
  transition: opacity 0s 0.2s, -webkit-transform 0s 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  transition: transform 0s 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0s 0.2s;
  transition: transform 0s 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0s 0.2s, -webkit-transform 0s 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

</style>
</head>
<body>
  <a class="a-hover" href="#">Lorem</a>
  <a class="a-hover" href="#">Ipsum</a>
  <a class="a-hover" href="#">Dolor sit</a>
  <a class="a-hover" href="#">Amet</a>
</body>
</html>