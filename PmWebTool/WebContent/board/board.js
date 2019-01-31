function go_qna_delete() {
	var count = 0;
	if (document.formm.qseq.length == undefined) {
		if (document.formm.qseq.checked == true) {
			count++;
		}
	}
	for (var i = 0; i < document.formm.qseq.length; i++) {
		if (document.formm.qseq[i].checked == true) {
			count++;
		}
	}
	if (count == 0) {
		alert("삭제할 항목을 선태하세요")
	} else {
		document.formm.action = "NonageServlet?command=qna_delete";
		document.formm.submit();
	}
}