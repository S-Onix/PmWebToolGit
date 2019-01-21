<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function clickPopup(){
    var modal = document.getElementById("headerWrap");
    var btn = document.getElementById("btnWrap");
    modal.style.display="block";
    btn.style.marginTop="140";
}
window.onclick = function(event) {
    var wrap = document.getElementById('wrap');
    var modal = document.getElementById("headerWrap");
    var bnt = document.getElementById("btnWrap");
    if(event.target == wrap) {
        modal.style.display = "none";
        bnt.style.marginTop="0";
    }
}
</script>
<style type="text/css">

 html,body{
  height:100%
}
body{
  display:table;
  width:100%
}
#wrap {
   position:absolute;
   width: 100%;
   height: 100%;
}
#btnWrap{
    position: relative;
}
.contentWrap{
   display: none;
   border: 1px solid black;
   margin-top: 10px;
   width: 200px;
}
</style>

</head>
<body>
    <div id="wrap">
        <div id="headerWrap" class="contentWrap">
          <ul>
             <li>프로필</li>
             <li>click1</li>
             <li>click2</li>
             <li id="content">click3</li>
          </ul>
       </div>
       <div id="popupWrap" class="contentWrap">
          <ul>
             <li>삭제</li>
             <li>click1</li>
             <li>click2</li>
             <li>click2</li>
             <li id="content">click3</li>
          </ul>
       </div>
    </div>
   <div id="btnWrap">
      <button id="profilePopup" onclick="clickPopup()">프로필사진</button>
   </div>
</body>
</html>