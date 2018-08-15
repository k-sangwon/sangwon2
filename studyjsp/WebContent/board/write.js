var wStatus = true;

$(document).ready(function(){
	
   
    $("#regist").click(function(){
    	formCheckIt();
    	if(wStatus){
  		      	
    		 var pageNum = $("#regist").val();
  		  var query = {subject:$("#subject").val(),
  				       content:$("#content").val(),
  				       passwd:$("#passwd").val(),
  				       ref:$("#ref").val(),
  				       re_step:$("#re_step").val(),
  				       re_level:$("#re_level").val(),
  				       num:$("#num").val()};
  		  
  		
  		  $.ajax({
  		     type: "POST",
  		     url: "writePro.jsp",
  		     data: query,
  		     success: function(data){
  		    	 if(data == 1){
  		    		 alert("글이 등록되었습니다.");
  		    		 var query = "list.jsp?pageNum="+pageNum;
  		    		 $("#main_board").load(query);
  		         }
  		     }
  		  });
  		}
	});
    $("#cancle").click(function(){
    	var pageNum = $("#cancle").val();
    	var query = "list.jsp?pageNum="+pageNum;
  		$("#main_board").load(query);
	});
       
});
//글쓰기 폼의 입력값 유무 확인
function formCheckIt(){
	wStatus = true;
	if(!$.trim($("#subject").val())){
		alert("제목을 입력하세요.");
		$("#subject").focus();
		wStatus = false;
		return false;
	}
	
	if(!$.trim($("#content").val())){
		alert("내용을 입력하세요.");
		$("#content").focus();
		wStatus = false;
		return false;
	}
	
	if(!$.trim($("#passwd").val())){
		alert("비밀번호를 입력하세요.");
		$("#passwd").focus();
		wStatus = false;
		return false;
	}
}
