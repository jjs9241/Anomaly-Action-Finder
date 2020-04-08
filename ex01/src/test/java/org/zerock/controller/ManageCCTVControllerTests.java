package org.zerock.controller;

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

import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;
import org.junit.Before;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration // Servlet 의 ServletContext 를 이용하기 위한 어노테이션
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class ManageCCTVControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc; // 가짜 mvc 가짜 url과 파라미터 등을 브라우저에서 사용하는 것처럼 만들어서 Controller를 실행해 볼 수 있습니다.
	
	@Before // 모든 테스트 전에 매번 실행되는 메서드를 표시하는 어노테이션
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();	// ???
	}
	
	@Test
	public void testList() throws Exception{
		// mockMvc에 의해 get 방식의 호출이 이루어 진다. ManageCCTVController에서 반환된 결과를 이용해서 Model에 어떤 데이터들이 담겨 있는지 확인한다.
		// get 방식의 경우는
		/* log.info(mockMvc.perform(MockMvcRequestBuilders.get("/manageCCTV"))
				.andReturn()
				.getModelAndView()
				.getModelMap()); */
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/manageCCTV")
			.param("pid","jjj1111@testmail.com")
			.param("email", "jjj1111@testmail.com")
			.param("passwd", "testpassword")
		).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
}
