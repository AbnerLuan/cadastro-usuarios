<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<nav class="navbar header-navbar pcoded-header">
	<div class="navbar-wrapper">
		<div class="navbar-logo">
			<a class="mobile-menu waves-effect waves-light" id="mobile-collapse"
				href="#!"> <i class="ti-menu"></i>
			</a>
			<div class="mobile-search waves-effect waves-light">
				<div class="header-search">
					<div class="main-search morphsearch-search">
						<div class="input-group">
							<span class="input-group-addon search-close"><i
								class="ti-close"></i></span> <input type="text" class="form-control"
								placeholder="Enter Keyword"> <span
								class="input-group-addon search-btn"><i class="ti-search"></i></span>
						</div>
					</div>
				</div>
			</div>
			<a href="<%=request.getContextPath()%>/principal/principal.jsp">
				<img width="90px" class="img-fluid"
				src="<%=request.getContextPath()%>/assets/images/java_logo.png"
				alt="Logo-Java" />
			</a> <a class="mobile-options waves-effect waves-light"> <i
				class="ti-more"></i>
			</a>
		</div>

		<div class="navbar-container container-fluid">
			<ul class="nav-left">
				<li>
					<div class="sidebar_toggle">
						<a href="javascript:void(0)"><i class="ti-menu"></i></a>
					</div>
				</li>
				<li class="header-search">
					<div class="main-search morphsearch-search">
						<div class="input-group">
							<span class="input-group-addon search-close"><i
								class="ti-close"></i></span> <input type="text" class="form-control">
							<span class="input-group-addon search-btn"><i
								class="ti-search"></i></span>
						</div>
					</div>
				</li>
				<li><a href="#!" onclick="javascript:toggleFullScreen()"
					class="waves-effect waves-light"> <i class="ti-fullscreen"></i>
				</a></li>
			</ul>
			<ul class="nav-right">
				<li class="header-notification"><a href="#!"
					class="waves-effect waves-light"> <i class="ti-bell"></i> <span
						class="badge bg-c-red"></span>
				</a>
					<ul class="show-notification">
						<li>
							<h6>Novidades</h6> <label class="label label-danger">Novo</label>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="<%=request.getContextPath()%>/assets/images/avatar-2.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user"><%=session.getAttribute("usuario")%></h5>
									<p class="notification-msg">Confira todos os novos recursos
										do sistema!</p>
									<span class="notification-time">30 minutes ago</span>
								</div>
							</div>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="<%=request.getContextPath()%>/assets/images/avatar-4.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">Julia Pereira</h5>
									<p class="notification-msg">Lançamento de novos recursos.</p>
									<span class="notification-time">30 minutes ago</span>
								</div>
							</div>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="<%=request.getContextPath()%>/assets/images/avatar-3.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">Sara Almeida</h5>
									<p class="notification-msg">Melhoria do visual, tudo mais
										bonito!</p>
									<span class="notification-time">30 minutes ago</span>
								</div>
							</div>
						</li>
					</ul></li>
				<li class="user-profile header-notification"><a href="#!"
					class="waves-effect waves-light"> <span><%=session.getAttribute("usuario")%></span>
						<i class="ti-angle-down"></i>
				</a>
					<ul class="show-notification profile-notification">

						<li class="waves-effect waves-light"><a
							href="<%=request.getContextPath()%>/ServletLogin?acao=logout"><i
								class="ti-layout-sidebar-left"></i> Sair</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
</nav>