package org.zerock.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

   static {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   Connection con;

   @Test
   public void testConnection() {
      try {
         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","book_ex","1234");
         log.info(con);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            con.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }

}