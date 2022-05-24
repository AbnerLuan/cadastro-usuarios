package servlets;

import java.io.IOException;
import java.util.List;

import dao.DAOTelefoneRepository;
import dao.DAOUsuarioRepository;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ModelLogin;
import model.ModelTelefone;

//@WebServlet("/ServletTelefone")
public class ServletTelefone extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;

	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
	private DAOTelefoneRepository daoTelefoneRepository = new DAOTelefoneRepository();

	public ServletTelefone() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String acao = request.getParameter("acao");
			if (acao != null && !acao.isEmpty() && acao.equals("excluir")) {
				String idfone = request.getParameter("id");

				daoTelefoneRepository.deleteFone(Long.parseLong(idfone));

				String userpai = request.getParameter("userpai");

				ModelLogin modelLogin = daoUsuarioRepository.consultaUsuarioId(Long.parseLong(userpai));
				List<ModelTelefone> modelTelefones = daoTelefoneRepository.listFone(modelLogin.getId());

				request.setAttribute("msg", "Telefone excluido com sucesso!");
				request.setAttribute("modelTelefones", modelTelefones);
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/telefone.jsp").forward(request, response);

				return;
			}

			String iduser = request.getParameter("iduser");

			if (iduser != null && !iduser.isEmpty()) {

				ModelLogin modelLogin = daoUsuarioRepository.consultaUsuarioId(Long.parseLong(iduser));

				List<ModelTelefone> modelTelefones = daoTelefoneRepository.listFone(modelLogin.getId());
				request.setAttribute("modelTelefones", modelTelefones);

				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/telefone.jsp").forward(request, response);

			} else {
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultaUsuarioList(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);
				request.setAttribute("totalPagina", daoUsuarioRepository.totalPagina(this.getUserLogado(request)));
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String usuario_pai_id = request.getParameter("id");
			String numero = request.getParameter("numero");

			if (!daoTelefoneRepository.existeFone(numero, Long.valueOf(usuario_pai_id))) {

				ModelTelefone modelTelefone = new ModelTelefone();
				modelTelefone.setNumero(numero);
				modelTelefone.setUsuario_pai_id(daoUsuarioRepository.consultaUsuarioId(Long.parseLong(usuario_pai_id)));
				modelTelefone.setUsuario_cad_id(super.getUserLogadoObjet(request));

				daoTelefoneRepository.gravaTelefone(modelTelefone);

				List<ModelTelefone> modelTelefones = daoTelefoneRepository.listFone(Long.parseLong(usuario_pai_id));

				ModelLogin modelLogin = daoUsuarioRepository.consultaUsuarioId(Long.parseLong(usuario_pai_id));

				request.setAttribute("modelLogin", modelLogin);
				request.setAttribute("modelTelefones", modelTelefones);
				request.setAttribute("msg", "Telefone salvo com sucesso!");
				request.getRequestDispatcher("principal/telefone.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "Telefone ja existe!");
			}
			List<ModelTelefone> modelTelefones = daoTelefoneRepository.listFone(Long.parseLong(usuario_pai_id));

			ModelLogin modelLogin = daoUsuarioRepository.consultaUsuarioId(Long.parseLong(usuario_pai_id));

			request.setAttribute("modelLogin", modelLogin);
			request.setAttribute("modelTelefones", modelTelefones);
			request.getRequestDispatcher("principal/telefone.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
