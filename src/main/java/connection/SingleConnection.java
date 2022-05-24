package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection {

	private static String banco = "jdbc:postgresql://ec2-3-231-82-226.compute-1.amazonaws.com:5432/d53g03pqtesm96?sslmode=require&autoReconnect=true";
	private static String user = "xuzuysvohhbcse";
	private static String senha = "8c11d2c6e82d819ca0c2d0f719d5a76f9f403ecbff87e5c441754f2925c476ef";
	private static Connection connection = null;

	public static Connection getConnection() {
		return connection;
	}

	static {
		conectar();
	}

	public SingleConnection() { // quando tiver uma instancia vai conectar
		conectar();
	}

	private static void conectar() {
		try {
			if (connection == null) {
				Class.forName("org.postgresql.Driver"); // carrega o driver de conexao do banco
				connection = DriverManager.getConnection(banco, user, senha);
				connection.setAutoCommit(false); // nao efetuar alteracao sem comando
			}

		} catch (Exception e) {
			e.printStackTrace(); // mostrar qualquer erro no momento de conectar
		}
	}

}
