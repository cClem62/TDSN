package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;

public class Connexion {
    private String DBPath;
    private String nom;
    private String mdp;
    private Connection connection = null;
    private Statement statement = null;
 
    public Connexion() {
        this.DBPath="jdbc:postgresql://localhost/tdsn";
	this.nom="tdsn";
	this.mdp="tdsnclement";    
    }

    public Connection getConnection(){
	return this.connection;
    }
 
    public void connect() {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(this.DBPath,this.nom,this.mdp);
            statement = connection.createStatement();
            System.out.println("Connexion a " + DBPath + " ouverte");
        } catch (ClassNotFoundException notFoundException) {
            notFoundException.printStackTrace();
            System.out.println("Erreur de connecxion");
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
            System.out.println("Erreur de connecxion");
        }
    }
 
    public void close() {
        try {
            connection.close();
	    System.out.println("Connexion a "+ DBPath + " fermée");
            statement.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet select(String rq) {
       ResultSet resultat= null;
       try {
           resultat = statement.executeQuery(rq);	 
       } catch (SQLException e) {
           e.printStackTrace();
           System.out.println("Erreur dans la requête : " + rq);
       }
       return resultat;  
   }

    public void IUD(String rq){	
	try{
	    statement.executeUpdate(rq);
	}catch(SQLException e){
	   e.printStackTrace();
           System.out.println("Erreur dans la requête : " + rq);
	}
       
    }
    
}
