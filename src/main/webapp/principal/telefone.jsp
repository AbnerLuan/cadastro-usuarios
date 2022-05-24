<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<jsp:include page="head.jsp"></jsp:include>
<body>
	<jsp:include page="theme-loader.jsp"></jsp:include>
	<div id="pcoded" class="pcoded">
		<div class="pcoded-container navbar-wrapper">
			<jsp:include page="navbar.jsp"></jsp:include>
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<jsp:include page="navbarmainmenu.jsp"></jsp:include>
					<div class="pcoded-content">
						<jsp:include page="page-header.jsp"></jsp:include>
						<div class="pcoded-inner-content">
							<div class="main-body">
								<h3>Cadastro de Telefones</h3>

								<form class="needs-validation" novalidate
									action="<%=request.getContextPath()%>/ServletTelefone"
									method="post" id="formFone">

									<div class="form-row">

										<div class="col-md-1 mb-3">
											<label for="validationTooltip01">ID do usuário:</label> <input
												type="text" name="id" id="id" class="form-control"
												readonly="readonly" value="${modelLogin.id}">
											<div class="valid-tooltip"></div>
										</div>

										<div class="col-md-2 mb-3">
											<label for="validationTooltip01">Nome do usuário:</label> <input
												type="text" name="nome" id="nome" class="form-control"
												readonly="readonly" value="${modelLogin.nome}">
											<div class="valid-tooltip"></div>
										</div>

										<div class="col-md-2 mb-3">
											<label for="validationTooltip01">Digite o número:</label> <input
												type="text" data-mask="(00) 00000-0000" name="numero"
												id="numero" class="form-control">
											<div class="valid-tooltip"></div>
										</div>

									</div>
									<button
										class="btn waves-effect waves-light hor-grd btn-grd-success">Cadastrar
										Telefone</button>

								</form>

								<span id="msg">${msg}</span>

								<div style="height: 600px; overflow: scroll;">
									<table class="table" id="tabelaresultadosview">
										<thead>
											<tr>
												<th style="font-weight: bold;" scope="col">ID</th>
												<th style="font-weight: bold;" scope="col">Número</th>
												<th style="font-weight: bold;" scope="col">Excluir</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${modelTelefones}' var='f'>
												<tr>
													<td><c:out value="${f.id}"></c:out></td>
													<td><c:out value="${f.numero}"></c:out></td>
													<td><a
														href="<%= request.getContextPath()%>/ServletTelefone?acao=excluir&id=${f.id}&userpai=${modelLogin.id}"
														class="btn waves-effect waves-light hor-grd btn-grd-danger">Excluir</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="javascriptfile.jsp"></jsp:include>

	<script type="text/javascript">
		$("#numero").keypress(function(event) {
			return /\d/.test(String.fromCharCode(event.keyCode));
		});
	</script>
</body>

</html>
