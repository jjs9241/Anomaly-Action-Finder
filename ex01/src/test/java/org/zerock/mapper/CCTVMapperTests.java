package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.finder.domain.CCTVVO;
import com.finder.mapper.CCTVMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CCTVMapperTests {

	@Setter(onMethod_ = @Autowired)
	private CCTVMapper mapper;
	
	@Test
	public void testGetURLList() {
		mapper.getURLList("jjj1111@testmail.com").forEach(cctv -> log.info(cctv));
	}
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(cctv -> log.info(cctv));
	}
	
	//@Test
	public void testInsert() {
		CCTVVO cctv = new CCTVVO();
		cctv.setPid("insertTestPID");
		cctv.setManagerID("jjj1111@testmail.com");
		cctv.setAddress("insertTestAdd");
		cctv.setMongoDBid("insertTestMongo");
		cctv.setLatitude(0.0);
		cctv.setLongitude(0.0);
		cctv.setCctvName("insertTestName");
		cctv.setIp("insertTestIP");
		
		mapper.insert(cctv);
		log.info(cctv);
	}
}
