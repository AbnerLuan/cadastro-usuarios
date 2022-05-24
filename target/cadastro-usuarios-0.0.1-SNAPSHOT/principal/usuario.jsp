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
								<h2>Cadastro de Usuário</h2>
								<div class="row">
									<div class="col-sm-12">
										<div class="card">
											<div class="card-block">
												<h4 class="sub-title">Dados básicos</h4>

												<form class="needs-validation" novalidate
													enctype="multipart/form-data"
													action="<%=request.getContextPath()%>/ServletUsuarioController"
													method="post" id="formUser">

													<div class="form-row">

														<div class="form-group form-default input-group mb-4">
															<div class="input-group-prepend">
																<c:if
																	test="${modolLogin.fotouser != '' && modolLogin.fotouser != null}">
																	<a
																		href="<%=request.getContextPath()%>/ServletUsuarioController?acao=downloadFoto&id=${modolLogin.id}">
																		<img alt="Imagem User" id="fotoembase64"
																		src="${modolLogin.fotouser}" width="70px">
																	</a>
																</c:if>
																<c:if
																	test="${modolLogin.fotouser == '' || modolLogin.fotouser == null}">
																	<img alt="Imagem User" id="fotoembase64"
																		src="assets/images/faq_man.png" width="70px">
																</c:if>
															</div>

															<input type="file" id="fileFoto" name="fileFoto"
																accept="image/*"
																onchange="visualizarImg('fotoembase64', 'fileFoto');"
																class="form-control-file"
																style="margin-left: 5px; margin-top: 10px;">
														</div>


														<div class="col-md-1 mb-3">
															<label for="validationTooltip01">Seu ID é:</label> <input
																type="text" name="id" id="id" class="form-control"
																readonly="readonly" value="${modolLogin.id}">
															<div class="valid-tooltip"></div>
														</div>

														<div class="col-md-4 mb-3">
															<label class="float-label">Nome Completo:</label> <input
																type="text" name="nome" id="nome" class="form-control"
																required="required" value="${modolLogin.nome}">
															<span class="form-bar"></span>
														</div>

														<div class="col-md-1 mb-3">
															<label for="validationTooltip01">D. Nasc:</label> <input
																type="text" name="dataNascimento" autocomplete="off"
																id="dataNascimento" class="form-control"
																required="required" value="${modolLogin.datanascimento}">
														</div>

														<div class="col-md-4 mb-3">
															<label class="float-label">Informe seu melhor
																e-mail:</label> <input type="email" name="email" id="email"
																class="form-control" required="required"
																autocomplete="off" value="${modolLogin.email}">
														</div>
													</div>

													<div class="form-row">

														<div class="col-md-2 mb-3">
															<label for="exampleInputEmail1">Informe sua
																renda:</label> <input type="text" name="rendamensal"
																id="rendamensal" class="form-control"
																required="required" value="${modolLogin.rendamensal}">
														</div>

														<div class="col-md-4 mb-3">
															<label for="exampleInputEmail1">Escolha um Login:</label>
															<input type="text" name="login" id="login"
																class="form-control" required="required"
																value="${modolLogin.login}">
														</div>

														<div class="col-md-4 mb-4">
															<label for="inputPassword5">Escolha uma Senha:</label> <input
																type="password" name="senha" id="senha"
																class="form-control" required="required"
																autocomplete="off" value="${modolLogin.senha}">
														</div>
													</div>

													<div class="form-row">

														<div class="col-md-1 mb-4">
															<label for="validationTooltip05">CEP:</label> <input
																onblur="pesquisaCep();" name="cep" data-mask="00000-000"
																id="cep" class="form-control" required="required"
																autocomplete="off" value="${modolLogin.cep}">
														</div>

														<div class="col-md-6 mb-4">
															<label for="validationTooltip03">Logradouro:</label> <input
																type="text" name="logradouro" id="logradouro"
																class="form-control" required="required"
																autocomplete="off" value="${modolLogin.logradouro}">
														</div>

														<div class="col-md-3 mb-4">
															<label for="validationTooltip04">Bairro</label> <input
																type="text" name="bairro" id="bairro"
																class="form-control" required="required"
																autocomplete="off" value="${modolLogin.bairro}">
														</div>

														<div class="col-md-3 mb-4">
															<label for="validationTooltip04">Localidade</label> <input
																type="text" name="localidade" id="localidade"
																class="form-control" required="required"
																autocomplete="off" value="${modolLogin.localidade}">
														</div>

														<div class="col-md-1 mb-4">
															<label for="validationTooltip04">UF</label> <input
																type="text" name="uf" id="uf" class="form-control"
																required="required" autocomplete="off"
																value="${modolLogin.uf}">
														</div>

														<div class="col-md-1 mb-4">
															<label for="validationTooltip04">Número:</label> <input
																type="text" name="numero" id="numero"
																class="form-control" required autocomplete="off"
																value="${modolLogin.numero}">
														</div>

													</div>

													<div>
														<button
															class="btn waves-effect waves-light hor-grd btn-grd-success"
															id="btncadastrar">Cadastrar</button>

														<button type="button"
															class="btn waves-effect waves-light hor-grd btn-grd-danger"
															onclick="criarDeleteComAjax();">Excluir dados</button>

														<button type="button"
															class="btn waves-effect waves-light hor-grd btn-grd-info"
															onclick="limparForm();">Limpar dados</button>

														<button type="button"
															class="btn waves-effect waves-light hor-grd btn-grd-inverse"
															data-toggle="modal" data-target="#exampleModal">Pesquisar</button>

														<c:if test="${modolLogin.id > 0}">
															<a
																href="<%= request.getContextPath()%>/ServletTelefone?iduser=${modolLogin.id}"
																class="btn waves-effect waves-light hor-grd btn-grd-primary">Ver
																Telefone</a>
														</c:if>
													</div>

												</form>
											</div>
										</div>
									</div>
								</div>

								<span id="msg">${msg}</span>

								<div style="height: 300px; overflow: scroll;">
									<table class="table" id="tabelaresultadosview">
										<thead>
											<tr>
												<th style="font-weight: bold;" scope="col">ID</th>
												<th style="font-weight: bold;" scope="col">Nome
													Completo</th>
												<th style="font-weight: bold;" scope="col">E-mail</th>
												<th style="font-weight: bold;" scope="col">Login</th>
												<th style="font-weight: bold;" scope="col">UF</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${modelLogins}' var='ml'>
												<tr>
													<td><c:out value="${ml.id}"></c:out></td>
													<td><c:out value="${ml.nome}"></c:out></td>
													<td><c:out value="${ml.email}"></c:out></td>
													<td><c:out value="${ml.login}"></c:out></td>
													<td><c:out value="${ml.uf}"></c:out></td>
													<td><a
														class="btn waves-effect waves-light hor-grd btn-grd-inverse"
														href="<%= request.getContextPath()%>/ServletUsuarioController?acao=buscarEditar&id=${ml.id}">Ver</a></td>
													<td><a
														href="<%= request.getContextPath()%>/ServletUsuarioController?acao=deletar&id=${ml.id}"
														class="btn waves-effect waves-light hor-grd btn-grd-danger">Excluir</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<%
										int totalPagina = (int) request.getAttribute("totalPagina");
										for (int p = 0; p < totalPagina; p++) {
											String url = request.getContextPath() + "/ServletUsuarioController?acao=paginar&pagina=" + (p * 5);
											out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "\">" + (p + 1) + "</a></li>");
										}
										%>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="javascriptfile.jsp"></jsp:include>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						Usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							aria-label="Nome" aria-describedby="basic-addon2" id="nomeBusca">
						<div class="input-group-append">
							<button
								class="btn waves-effect waves-light hor-grd btn-grd-inverse"
								type="button" ONCLICK="buscarUsuario();">Pesquisar</button>
						</div>
					</div>

					<div style="height: 300px; overflow: scroll;">
						<table class="table" id="tabelaresultados">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">NOME</th>
									<th scope="col">VER</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>

					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center"
							id="ulPaginacaoUserAjax">
						</ul>
					</nav>

					<span id="totalResultados"></span>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#rendamensal").maskMoney({
			showSymbol : true,
			symbol : "R$",
			decimal : ",",
			thousands : "."
		});

		const formatter = new Intl.NumberFormat('pt-BR', {
			currency : 'BRL',
			minimumFractionDigits : 2
		});

		$("#rendamensal").val(formatter.format($("#rendamensal").val()));
		$("#rendamensal").focus();

		var dataNascimento = $("#dataNascimento").val();

		if (dataNascimento != null && dataNascimento != '') {

			var dateFormat = new Date(dataNascimento);
			$("#dataNascimento").val(dateFormat.toLocaleDateString('pt-BR', {
				timeZone : 'UTC'
			}));
		}

		$("#nome").focus();

		$(function() {

			$("#dataNascimento")
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

		$("#numero, #cep").keypress(function(event) {
			return /\d/.test(String.fromCharCode(event.keyCode));
		});

		function pesquisaCep() {
			var cep = $("#cep").val();

			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {

							$("#logradouro").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#localidade").val(dados.localidade);
							$("#uf").val(dados.uf);
						}
					});
		}

		function visualizarImg(fotoembase64, fileFoto) {

			var preview = document.getElementById(fotoembase64); //campo img html
			var fileUser = document.getElementById(fileFoto).files[0];
			var reader = new FileReader();

			reader.onloadend = function() {
				preview.src = reader.result; //carrega a foto na tela
			};

			if (fileUser) {
				reader.readAsDataURL(fileUser); // preview da imagem
			} else {
				preview.src = '';
			}
		}

		function verEditar(id) {
			var urlAction = document.getElementById('formUser').action;
			window.location.href = urlAction + '?acao=buscarEditar&id=' + id;
		}

		function buscaUserPagAjax(url) {

			var urlAction = document.getElementById('formUser').action;
			var nomeBusca = document.getElementById('nomeBusca').value;

			$
					.ajax(
							{
								method : "get",
								url : urlAction,
								data : url,
								success : function(response, textStatus, xhr) {

									var json = JSON.parse(response);

									$('#tabelaresultados > tbody > tr')
											.remove();
									$("#ulPaginacaoUserAjax > li").remove();

									for (var p = 0; p < json.length; p++) {
										$('#tabelaresultados > tbody')
												.append(
														'<tr> <td>'
																+ json[p].id
																+ '</td> <td> '
																+ json[p].nome
																+ '</td> <td><button onclick="verEditar('
																+ json[p].id
																+ ')" type="button" class="btn waves-effect waves-light hor-grd btn-grd-inverse">Ver</button></td></tr>');
									}

									document.getElementById('totalResultados').textContent = 'Resultados: '
											+ json.length;

									var totalPagina = xhr
											.getResponseHeader("totalPagina");

									for (var p = 0; p < totalPagina; p++) {

										var url = 'nomeBusca='
												+ nomeBusca
												+ '&acao=buscarUserAjaxPage&pagina='
												+ (p * 5);

										$("#ulPaginacaoUserAjax")
												.append(
														'<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPagAjax(\''
																+ url
																+ '\')">'
																+ (p + 1)
																+ '</a></li>');

									}

								}

							}).fail(
							function(xhr, status, errorThrown) {
								alert('Erro ao buscar usuário por nome: '
										+ xhr.responseText);
							});

		}

		function buscarUsuario() {

			var nomeBusca = document.getElementById('nomeBusca').value;

			if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') { /*Validando que tem que ter valor pra buscar no banco*/

				var urlAction = document.getElementById('formUser').action;

				$
						.ajax(
								{

									method : "get",
									url : urlAction,
									data : "nomeBusca=" + nomeBusca
											+ '&acao=buscarUserAjax',
									success : function(response, textStatus,
											xhr) {

										var json = JSON.parse(response);

										$('#tabelaresultados > tbody > tr')
												.remove();
										$("#ulPaginacaoUserAjax > li").remove();

										for (var p = 0; p < json.length; p++) {
											$('#tabelaresultados > tbody')
													.append(
															'<tr> <td>'
																	+ json[p].id
																	+ '</td> <td> '
																	+ json[p].nome
																	+ '</td> <td><button onclick="verEditar('
																	+ json[p].id
																	+ ')" type="button" class="btn waves-effect waves-light hor-grd btn-grd-inverse">Ver</button></td></tr>');
										}

										document
												.getElementById('totalResultados').textContent = 'Resultados: '
												+ json.length;

										var totalPagina = xhr
												.getResponseHeader("totalPagina");

										for (var p = 0; p < totalPagina; p++) {

											var url = 'nomeBusca='
													+ nomeBusca
													+ '&acao=buscarUserAjaxPage&pagina='
													+ (p * 5);

											$("#ulPaginacaoUserAjax")
													.append(
															'<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPagAjax(\''
																	+ url
																	+ '\')">'
																	+ (p + 1)
																	+ '</a></li>');
										}
									}

								}).fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao buscar usuário por nome: '
											+ xhr.responseText);
								});
			}
		}

		function criarDeleteComAjax() {
			if (confirm('Deseja realmente excluir os dados?')) {

				var urlAction = document.getElementById('formUser').action;
				var idUser = document.getElementById('id').value;

				$.ajax({

					method : "get",
					url : urlAction,
					data : "id=" + idUser + '&acao=deletarajax',
					success : function(response) {
						limparForm();
						document.getElementById('msg').textContent = response;
					}

				}).fail(
						function(xhr, status, errorThrown) {
							alert('Erro ao deletar usuario por id:'
									+ xhr.responseText);
						});
			}
		}

		function criarDelete() {

			if (confirm('Deseja realmente excluir os dados?')) {
				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'deletar';
				document.getElementById("formUser").submit();
			}
		}

		function limparForm() {
			var elementos = document.getElementById("formUser").elements;
			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';

			}
		}

		$("#btncadastrar").click(function(event) {

			var form = $("#formUser")

			if (form[0].checkValidity() === false) {
				event.preventDefault()
				event.stopPropagation()
			}

			form.addClass('was-validated');

		});
	</script>

</body>

</html>
