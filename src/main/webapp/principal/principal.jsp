<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								<h1>Principais Recursos</h1>
								<div class="row">
									<div class="col-xl-3 col-md-6">
										<div class="card">
											<div class="card-block">
												<div class="row align-items-center">
													<div class="col-8">
														<h4 class="text-c-purple">R$ $$.$$$,$$</h4>
														<h6 class="text-muted m-b-0">Média Salarial por
															estado</h6>
													</div>
													<div class="col-4 text-right">
														<a
															href="<%=request.getContextPath()%>/principal/relusergrafico.jsp"><i
															class="fa fa-bar-chart f-28"></i></a>
													</div>
												</div>
											</div>
											<div class="card-footer bg-c-purple">
												<div class="row align-items-center">
													<div class="col-9">
														<a href="<%=request.getContextPath()%>/principal/relusergrafico.jsp">
															<span class="text-white m-b-0">Visualize</span>
														</a>

													</div>
													<div class="col-3 text-right">
														<a
															href="<%=request.getContextPath()%>/principal/relusergrafico.jsp"><i
															class="fa fa-line-chart text-white f-16"></i></a>
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="col-xl-3 col-md-6">
										<div class="card">
											<div class="card-block">
												<div class="row align-items-center">
													<div class="col-8">
														<h4 class="text-c-green">999+</h4>
														<h6 class="text-muted m-b-0">Relatório de todos
															cadastrados</h6>
													</div>
													<div class="col-4 text-right">
														<a
															href="<%=request.getContextPath()%>/principal/reluser.jsp"><i
															class="fa fa-file-text-o f-28"></i></a>
													</div>
												</div>
											</div>
											<div class="card-footer bg-c-green">
												<div class="row align-items-center">
													<div class="col-9">
														<a
															href="<%=request.getContextPath()%>/principal/reluser.jsp"><span
															class="text-white m-b-0">Visualize</span></a>
													</div>
													<div class="col-3 text-right">
														<a
															href="<%=request.getContextPath()%>/principal/reluser.jsp"><i
															class="fa fa-line-chart text-white f-16"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xl-3 col-md-6">
										<div class="card">
											<div class="card-block">
												<div class="row align-items-center">
													<div class="col-8">
														<h4 class="text-c-red">xx/xx/xxxx</h4>
														<h6 class="text-muted m-b-0">Relatório por data</h6>
													</div>
													<div class="col-4 text-right">
														<a
															href="<%=request.getContextPath()%>/principal/reluser.jsp"><i
															class="fa fa-calendar-check-o f-28"></i></a>
													</div>
												</div>
											</div>
											<div class="card-footer bg-c-red">
												<div class="row align-items-center">
													<div class="col-9">
														<a
															href="<%=request.getContextPath()%>/principal/reluser.jsp">
															<span class="text-white m-b-0">Visualize</span>
														</a>
													</div>
													<div class="col-3 text-right">
														<i class="fa fa-line-chart text-white f-16"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xl-3 col-md-6">
										<div class="card">
											<div class="card-block">
												<div class="row align-items-center">
													<div class="col-8">
														<h4 class="text-c-blue">Fotos</h4>
														<h6 class="text-muted m-b-0">Baixe as imagens
															cadastradas</h6>
													</div>
													<div class="col-4 text-right">
														<i class="fa fa-hand-o-down f-28"></i>
													</div>
												</div>
											</div>
											<div class="card-footer bg-c-blue">
												<div class="row align-items-center">
													<div class="col-9">
														<p class="text-white m-b-0">Em breve</p>

													</div>
													<div class="col-3 text-right">
														<i class="fa fa-line-chart text-white f-16"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<jsp:include page="javascriptfile.jsp"></jsp:include>

</body>

</html>
