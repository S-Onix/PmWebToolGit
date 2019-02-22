<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">


body {
  font-family: 'Lato', sans-serif;
}

.hero {
  width: 100%;
  min-height: 450px;
  position: relative;
  top: 0;
  left: 0;
  background-color: #d9edfd;
}

.layer-1 {
  -webkit-animation: parallax_fg linear 20s infinite both;
          animation: parallax_fg linear 20s infinite both;
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/24650/1.png) 0 100% repeat-x;
  z-index: 1;
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: auto 136px;
}

.layer-2 {
  -webkit-animation: parallax_fg linear 30s infinite both;
          animation: parallax_fg linear 30s infinite both;
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/24650/2.png) 0 100% repeat-x;
  z-index: 1;
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: auto 145px;
}

.layer-3 {
  -webkit-animation: parallax_fg linear 55s infinite both;
          animation: parallax_fg linear 55s infinite both;
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/24650/3.png) 0 100% repeat-x;
  z-index: 1;
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: auto 158px;
}

.layer-4 {
  -webkit-animation: parallax_fg linear 75s infinite both;
          animation: parallax_fg linear 75s infinite both;
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/24650/4.png) 0 100% repeat-x;
  z-index: 1;
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: auto 468px;
}

.layer-5 {
  -webkit-animation: parallax_fg linear 95s infinite both;
          animation: parallax_fg linear 95s infinite both;
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/24650/5.png) 0 100% repeat-x;
  z-index: 1;
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: auto 311px;
}

.layer-6 {
  -webkit-animation: parallax_fg linear 120s infinite both;
          animation: parallax_fg linear 120s infinite both;
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/24650/6.png) 0 100% repeat-x;
  z-index: 1;
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: auto 222px;
}

.bike-1,
.bike-2 {
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/24650/bike.png) 0 100% no-repeat;
  z-index: 1;
  position: absolute;
  bottom: 100px;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: auto 75px;
}

.bike-1 {
  -webkit-animation: parallax_bike linear 10s infinite both;
          animation: parallax_bike linear 10s infinite both;
}

.bike-2 {
  -webkit-animation: parallax_bike linear 15s infinite both;
          animation: parallax_bike linear 15s infinite both;
}

@-webkit-keyframes parallax_fg {
  0% {
    background-position: 2765px 100%;
  }
  100% {
    background-position: 550px 100%;
  }
}

@keyframes parallax_fg {
  0% {
    background-position: 2765px 100%;
  }
  100% {
    background-position: 550px 100%;
  }
}
@-webkit-keyframes parallax_bike {
  0% {
    background-position: -300px 100%;
  }
  100% {
    background-position: 2000px 100%;
  }
}
@keyframes parallax_bike {
  0% {
    background-position: -300px 100%;
  }
  100% {
    background-position: 2000px 100%;
  }
}
.logo {
  margin: 70px auto;
  position: absolute;
  z-index: 2;
  width: 100%;
}
.logo img {
  display: block;
  margin: 0 auto;
  max-width: 100%;
}
@media (max-width: 700px) {
  .logo img {
    max-width: 90%;
  }
}

nav {
  background-color: #12212f;
  overflow: hidden;
}
nav ul {
  list-style: none;
  max-width: 900px;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
nav li {
  padding: 10px 20px;
}
@media (max-width: 700px) {
  nav li {
    width: 50%;
    text-align: center;
  }
}
nav a {
  /* Tilmelding: */
  font-weight: 700;
  font-size: 1.25em;
  text-transform: uppercase;
  color: #fff;
  text-decoration: none;
}

.dark-bg {
  background-color: #12212f;
  padding: 50px 50px;
}
.dark-bg img {
  display: block;
  margin: 0 auto;
  width: auto;
  max-width: 100%;
}

.light-bg {
  background-color: #fff;
  padding: 50px 50px;
}
.light-bg img {
  display: block;
  margin: 0 auto;
  width: auto;
  max-width: 100%;
}

.extra {
  max-width: 700px;
  margin: 0 auto;
  font-size: 18px;
  color: #12202F;
  letter-spacing: 0px;
  line-height: 27px;
}

</style>
<script>
WebFontConfig = {
    google: { families: [ 'Lato:400,300,300italic,400italic,700,700italic,900,900italic:latin' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })(); 
</script>
</head>
<body>
<div class="hero">
  
  <div class="parallax-layer layer-6"></div>
  <div class="parallax-layer layer-5"></div>
  <div class="parallax-layer layer-4"></div>
  <div class="parallax-layer bike-1"></div>
  <div class="parallax-layer bike-2"></div>
  <div class="parallax-layer layer-3"></div>
  <div class="parallax-layer layer-2"></div>
  <div class="parallax-layer layer-1"></div>
  <div class="logo">
    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/24650/logo.svg" alt=""  />
  </div>
</div>


</body>
</html>