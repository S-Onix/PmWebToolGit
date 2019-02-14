<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
  font-family: "Source Sans Pro", Helvetica Neue, Helvetica, Arial, sans-serif;
  font-size: 16px;
  line-height: 1.75;
}

#body-content {
  display: flex;
  background-color: #031625;
}
#body-content:hover .tl-item {
  width: 23.3333%;
}

.line-item {
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
  position: relative;
  width: 25%;
  height: 100vh;
  min-height: 600px;
  color: #fff;
  overflow: hidden;
  transition: width 0.5s ease;
}
.line-item:before, .line-item:after {
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
}
.line-item:after {
  background: rgba(3, 22, 37, 0.85);
  opacity: 1;
  transition: opacity 0.5s ease;
}
.line-item:before {
  background: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, black 75%);
  z-index: 1;
  opacity: 0;
  -webkit-transform: translate3d(0, 0, 0) translateY(50%);
          transform: translate3d(0, 0, 0) translateY(50%);
  transition: opacity 0.5s ease, -webkit-transform 0.5s ease;
  transition: opacity 0.5s ease, transform 0.5s ease;
  transition: opacity 0.5s ease, transform 0.5s ease, -webkit-transform 0.5s ease;
}
.line-item:hover {
  width: 30% !important;
}
.line-item:hover:after {
  opacity: 0;
}
.line-item:hover:before {
  opacity: 1;
  -webkit-transform: translate3d(0, 0, 0) translateY(0);
          transform: translate3d(0, 0, 0) translateY(0);
  transition: opacity 1s ease, -webkit-transform 1s ease 0.25s;
  transition: opacity 1s ease, transform 1s ease 0.25s;
  transition: opacity 1s ease, transform 1s ease 0.25s, -webkit-transform 1s ease 0.25s;
}
.line-item:hover .tl-content {
  opacity: 1;
  -webkit-transform: translateY(0);
          transform: translateY(0);
  transition: all 0.75s ease 0.5s;
}
.line-item:hover .line-bg {
  -webkit-filter: grayscale(0);
          filter: grayscale(0);
}

.tl-content {
  -webkit-transform: translate3d(0, 0, 0) translateY(25px);
          transform: translate3d(0, 0, 0) translateY(25px);
  position: relative;
  z-index: 1;
  text-align: center;
  margin: 0 1.618em;
  top: 55%;
  opacity: 0;
}
.tl-content h1 {
  font-family: "Pathway Gothic One", Helvetica Neue, Helvetica, Arial, sans-serif;
  text-transform: uppercase;
  color: #1779cf;
  font-size: 1.44rem;
  font-weight: normal;
}

.line-date {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translateX(-50%) translateY(-50%);
          transform: translateX(-50%) translateY(-50%);
  z-index: 1;
  border-top: 1px solid #fff;
  border-bottom: 1px solid #fff;
}
.line-date p {
  font-family: "Pathway Gothic One", Helvetica Neue, Helvetica, Arial, sans-serif;
  font-size: 1.728rem;
  line-height: 0;
}

.line-bg {
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  background-size: cover;
  background-position: center center;
  transition: -webkit-filter 0.5s ease;
  transition: filter 0.5s ease;
  transition: filter 0.5s ease, -webkit-filter 0.5s ease;
  -webkit-filter: grayscale(100%);
          filter: grayscale(100%);
}


</style>
</head>
<section id="body-content">
  
  <div class="line-item">
    
    <div class="line-bg" style="background-image: url(https://placeimg.com/801/801/nature)"></div>
    
    <div class="line-date">
      <p class="f2 heading--sanSerif">1/15</p>
    </div>

    <div class="tl-content">
      <h1>Project Team One</h1>
      <p>Suspendisse potenti. Sed sollicitudin eros lorem</p>
    </div>

  </div>

  <div class="line-item">
    
    <div class="line-bg" style="background-image: url(https://placeimg.com/802/802/nature)"></div>
    
    <div class="line-date">
      <p class="f2 heading--sanSerif">1/30</p>
    </div>

    <div class="tl-content">
      <h1 class="f3 text--accent ttu">Project Manage</h1>
      <p>Morbi sed nisl et arcu.</p>
    </div>

  </div>

  <div class="line-item">
    
    <div class="line-bg" style="background-image: url(https://placeimg.com/803/803/nature)"></div>
    
    <div class="line-date">
      <p class="f2 heading--sanSerif">2/10</p>
    </div>

    <div class="tl-content">
      <h1 class="f3 text--accent ttu">Phasellus mauris</h1>
      <p>Mauris cursus magna at libero lobortis tempor. </p>
    </div>

  </div>

  <div class="line-item">
    
    <div class="line-bg" style="background-image: url(https://placeimg.com/800/800/nature)"></div>
    
    <div class="line-date">
      <p class="f2 heading--sanSerif">2/15</p>
    </div>

    <div class="tl-content">
      <h1 class="f3 text--accent ttu">Mauris vitae nunc</h1>
      <p>Suspendisse ac mi at dolor sodales faucibus. </p>
    </div>

  </div>
</section>
</html>