package com;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;

    private void DBConnection(){}

    private static DBConnection instance = new DBConnection();

    public static DBConnection getInstance() {
        return instance;
    }

    public Connection getConnection(){
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource dataSource = (DataSource) envContext.lookup("jdbc/pool");
            con = dataSource.getConnection();
        } catch (Exception e ){
            e.printStackTrace();
        }
        return con;
    }
}
