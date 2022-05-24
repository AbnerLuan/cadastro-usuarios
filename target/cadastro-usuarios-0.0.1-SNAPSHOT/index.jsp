<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilo.css"
	type="text/css">
	
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Cadastro Usuarios</title>
</head>
<body>
	<div class="container">
		<div class="content">
			<!--FORMULÁRIO DE LOGIN-->
			<div id="div-login">
				<form action="<%=request.getContextPath()%>/ServletLogin"
					method="post">
					<input type="hidden" value="<%=request.getParameter("url")%>"
						name="url">
					<h1>Login</h1>
					<p>
						<label for="login">Seu Login</label> <input id="login"
							name="login" required="required" type="text"
							placeholder="Informe aqui seu login de acesso." />
					</p>

					<p>
						<label for="senha">Sua Senha</label> <input id="senha"
							name="senha" required="required" type="password"
							placeholder="Informe aqui sua senha cadastrada." />
					</p>

					<p>
						<input type="checkbox" name="manterlogado" id="manterlogado"
							value="" /> <label for="manterlogado">Manter-me logado</label>
					</p>

					<p>
						<input type="submit" value="Logar" />
					</p>
					<h4>Não possui cadastro? <a href="<%=request.getContextPath()%>/index.jsp">Clique aqui e solicite!</a></h4>
				</form>

			</div>
		</div>
	</div>

</body>
</html>