package org.zerock.serviceimpl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.mapper.CCTVMapper;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import org.zerock.controller.LoginController;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;
import java.util.List;
import java.util.ArrayList;

import org.zerock.domain.StoreVO;
import org.zerock.mapper.StoreMapper;

import org.springframework.test.context.ContextConfiguration;

import org.springframework.security.crypto.password.PasswordEncoder;

@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;
	
	@Setter(onMethod_ = @Autowired)
	MemberMapper mapper;
	
	//@Setter(onMethod_ = @Autowired)
	//CCTVMapper cctvMapper;
	
	@Setter(onMethod_ = @Autowired)
	StoreMapper storeMapper;
	
	/*@Override
	public List<String> getURLList(MemberVO vo) {
		return cctvMapper.getURLList(vo.getPid());		
	}*/
	
	@Override
	public List<StoreVO> getStoreList(MemberVO vo) {
		List<String> storeIdList = storeMapper.getStoreList(vo);
		List<StoreVO> storeList = new ArrayList<StoreVO>();
		for(int i=0;i<storeIdList.size();i++) {
			log.info("store id......" + storeIdList.get(i));
			storeList.add(storeMapper.getStore(storeIdList.get(i)));
		}
		return storeList;
	}
	
	
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		
		String checkEmail = mapper.loginCheck(vo);
		
		if (checkEmail.equals(vo.getEmail())) { // true 일 경우 세션에 등록
			MemberVO vo2 = viewMember(vo); // 세션 변수 등록
			session.setAttribute("userId", vo2.getPid());
			session.setAttribute("userEmail", vo2.getEmail());
			return true;
		}
		return false;
	}
	
	@Override
	public MemberVO viewMember(MemberVO vo) {
		
		return mapper.viewMember(vo);
	}
	
	@Override
	public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("userId");
		// 세션 정보를 초기화 시킴
		session.invalidate();
	}
	
	@Override
	public boolean modify(MemberVO member) {
		log.info("modify......" + member);
		
		return mapper.update(member) == 1;
	}
	
	@Override
	public boolean remove(String pid) {
		log.info("remove...." + pid);
		
		return mapper.delete(pid)==1;
	}
	
	@Override
	public boolean join(MemberVO vo) {
		log.info("join...." + vo);
		vo.setPasswd(pwEncoder.encode(vo.getPasswd()));
		boolean success = false;
		try {
			success = mapper.joinUser(vo)==1 & mapper.joinAuth(vo.getPid())==1;
		} catch (Exception e) {
			logger.info("transaction");
		}
		return success;
	}
}



/*
@Log4j
public class MemberTests {

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
}*/


