function clickPopup() {
	var modal = document.getElementById("headerWrap");
	modal.style.display = "block";
}

function noneModal() {
	var modal = document.getElementById("headerWrap");
	var focusModal = document.getElementById("profilePopup");
	if (focusModal != document.activeElement) {
		modal.style.display = 'none';
	}
}

/*function clickPopup() {
	var modal = document.getElementById("headerWrap");
	var btn = document.getElementById("btnWrap");
	modal.style.display = "block";
	btn.style.marginTop = "140";
}
window.onclick = function(event) {
	var wrap = document.getElementById('wrap');
	var modal = document.getElementById("headerWrap");
	var bnt = document.getElementById("btnWrap");
	if (event.target == wrap) {
		modal.style.display = "none";
		bnt.style.marginTop = "0";
	}
}*/