package com.finder.service;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;

import com.finder.domain.MemberVO;
import com.finder.domain.StoreVO;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;

public interface MemberService {
	
	//public List<String> getURLList(MemberVO vo);
	
	public List<StoreVO> getStoreList(MemberVO vo);
	
	public boolean loginCheck(MemberVO vo, HttpSession session);

	public void logout(HttpSession session);
	
	public MemberVO viewMember(MemberVO vo);
	
	public boolean modify(MemberVO member);
	
	public boolean remove(String pid);
	
	@Transactional
	public boolean join(MemberVO vo);
}
