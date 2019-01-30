package db;

import java.sql.Connection;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBAction {
	public static DBAction instance;
	private Connection conn;
	private DataSource ds;
	private Context ctx;

	private DBAction() {

		try {
			InitialContext initctx = new InitialContext();
			ctx = (Context) initctx.lookup("java:/comp/env");
			ds = (DataSource) ctx.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static DBAction getInstance() {
		if (instance == null)
			instance = new DBAction();
		return instance;
	}

	public Connection getConnection() {
		try {
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void destroy(Statement stmt, Connection conn) {
		try {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}