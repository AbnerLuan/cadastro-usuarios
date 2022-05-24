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

								<h3>Gráfico de Salários</h3>

								<form
									action="<%=request.getContextPath()%>/ServletUsuarioController"
									method="get" id="formUser">
									<input type="hidden" id="acaoRelatorioImprimirTipo" name="acao"
										value="imprimirRelatorioUser">

									<div class="form-row align-items-center">
										<div class="col-auto">
											<label class="sr-only" for="dataInicial">Data Inicial</label>
											<input value="${dataInicial}" autocomplete="off" type="text"
												class="form-control mb-2" id="dataInicial"
												name="dataInicial">
										</div>

										<div class="col-auto">
											<label class="sr-only" for="dataFinal">Data Final</label> <input
												value="${dataFinal}" autocomplete="off" type="text"
												class="form-control mb-2" id="dataFinal" name="dataFinal">
										</div>

										<button type="button" onclick="gerarGrafico();"
											class="btn waves-effect waves-light hor-grd btn-grd-inverse">Gerar
											Gráfico</button>
									</div>

								</form>

								<div class="chart-container"
									style="position: relative; height: 20vh; width: 40vw">
									<canvas id="chart"></canvas>
									<canvas id="myChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="javascriptfile.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script type="text/javascript">
		var myChart = new Chart(document.getElementById('myChart'));

		function gerarGrafico() {

			var urlAction = document.getElementById('formUser').action;
			var dataInicial = document.getElementById('dataInicial').value;
			var dataFinal = document.getElementById('dataFinal').value;

			$
					.ajax(
							{

								method : "get",
								url : urlAction,
								data : "dataInicial=" + dataInicial
										+ '&dataFinal=' + dataFinal
										+ '&acao=graficoSalario',
								success : function(response) {

									var json = JSON.parse(response);

									myChart.destroy();

									myChart = new Chart(
											document.getElementById('myChart'),
											{
												type : 'line',
												data : {
													labels : json.ufs,
													datasets : [ {
														label : 'Gráfico Média Salarial por Estado',
														backgroundColor : 'rgb(255, 99, 132)',
														borderColor : 'rgb(255, 99, 132)',
														data : json.salarios,
													} ]
												},
												options : {}
											}

									);

								}

							}).fail(
							function(xhr, status, errorThrown) {
								alert('Erro ao buscar dados para o grafico '
										+ xhr.responseText);
							});

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
