<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<title>jQuery Ajax메소드 - $.post()</title>
<style type="text/css">
#result {
	width: 200px;
	height: 200px;
	border: 5px double #6699FF;
}
</style>
<script src="../js/jquery-1.11.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#b1").click(function() {
			$.post("process1.jsp", {
				name : "sangwon",
				stus : "존잘"
			}, function(data, status) {
				if (status = "success")
					$("#result").html(data);

			});

		});

	});
</script>
<head>

<title>Insert title here</title>
</head>
<body>

	<button id="b1">결과</button>
	<div id="result">누르면 결과가 뜬다.</div>

</body>
</html>