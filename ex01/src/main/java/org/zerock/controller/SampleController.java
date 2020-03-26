package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.GetMapping;

import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	@RequestMapping("")
	public void basic() {
		
		log.info("basic..............");
	}
	
	@RequestMapping(value = "/basic", method = {RequestMethod.GET, RequestMethod.POST})
	public void basicGet() {
		
		log.info("basic get................");
	}
	
	@GetMapping("/basicOnlyGet") // 간단하지만 오직 get 방식만 사용할 수 있으므로 제한이 많다.
	public void basicGet2() {
		
		log.info("basic only get................");
	}
	
	@GetMapping("/ex01") // http://localhost:8080/sample/ex01?name=AAA&age=10 식으로 사용 가능
	public String ex01(SampleDTO dto) {
		
		log.info("" + dto);
		
		return "ex01";
	}
	
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name2") String name, @RequestParam("age2") String age) {
	// @RequestParam 은 url의 변수명과 실제 변수명이 다를때 유용하다.
		log.info("name2 : " + name);
		log.info("age2 : " + age);
		
		return "ex02";
	}
	
	@GetMapping("/ex02List") // url : ex02List?ids=11&ids=22&ids=33
	public String ex02List(@RequestParam("ids")ArrayList<String> ids) {
		
		log.info("ids : " + ids);
		
		return "ex02List";
	}
	
	@GetMapping("/ex02Array") // url : ex02List?ids=11&ids=22&ids=33
	public String ex02Array(@RequestParam("ids")String[] ids) {
		
		log.info("array ids : " + Arrays.toString(ids));
		
		return "ex02Array";
	}
	
	// JavaScript 를 이용하는 경우 encodeURIComponent() 와 같은 방법으로 해결할 수 있으다
	// 현재 예제의 경우에는 '['는 '%5B'로 ']'는 '%5D'로 변경하도록 합니다.
	@GetMapping("/ex02Bean") // url : ex02Bean?dtoList%5B0%5D.name=aaa&dtoList%5B2%5D.name=bbb
	public String ex02Bean(SampleDTOList list) {
		
		log.info("list dtos : " + list);
		
		return "ex02Bean";
	}
	
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		
		log.info("/ex06.............");
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("홍길동");
		
		return dto;
	}
}
