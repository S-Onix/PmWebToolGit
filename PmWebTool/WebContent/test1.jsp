<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
html,body{
  height:100%;
}
body{
  text-align:center;
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
/* project-card ������ */
.project-card{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
/* hover�� ���� */
.project-card:hover{
  background:#fff;
  color:#1AAB8A;
}
/* hover�� �� ��ġ (top)*/
.project-card:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
/* hover�� �� ��ġ (bottom)*/
.project-card:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
/* hover�� �� ����/�ӵ� */
.project-card:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<button class="project-card">Hover me !</button>

</body>
</html>