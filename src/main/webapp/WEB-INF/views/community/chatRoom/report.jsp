<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȭ�ε��� ��</title>
</head>
<link href="https://fastly.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
crossorigin="anonymous">
<style type="text/css">

</style>
<body>
	<div align="center" style="margin: 20%">
	�� ��ȭ�� �Ű��մϴ�.
	<br>
	<button onclick="fnReport()" class="btn" style="background-color: #ff416c; color:white; margin-left: auto;">�Ű�</button>
	<button onclick="cancelReport()" class="btn" style="background-color: #ffb2c4; color:white; margin-left: auto;">���</button>
	</div>	

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>


	var child; //�ڽ��˾�â ���� ����
	
	//ȸ�� �Ű��ϱ� ������ �� �۵��Ǵ� fn
	function fnReport() {

		const userId = JSON.parse(localStorage.getItem('userId'));
		const chatNum = JSON.parse(localStorage.getItem('chatNum'));
		//console.log(":::",userId,":::",chatNum,":::",message);
		
		var openUrl = "/acorn/Chatmore/ChatmoreReport?userId="+userId+"&chatNum="+chatNum
		
		childOpen(openUrl);
		window.close(); ///
		
	}
	
	//button��ɿ� �˾����� �ڽ�â ���� openUrl ������ controller �ּ� �޸� ��
	function childOpen(openUrl){
		//���� â(�ڽ� â)�� �ʺ�� ����
		var width = 100;
		var height = 200;
		//���� â(�ڽ� â)�� ������ ��ġ
		var left = Math.ceil(( window.screen.width - width )/2);
        var top = Math.ceil(( window.screen.height - height )/2);
		
		child = open(openUrl,"childName","width"+width+", height"+height+", left"+left+", top"+top);
	}
	
	
	// ����ϱ� - â �ݱ�   
	function cancelReport() {
           window.close();
       }

	   
</script>
</body>
</html>