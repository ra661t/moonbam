<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȭ�ε��� ��</title>
</head>
<body>
	<form id="reportForm" action="chatReport" method="post">
		<input type="button" onclick="newLeader('newLeader')" value="��������"> 
		<input type="button" onclick="newLeader('newLeader')" value="��������"> 
		<input type="button" onclick="memberRemove('memberRemove')" value="�����ϱ�">
	</form>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
	function newLeader(path) {
		 $.ajax({
             type: "POST",
             url: path,
			//���� ������ ���� �ʿ�
             data: formData,
             success: function(response) {

                 // ������ �����ϸ� ���� â�� ����
                 window.close();
             },
             error: function(xhr, status, error) {
                 // ���� ���� ó��
                 console.error(xhr.responseText);
             }
         });
	}
	   
</script>
</body>
</html>