package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

import org.zerock.domain.CCTVVO;
import org.zerock.domain.MemberVO;

import java.sql.Timestamp;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
		
	@Test
	public void testLoginCheck() {
		MemberVO member = new MemberVO();
		member.setPid("jjj1111@testmail.com");
		member.setEmail("jjj1111@testmail.com");
		member.setPasswd("testpassword");
		//member.setPhoneNumber("insertTestMongo");
		//member.setSessionKey("testSessionKey");
		//member.setSessionLimit(new Timestamp(System.currentTimeMillis()));
		String email = mapper.loginCheck(member);
		log.info(email);
		System.out.println("######   #######"+ email);
	}
	
	@Test
	public void testViewMember() {
		MemberVO member = new MemberVO();
		member.setPid("jjj1111@testmail.com");
		member.setEmail("jjj1111@testmail.com");
		member.setPasswd("testpassword");
		
		//member.setPhoneNumber("insertTestMongo");
		//member.setSessionKey("testSessionKey");
		//member.setSessionLimit(new Timestamp(System.currentTimeMillis()));
		
		log.info(mapper.viewMember(member));
	}
	
	@Test
	public void testRead() {
		MemberVO member = mapper.read("jjj1111@testmail.com");
		log.info(member);
		member.getAuthList().forEach(authVO->log.info(authVO));
	}
}
