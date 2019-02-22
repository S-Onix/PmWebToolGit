<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Lato:400,700");
body, html {
  height: 100%;
}

body {
  font-family: "Lato", sans-serif;
  color: #333333;
  display: flex;
  align-items: center;
  align-content: center;
  justify-content: center;
}

.container {
  width: auto;
  margin: auto;
}

a {
  text-transform: uppercase;
  text-decoration: none;
  font-weight: 700;
}

.projectName {
  position: relative;
  letter-spacing: 0.25em;
  margin: 0 auto;
  padding: 1rem 2.5rem;
  background: transparent;
  outline: none;
  font-size: 28px;
  color: #fff;
}
.projectName::after, .projectName::before {
  content: "";
  position: absolute;
  height: 100%;
  width: 50%;
  -webkit-transform: skewX(30deg);
          transform: skewX(30deg);
  transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  z-index: -2;
}
.projectName::before {
  background-color: #2F3440;
  top: -1rem;
  left: 0rem;
}
.projectName::after {
  background-color: #3F5666;
  top: 1rem;
  left: 8rem;
}
.projectName:hover::before, .projectName:hover::after {
  top: 0;
  -webkit-transform: skewx(0deg);
          transform: skewx(0deg);
}
.projectName:hover::after {
  left: 0rem;
}
.projectName:hover::before {
  left: 8.75rem;
}
</style>
</head>
<body>

<div class="container"><a class="projectName" href="#">hover me</a></div>
</body>
</html>