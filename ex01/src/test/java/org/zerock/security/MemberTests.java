package org.zerock.security;

import java.sql.Connection;

import org.springframework.test.context.ContextConfiguration;
import org.zerock.controller.ManageCCTVControllerTests;

import com.finder.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import javax.sql.DataSource;
import java.sql.PreparedStatement;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	//@Test
	public void testInsertMember() {
		
		String sql = "insert into member(PID, Email, Passwd, PhoneNumber) values(?,?,?,?)";
		
		for(int i=0;i<100;i++) {
			Connection con = null;
			PreparedStatement pStmt = null;
			
			try {
				con = ds.getConnection();
				pStmt = con.prepareStatement(sql);
				
				pStmt.setString(3, pwEncoder.encode("pw"+i));
				
				if(i<80) {
					pStmt.setString(1, "user"+i+"@testmail.com");
					pStmt.setString(2, "user"+i+"@testmail.com");
				} else if(i<90) {
					pStmt.setString(1, "manager"+i+"@testmail.com");
					pStmt.setString(2, "manager"+i+"@testmail.com");
				} else {
					pStmt.setString(1, "admin"+i+"@testmail.com");
					pStmt.setString(2, "admin"+i+"@testmail.com");
				}
				
				pStmt.setString(4, "0100000"+String.format("%02d", i));
				
				pStmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(pStmt != null) { try { pStmt.close(); } catch(Exception e) {} }
				if(con != null) { try { con.close(); } catch(Exception e) {} }
			}
		}
	}
	
	//@Test
	public void testInsertAuth() {
		
		String sql = "insert into member_auth (memberid,auth) " +
					"values((select PID from Member where PID = ?), ?)";
		
		for(int i=0; i<100; i++) {
			
			Connection con = null;
			PreparedStatement pStmt = null;
			
			try {
				con = ds.getConnection();
				pStmt = con.prepareStatement(sql);
				
				if(i<80) {
					pStmt.setString(1, "user"+i+"@testmail.com");
					pStmt.setString(2, "ROLE_USER");
					
				} else if(i<90) {
					pStmt.setString(1, "manager"+i+"@testmail.com");
					pStmt.setString(2, "ROLE_MEMBER");
				} else {
					pStmt.setString(1, "admin"+i+"@testmail.com");
					pStmt.setString(2, "ROLE_ADMIN");
				}
				
				pStmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pStmt != null) { try { pStmt.close(); } catch(Exception e) {} }
				if(con != null) { try { con.close(); } catch(Exception e) {} }
				
			}
		}
	}
}
