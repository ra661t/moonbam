<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȭ�ε��� ��</title>
</head>
<body>
<h1>chatRoom_miji_test</h1>
<form action="/acorn/Chatmore" method="get">
<input type="hidden" name="chatNum" value="${ChatRoomDTO.chatNum }">
<button >������</button>
</form>
ä�ù�Num => ${ChatRoomDTO.chatNum }
ä�ù�LeaderId => ${ChatRoomDTO.leaderId }

<!--  -->
</body>
</html>