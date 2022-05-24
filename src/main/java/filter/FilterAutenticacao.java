package filter;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import connection.SingleConnection;
import dao.DAOVersionadorBanco;


@WebFilter(urlPatterns = { "/principal/*" }) // intercepta todas as requisicoes
public class FilterAutenticacao extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;
	private static Connection connection;

	public FilterAutenticacao() {
	}

	// encerra os processos quando o servidor e parado
	// fecha conexao com BD
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Intercepta as requisicoes e respostas no sistema
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();

			String usuarioLogado = (String) session.getAttribute("usuario");

			String urlParaAutenticar = req.getServletPath();

			if (usuarioLogado == null
					|| usuarioLogado.equals("null") && !urlParaAutenticar.equalsIgnoreCase("/principal/ServletLogin")) {
				RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
				request.setAttribute("msg", "Favor realizar o login");
				redireciona.forward(request, response);
				return; // para a execucao e redireciona para o login
			} else {

				chain.doFilter(request, response);
			}
			connection.commit(); // deu td certo entao comita as alteracoes
		} catch (Exception e) {
			e.printStackTrace();

			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);

			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	// inicia os processos quando o servidor sobe o projeto
	// Inicia conexao com DB
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnection.getConnection();

		DAOVersionadorBanco daoVersionadorBanco = new DAOVersionadorBanco();

		String caminhoPastaSQL = fConfig.getServletContext().getRealPath("versionadorbancosql") + File.separator;

		File[] filesSql = new File(caminhoPastaSQL).listFiles();

		try {

			for (File file : filesSql) {

				boolean arquivoJaRodado = daoVersionadorBanco.arquivoSqlRodado(file.getName());

				if (!arquivoJaRodado) {

					FileInputStream entradaArquivo = new FileInputStream(file);

					Scanner lerArquivo = new Scanner(entradaArquivo, "UTF-8");

					StringBuilder sql = new StringBuilder();

					while (lerArquivo.hasNext()) {

						sql.append(lerArquivo.nextLine());
						sql.append("\n");
					}

					connection.prepareStatement(sql.toString()).execute();
					daoVersionadorBanco.gravaArquivoSqlRodado(file.getName());

					connection.commit();
					lerArquivo.close();
				}
			}

		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

}
