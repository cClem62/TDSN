package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class Connexion{
    
    private Connection connection = null;

    public Connexion() {
         
    }
    
    public Connection getConnection(){
	return this.connection;
    }
 
    public void connect() {
        try {
	    Context initCt = new InitialContext();
	    Context envCt = (Context) initCt.lookup("java:comp/env");
	    DataSource ds = (DataSource) envCt.lookup("tdsn");
	    connection = ds.getConnection();	    
        } catch (Exception e) {
            System.out.println("Erreur de connecxion");
        }
    }

    public void close(){
    	 try {
	     this.connection.close();
	     } catch (Exception e) {
            System.out.println(e);
        }
    }
    
}
