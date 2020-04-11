package com.finalproject.uhui;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) throws Exception{
			
		return "login";
		
	}
	
	@RequestMapping(value = "/strange", method = RequestMethod.GET)
	public String strange(Model model) throws Exception{
			
		return "strange";
		
	}
	
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String managecctv(Model model) throws Exception{
			
		return "manageCCTV";
		
	}
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(Model model) throws Exception{
			
		return "map";
		
	}
	@RequestMapping(value = "/cctvlist", method = RequestMethod.GET)
	public String cctvlist(Model model) throws Exception{
			
		return "cctvlist";
		
	}
	@RequestMapping(value = "/createcctv", method = RequestMethod.GET)
	public String createcctv(Model model) throws Exception{			
		return "createcctv";		
	}
	@RequestMapping(value = "/changecctv", method = RequestMethod.GET)
	public String changecctv(Model model) throws Exception{			
		return "changecctv";		
	}
}
