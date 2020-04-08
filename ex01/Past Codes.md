```java
@RequestMapping(value = "/manageCCTV", method = RequestMethod.POST)
public ModelAndView manageCCTV(@ModelAttribute MemberVO vo, HttpServletRequest req,
                               HttpServletResponse res, HttpSession session)
    throws Exception {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
	logger.info("post login");
		
	boolean result = memberService.loginCheck(vo, session);
	ModelAndView mav = new ModelAndView();
	if (result == true) { // 로그인 성공
		mav.setViewName(""); // home.jsp 로 이동
		mav.addObject("msg", "success");
	} else { // 로그인 실패
		mav.setViewName("login"); // login.jsp 로 이동
		mav.addObject("msg", "failure");
	}
	//return mav;

	req.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
	mav.setViewName("login");
	mav.addObject("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
		
	//return mav;
		
	//HttpSession session = req.getSession();
	logger.info(vo.getPid());
	MemberVO loginVO = memberService.viewMember(vo);
	//ModelAndView mav = new ModelAndView();
	if(loginVO == null) {
		logger.info("loginVO is null");
		res.sendRedirect("http://localhost:8080/login?errMsg=아이디 또는 비밀번호가 일치하지 않습니다.");
		//session.setAttribute("member", null);
		//req.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		//mav.setViewName("login");
		//mav.addObject("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
	} else {
		logger.info("loginVO is not null");
		res.sendRedirect("http://localhost:8080/cctvManage");
		session.setAttribute("member", loginVO);
		List<String> urlList = memberService.getURLList(vo);
		req.setAttribute("urlList", urlList);
		mav.setViewName("manageCCTV");
		mav.addObject("urlList", urlList);
	}
	return mav;
}
```

```java
@RequestMapping(value = "/login", method=RequestMethod.POST)
	public ModelAndView loginOk(@ModelAttribute MemberVO vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("post login");
		HttpSession session = req.getSession();
		logger.info(vo.getPid());
		MemberVO loginVO = memberService.viewMember(vo);
		ModelAndView mav = new ModelAndView();
		if(loginVO == null) {
			logger.info("loginVO is null");
			res.sendRedirect("http://localhost:8080/login?errMsg=아이디 또는 비밀번호가 일치하지 않습니다.");
			//session.setAttribute("member", null);
			//req.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			//mav.setViewName("login");
			//mav.addObject("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
		} else {
			logger.info("loginVO is not null");
			res.sendRedirect("http://localhost:8080/cctvManage");
			//session.setAttribute("member", loginVO);
			//List<String> urlList = memberService.getURLList(vo);
			//req.setAttribute("urlList", urlList);
			//mav.setViewName("manageCCTV");
			//mav.addObject("urlList", urlList);
		}
		return mav;
	}
```

```java
@RequestMapping("login")
	public ModelAndView login(@ModelAttribute String errMsg, HttpServletRequest req) throws Exception {
		logger.info("login page");
		
		ModelAndView mav = new ModelAndView();
		
		req.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		mav.setViewName("login");
		mav.addObject("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
		
		return mav; // views/login.jsp 로 포워드
	}
```

