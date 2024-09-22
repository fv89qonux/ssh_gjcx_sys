package com.DB;

import java.sql.*;

public class connDB {
  public static  Connection conn = null;
  public Statement stmt = null;
  public ResultSet rs = null;


  public static Connection getConnection() throws ClassNotFoundException {
   	Class.forName("com.mysql.cj.jdbc.Driver");
	 try {
	    conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ssh_gjcx_sys?useSSL=false&serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf-8","ssh_gjcx_sys","ssh_gjcx_sys");
    }
    catch (Exception ee) {
    	ee.printStackTrace();
    }
   return conn;
  }

  public ResultSet executeQuery(String sql) throws ClassNotFoundException {
    try {
      conn = getConnection();
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
     System.out.println(sql);
      rs = stmt.executeQuery(sql);
    }
    catch (SQLException ex) {
      System.err.println(ex.getMessage());
    }
    return rs;
  }


  public int executeUpdate(String sql) throws ClassNotFoundException {
    int result = 0;
    try {
      conn = getConnection();
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_READ_ONLY);
      result = stmt.executeUpdate(sql);
    }
    catch (SQLException ex) {
      result = 0;
    }
    try {
      stmt.close();
    }
    catch (SQLException ex1) {
    }
    return result;
  }

  public int executeUpdate_id(String sql) throws ClassNotFoundException {
    int result = 0;
    try {
      conn = getConnection();
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_READ_ONLY);
      result = stmt.executeUpdate(sql);
      String ID = "select @@IDENTITY as id";
      rs = stmt.executeQuery(ID);
      if (rs.next()) {
        int autoID = rs.getInt("id");
        result = autoID;
      }
    }
    catch (SQLException ex) {
      result = 0;
    }
    return result;
  }

 
  public void close() {
    try {
      if (rs != null) {
        rs.close();
      }
    }
    catch (Exception e) {
      e.printStackTrace(System.err);
    }
    try {
      if (stmt != null) {
        stmt.close();
      }
    }
    catch (Exception e) {
      e.printStackTrace(System.err);
    }
    try {
      if (conn != null) {
        conn.close();
      }
    }
    catch (Exception e) {
      e.printStackTrace(System.err);
    }
  }

}
