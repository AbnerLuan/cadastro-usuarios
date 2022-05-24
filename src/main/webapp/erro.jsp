<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tela de erros</title>

</head>
<body>
	<div>
		<a class="btn waves-effect waves-light hor-grd btn-grd-inverse" href="<%=request.getContextPath()%>/index.jsp">Voltar</a>
	</div>
	<h1>
		Infelizmente algo deu errado! <br> entre em contato com a equipe
		de suporte e informe o código abaixo:
	</h1>
	<textarea rows="50" cols="100">${msg}</textarea>
</body>
</html>