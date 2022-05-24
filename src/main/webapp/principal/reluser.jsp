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

								<h3>Relatório de Usuários</h3>

								<form
									action="<%=request.getContextPath()%>/ServletUsuarioController"
									method="get" id="formUser">
									<input type="hidden" id="acaoRelatorioImprimirTipo" name="acao"
										value="imprimirRelatorioUser">

									<div class="form-row align-items-center">
										<div class="col-auto">
											<label class="sr-only" for="dataInicial">Data Inicial</label>
											<input placeholder="Data Inicial" value="${dataInicial}"
												autocomplete="off" type="text" class="form-control mb-2"
												id="dataInicial" name="dataInicial">
										</div>

										<div class="col-auto">
											<label class="sr-only" for="dataFinal">Data Final</label> <input
												placeholder="Data Final" value="${dataFinal}"
												autocomplete="off" type="text" class="form-control mb-2"
												id="dataFinal" name="dataFinal">
										</div>

										<div class="col-auto my-2">
											<button type="button" onclick="imprimirHtml();"
												class="btn waves-effect waves-light hor-grd btn-grd-inverse">Exibir
												Relatório</button>

											<button type="button" onclick="imprimirPdf();"
												class="btn waves-effect waves-light hor-grd btn-grd-inverse">Imprimir
												PDF</button>

										</div>
									</div>
								</form>

								<div style="height: 700px; overflow: scroll;">
									<table class="table" id="tabelaresultadosview">
										<thead>
											<tr>
												<th style="font-weight: bold;" scope="col">ID</th>
												<th style="font-weight: bold;" scope="col">Nome
													Completo</th>
												<th style="font-weight: bold;" scope="col">Telefone(s)</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items='${listaUser}' var='ml'>
												<tr>
													<td><c:out value="${ml.id}"></c:out></td>
													<td><c:out value="${ml.nome}"></c:out></td>
													<c:forEach items="${ml.telefones}" var="fone">
														<td
															style="font-size: 10x; font-style: italic; color: blue"><c:out
																value="${fone.numero}"></c:out></td>
													</c:forEach>
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

	<script>
		function imprimirPdf() {
			document.getElementById("acaoRelatorioImprimirTipo").value = 'imprimirRelatorioPDF'
			$("#formUser").submit();
			return false;

		}

		function imprimirHtml() {

			document.getElementById("acaoRelatorioImprimirTipo").value = 'imprimirRelatorioUser'
			$("#formUser").submit();

		}

		$(function() {

			$("#dataInicial")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});

		$(function() {

			$("#dataFinal")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});
	</script>

</body>

</html>
