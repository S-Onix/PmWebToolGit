function go_delete() {
	var count = 0;
	if (document.formm.bseq.length == undefined) {
		if (document.formm.bseq.checked == true) {
			count++;
		}
	}
	for (var i = 0; i < document.formm.bseq.length; i++) {
		if (document.formm.bseq[i].checked == true) {
			count++;
		}
	}
	if (count == 0) {
		alert("삭제할 항목을 선택하세요")
	} else {
		document.formm.action = "PmServlet?command=board_delete";
		document.formm.submit();
	}
}