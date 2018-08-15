$(document).ready(function(){
	//[글쓰기] 
	//main.jsp의 main_board영역에 writeForm.jsp표시
	$("#new").click(function(){
		$("#main_board").load("writeForm.jsp");
	});  
});

//[글수정]
//main.jsp의 main_board영역에 글수정폼 표시
function edit(editBtn){
	
	var rStr = editBtn.name;
	  
		var query = "updateForm.jsp?num="+rStr;
	
	$("#main_board").load(query);
}
function del(delBtn){
	var rStr = delBtn.name;

	var query = "deleteForm.jsp?num="+rStr;
	
	$("#main_board").load(query);
}

function reply(replyBtn){
	var rStr = replyBtn.name;
	var arr = rStr.split(",");
	//댓글쓰기에 필요한 정보를 갖고 writeForm.jsp 페이지 로드
	var query = "writeForm.jsp?num="+arr[0]+"&ref="+arr[1];
	query += "&re_step="+arr[2]+"&re_level="+arr[3];
	$("#main_board").load(query);
}

