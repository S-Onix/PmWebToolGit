<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ import url('https://rsms.me/inter/inter.css')%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<script type="text/javascript">
var timelineSwiper = new Swiper(".timeline .swiper-container", {
	  direction: "vertical",
	  loop: false,
	  speed: 1600,
	  pagination: ".swiper-pagination",
	  paginationBulletRender: function(swiper, index, className) {
	    var year = document
	      .querySelectorAll(".swiper-slide")
	      [index].getAttribute("data-year");
	    return '<span class="' + className + '">' + year + "</span>";
	  },
	  paginationClickable: true,
	  nextButton: ".swiper-button-next",
	  prevButton: ".swiper-button-prev",
	  breakpoints: {
	    768: {
	      direction: "horizontal"
	    }
	  }
	});




</script>
<style type="text/css">
body {
  align-items: center;
  background: #000;
  display: flex;
  font-family: Inter, sans-serif;
  font-weight: 800;
  justify-content: center;
  margin: 0;
}
.container {
  //height: 200vh;
  width: 100vw;
}
.top {
  background: #fff;
  height: 100vh;
  overflow: hidden;
  width: 100vw;
}
.section {
  height: 100vh;
  overflow: hidden;
  position: absolute;
  width: 100vw;
}

.image {
  height: 100vmax;
  left: calc(50% - 75vmax);
  width: 150vmax;
  top: calc(50% - 50vmax);;
  position: absolute;
}
.image1 {
  clip-path: polygon(0 100%, 0 29.863846%,0.3125% 30.21875%,0.4375% 30.625%,0.6875% 31.125%,0.9375% 31.1875%,1.0625% 31.71875%,1.3125% 32.40625%,1.53125% 32.3125%,1.96875% 32.375%,2.21875% 32.0625%,2.59375% 32.21875%,2.53125% 32.71875%,3.15625% 33.09375%,3.71875% 33.78125%,4% 34.4375%,4.15625% 34.5%, 4.15625% 34.90625%,4.4375% 35.0625%, 4.4375% 35.4375%,4.5625% 36.5%,4.6875% 36.6875%,4.71875% 37.03125%,5.84375% 38%,6% 37.625%,6.28125% 37.65625%,6.59375% 38.1875%,6.8125% 38.71875%,15.4375% 45.5%,16.75% 46.53125%,17.5% 47.40625%,21.34375% 49.84375%,21.65625% 49.5%,21.875% 49.65625%,22.125% 49.8125%,22.5625% 49.8125%,22.75% 50.0625%,23.0625% 50.125%,23.21875% 50.28125%,23.59375% 50.28125%,23.75% 50.46875%,23.96875% 50.25%,24.21875% 50.25%,24.46875% 50.125%,25% 50.4375%,25.21875% 50.71875%,25.5625% 50.75%,25.875% 50.625%,26.5625% 50.8125%,27.34375% 50.9375%,27.5625% 50.84375%,27.8125% 50.96875%,28.34375% 50.875%,29.03125% 51.09375%,29.59375% 51.125%,30.21875% 51.3125%,30.65625% 50.96875%,30.96875% 51.9375%,31.5625% 51.8125%,31.8125% 52.21875%,32.0625% 51.75%,32.40625% 51.9375%,32.84375% 51.9375%,33.0625% 52.53125%,33.34375% 52.5625%,33.40625% 53.0625%,33.8125% 52.875%,34.125% 53.4375%,34.46875% 53.96875%,34.71875% 53.53125%,35.3125% 53.75%, 35.3125% 54%,35.65625% 53.78125%,35.71875% 54%,36.15625% 54.125%,36.5% 54.28125%, 36.5% 54.5%,36.96875% 54.5%,37.09375% 54.96875%,37.8125% 55.03125%,38.25% 55.46875%,38.6875% 55.6875%,38.9375% 55.46875%,39.4375% 55.875%,39.5% 56.25%,40.28125% 56.21875%,40.65625% 56.4375%,40.8125% 56.375%, 40.8125% 56.6875%,41.25% 56.78125%,41.53125% 57.0625%,41.75% 57.34375%,42.125% 57.1875%,42.3125% 57.34375%,42.875% 57.59375%,43.21875% 57.65625%,44.40625% 58.375%,44.875% 58.59375%,45.125% 59.21875%,45.5% 59.03125%,45.84375% 59.34375%,45.6875% 60.09375%,45.96875% 60.1875%,46.71875% 60.75%,47.3125% 60.90625%,47.8125% 60.71875%,48.09375% 60.59375%,48.46875% 60.9375%,48.28125% 61.4375%,48.1875% 61.6875%,49.59375% 62.34375%,49.875% 61.78125%,50.4375% 61.90625%,50.65625% 62.65625%,51.03125% 62.25%,51.8125% 62.59375%,52.0625% 62.5%,52.6875% 63.25%,52.3125% 63.8125%,52.53125% 64.0625%,53.0625% 63.40625%,53.65625% 63.625%,53.71875% 64.21875%,54.03125% 64.25%,54.1875% 64.71875%,54.65625% 65.28125%,54.875% 64.6875%,55.21875% 64.84375%,56.65625% 65.25%,57.375% 65.78125%,58.21875% 66.15625%,58.84375% 66.625%,61.625% 66.4375%,61.96875% 66.4375%,62.09375% 66.96875%,62.65625% 67.15625%,62.96875% 66.90625%,63.21875% 67.59375%,63.84375% 67.125%,64.5% 67.25%,64.4375% 67.78125%,65.1875% 67.125%,65.625% 67.8125%, 65.625% 68.1875%,66% 68.53125%,66.75% 69.15625%,67.4375% 70.15625%,67.71875% 69.9375%,68.625% 70.78125%, 68.625% 70.78125%,70% 72.03125%,70.53125% 71.78125%,71.40625% 71.796875%,72.734375% 70.796875%,75.109375% 68.90625%,75.359375% 68.53125%,75.390625% 68.078125%,75.546875% 67.640625%,75.6875% 67.640625%,75.765625% 67.46875%,75.890625% 67.390625%,76.1875% 67.03125%,76.234375% 66.890625%,76.46875% 66.9375%,76.84375% 66.515625%,77% 66.375%,77.21875% 66.421875%,77.390625% 66.171875%,77.515625% 66.171875%,77.890625% 65.671875%,77.9375% 65.359375%,78.125% 65.078125%,78.25% 64.9375%,78.28125% 64.734375%,78.34375% 64.59375%,78.4375% 62.96875%,78.609375% 62.390625%,78.96875% 61.75%,79.203125% 61.265625%,79.328125% 61.21875%,79.359375% 60.78125%,79.5625% 60.59375%,79.765625% 60.453125%,80.0625% 60.359375%,80.09375% 60.5%,80.28125% 60.375%,80.65625% 60.40625%,80.765625% 60.203125%,80.953125% 60.265625%,81.046875% 59.90625%,81.203125% 59.796875%,81.390625% 59.875%,81.546875% 59.5625%,81.6875% 59.296875%,81.84375% 59.5625%,82.046875% 59.140625%,82.15625% 59.078125%,82.40625% 58.953125%,82.578125% 59.03125%,82.890625% 59%,83% 59.3125%,83.359375% 59.546875%,83.53125% 59.453125%,83.71875% 59.578125%,83.75% 60.015625%,83.8125% 60.09375%,83.96875% 59.890625%,84.203125% 59.90625%,84.359375% 60.046875%,84.640625% 59.828125%,84.890625% 59.71875%,84.984375% 59.859375%,85.296875% 59.9375%,85.482581% 60.114758%,85.79194% 60.291535%,85.957668% 59.982176%, 85.957668% 59.717011%,86.178639% 59.484991%,86.510095% 59.120389%,86.642678% 59.208778%,86.808406% 59.230875%,86.974134% 59.076195%,87.161959% 59.043049%,87.405027% 58.65635%,87.548658% 58.20336%, 87.548658% 57.82771%,87.405027% 57.529399%,87.515513% 57.275282%,87.548658% 57.010117%,87.747532% 57.308428%,87.9906% 57.286331%,88.134231% 56.999069%,88.344153% 57.076409%,88.543027% 56.866486%,88.587221% 56.490836%,88.763998% 56.314059%,88.951823% 56.468739%,89.250134% 56.645516%,89.515299% 56.468739%,89.614736% 56.214622%,89.780464% 56.291962%,89.990386% 55.938409%,90.001435% 55.463321%,90.156115% 55.198156%,90.222406% 54.8667%,90.454425% 54.667826%,90.741687% 54.480001%,90.763784% 54.082253%,90.95161% 53.828137%,91.216775% 53.717651%,91.393551% 53.684506%,91.504037% 53.408292%,91.78025% 53.319904%,91.968076% 53.463535%,92.299532% 53.419341%,92.343726% 53.098933%,92.421066% 52.911108%, 92.421066% 52.623846%,92.664134% 52.325535%,93.017687% 52.192953%,93.360192% 51.364312%,93.647454% 50.568817%,94.067299% 49.86171%,94.376658% 49.695982%,94.553435% 49.839613%,94.807551% 49.298234%,95.083765% 49.077263%,95.19425% 48.502739%,95.72458% 48.049749%,95.923454% 48.027652%,95.978697% 47.751438%,96.56427% 47.519419%,96.796289% 47.640953%,96.984114% 47.861923%,97.370813% 47.817729%,97.790658% 47.784584%,98.100017% 47.563613%,98.287843% 47.563613%,98.508813% 47.176914%,98.807124% 47.13272%,99.226969% 46.878603%,99.403745% 46.624487%,99.989318% 46.381419%,100% 100%);
  -webkit-clip-path: polygon(0 100%, 0 29.863846%,0.3125% 30.21875%,0.4375% 30.625%,0.6875% 31.125%,0.9375% 31.1875%,1.0625% 31.71875%,1.3125% 32.40625%,1.53125% 32.3125%,1.96875% 32.375%,2.21875% 32.0625%,2.59375% 32.21875%,2.53125% 32.71875%,3.15625% 33.09375%,3.71875% 33.78125%,4% 34.4375%,4.15625% 34.5%, 4.15625% 34.90625%,4.4375% 35.0625%, 4.4375% 35.4375%,4.5625% 36.5%,4.6875% 36.6875%,4.71875% 37.03125%,5.84375% 38%,6% 37.625%,6.28125% 37.65625%,6.59375% 38.1875%,6.8125% 38.71875%,15.4375% 45.5%,16.75% 46.53125%,17.5% 47.40625%,21.34375% 49.84375%,21.65625% 49.5%,21.875% 49.65625%,22.125% 49.8125%,22.5625% 49.8125%,22.75% 50.0625%,23.0625% 50.125%,23.21875% 50.28125%,23.59375% 50.28125%,23.75% 50.46875%,23.96875% 50.25%,24.21875% 50.25%,24.46875% 50.125%,25% 50.4375%,25.21875% 50.71875%,25.5625% 50.75%,25.875% 50.625%,26.5625% 50.8125%,27.34375% 50.9375%,27.5625% 50.84375%,27.8125% 50.96875%,28.34375% 50.875%,29.03125% 51.09375%,29.59375% 51.125%,30.21875% 51.3125%,30.65625% 50.96875%,30.96875% 51.9375%,31.5625% 51.8125%,31.8125% 52.21875%,32.0625% 51.75%,32.40625% 51.9375%,32.84375% 51.9375%,33.0625% 52.53125%,33.34375% 52.5625%,33.40625% 53.0625%,33.8125% 52.875%,34.125% 53.4375%,34.46875% 53.96875%,34.71875% 53.53125%,35.3125% 53.75%, 35.3125% 54%,35.65625% 53.78125%,35.71875% 54%,36.15625% 54.125%,36.5% 54.28125%, 36.5% 54.5%,36.96875% 54.5%,37.09375% 54.96875%,37.8125% 55.03125%,38.25% 55.46875%,38.6875% 55.6875%,38.9375% 55.46875%,39.4375% 55.875%,39.5% 56.25%,40.28125% 56.21875%,40.65625% 56.4375%,40.8125% 56.375%, 40.8125% 56.6875%,41.25% 56.78125%,41.53125% 57.0625%,41.75% 57.34375%,42.125% 57.1875%,42.3125% 57.34375%,42.875% 57.59375%,43.21875% 57.65625%,44.40625% 58.375%,44.875% 58.59375%,45.125% 59.21875%,45.5% 59.03125%,45.84375% 59.34375%,45.6875% 60.09375%,45.96875% 60.1875%,46.71875% 60.75%,47.3125% 60.90625%,47.8125% 60.71875%,48.09375% 60.59375%,48.46875% 60.9375%,48.28125% 61.4375%,48.1875% 61.6875%,49.59375% 62.34375%,49.875% 61.78125%,50.4375% 61.90625%,50.65625% 62.65625%,51.03125% 62.25%,51.8125% 62.59375%,52.0625% 62.5%,52.6875% 63.25%,52.3125% 63.8125%,52.53125% 64.0625%,53.0625% 63.40625%,53.65625% 63.625%,53.71875% 64.21875%,54.03125% 64.25%,54.1875% 64.71875%,54.65625% 65.28125%,54.875% 64.6875%,55.21875% 64.84375%,56.65625% 65.25%,57.375% 65.78125%,58.21875% 66.15625%,58.84375% 66.625%,61.625% 66.4375%,61.96875% 66.4375%,62.09375% 66.96875%,62.65625% 67.15625%,62.96875% 66.90625%,63.21875% 67.59375%,63.84375% 67.125%,64.5% 67.25%,64.4375% 67.78125%,65.1875% 67.125%,65.625% 67.8125%, 65.625% 68.1875%,66% 68.53125%,66.75% 69.15625%,67.4375% 70.15625%,67.71875% 69.9375%,68.625% 70.78125%, 68.625% 70.78125%,70% 72.03125%,70.53125% 71.78125%,71.40625% 71.796875%,72.734375% 70.796875%,75.109375% 68.90625%,75.359375% 68.53125%,75.390625% 68.078125%,75.546875% 67.640625%,75.6875% 67.640625%,75.765625% 67.46875%,75.890625% 67.390625%,76.1875% 67.03125%,76.234375% 66.890625%,76.46875% 66.9375%,76.84375% 66.515625%,77% 66.375%,77.21875% 66.421875%,77.390625% 66.171875%,77.515625% 66.171875%,77.890625% 65.671875%,77.9375% 65.359375%,78.125% 65.078125%,78.25% 64.9375%,78.28125% 64.734375%,78.34375% 64.59375%,78.4375% 62.96875%,78.609375% 62.390625%,78.96875% 61.75%,79.203125% 61.265625%,79.328125% 61.21875%,79.359375% 60.78125%,79.5625% 60.59375%,79.765625% 60.453125%,80.0625% 60.359375%,80.09375% 60.5%,80.28125% 60.375%,80.65625% 60.40625%,80.765625% 60.203125%,80.953125% 60.265625%,81.046875% 59.90625%,81.203125% 59.796875%,81.390625% 59.875%,81.546875% 59.5625%,81.6875% 59.296875%,81.84375% 59.5625%,82.046875% 59.140625%,82.15625% 59.078125%,82.40625% 58.953125%,82.578125% 59.03125%,82.890625% 59%,83% 59.3125%,83.359375% 59.546875%,83.53125% 59.453125%,83.71875% 59.578125%,83.75% 60.015625%,83.8125% 60.09375%,83.96875% 59.890625%,84.203125% 59.90625%,84.359375% 60.046875%,84.640625% 59.828125%,84.890625% 59.71875%,84.984375% 59.859375%,85.296875% 59.9375%,85.482581% 60.114758%,85.79194% 60.291535%,85.957668% 59.982176%, 85.957668% 59.717011%,86.178639% 59.484991%,86.510095% 59.120389%,86.642678% 59.208778%,86.808406% 59.230875%,86.974134% 59.076195%,87.161959% 59.043049%,87.405027% 58.65635%,87.548658% 58.20336%, 87.548658% 57.82771%,87.405027% 57.529399%,87.515513% 57.275282%,87.548658% 57.010117%,87.747532% 57.308428%,87.9906% 57.286331%,88.134231% 56.999069%,88.344153% 57.076409%,88.543027% 56.866486%,88.587221% 56.490836%,88.763998% 56.314059%,88.951823% 56.468739%,89.250134% 56.645516%,89.515299% 56.468739%,89.614736% 56.214622%,89.780464% 56.291962%,89.990386% 55.938409%,90.001435% 55.463321%,90.156115% 55.198156%,90.222406% 54.8667%,90.454425% 54.667826%,90.741687% 54.480001%,90.763784% 54.082253%,90.95161% 53.828137%,91.216775% 53.717651%,91.393551% 53.684506%,91.504037% 53.408292%,91.78025% 53.319904%,91.968076% 53.463535%,92.299532% 53.419341%,92.343726% 53.098933%,92.421066% 52.911108%, 92.421066% 52.623846%,92.664134% 52.325535%,93.017687% 52.192953%,93.360192% 51.364312%,93.647454% 50.568817%,94.067299% 49.86171%,94.376658% 49.695982%,94.553435% 49.839613%,94.807551% 49.298234%,95.083765% 49.077263%,95.19425% 48.502739%,95.72458% 48.049749%,95.923454% 48.027652%,95.978697% 47.751438%,96.56427% 47.519419%,96.796289% 47.640953%,96.984114% 47.861923%,97.370813% 47.817729%,97.790658% 47.784584%,98.100017% 47.563613%,98.287843% 47.563613%,98.508813% 47.176914%,98.807124% 47.13272%,99.226969% 46.878603%,99.403745% 46.624487%,99.989318% 46.381419%,100% 100%);
}
.image2 {
  opacity: var(--opacity);
  transform: scale(var(--scale));
  -moz-transform:  none;
}
.top-title {
  color: white;
  font-size: 12vmax;
  letter-spacing: 0.5vmax;
  position: absolute;
  top: calc(40% - 6vmax);
  text-align: center;
  transform: translateY(var(--moveY)) scale(var(--scale));
  width: 100%;
}
@media (max-width: 677px) {
  .top-title {
    font-size: 7vmax;
  }
}
.bottom {
  color: white;
  height: 100vh;
}
.bottom-title {
  box-sizing: border-box;
  font-size: 40px;
  padding-top: 70px;
  text-align: center;
  width: 100%;
}
.bottom-body {
  box-sizing: border-box;
  font-size: 18px;
  line-height: 24px;
  font-weight: 400;
  max-width: 800px;
  margin: 0 auto;
  padding: 50px 40px 0;
  text-align: center;
  width: 100%;
}
@media (max-width: 677px) {
  .bottom-body {
    font-size: 16px;
    line-height: 22px;
    padding: 30px 20px 0;
  }
}
</style>
</head>
<body>

<div class="container">
  <div class="top">
    <div class="upper section"><img class="image image2" src="marc-steenbeke-664660-unsplash.jpg" alt=""></div>
    <div class="mid section"><div class="top-title">MOUNTAINS</div>
    </div>
    <div class="lower section"><img class="image image1" src="marc-steenbeke-664660-unsplash.jpg" alt=""></div>
  </div>
  <div class="bottom">
    <div class="bottom-title">Night on the mountain</div>
    <div class="bottom-body">
      The fog has risen from the sea and crowned<br>
      The dark, untrodden summits of the coast,<br>
      Where roams a voice, in canyons uttermost,<br>
      From midnight waters vibrant and profound.<br>
      High on each granite altar dies the sound,<br>
      Deep as the trampling of an armored host,<br>
      Lone as the lamentation of a ghost,<br>
      Sad as the diapason of the drowned.<br>
      <br>
      The mountain seems no more a soulless thing,<br>
      But rather as a shape of ancient fear,<br>
      In darkness and the winds of Chaos born<br>
      Amid the lordless heavens’ thundering–<br>
      A Presence crouched, enormous and austere,<br>
      Before whose feet the mighty waters mourn.</div>
  </div>
</div>
</body>
</html>