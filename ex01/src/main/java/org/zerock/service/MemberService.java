package org.zerock.service;

import javax.servlet.http.HttpSession;

import org.zerock.domain.MemberVO;

public interface MemberService {
	
	public boolean loginCheck(MemberVO vo, HttpSession session);

	public void logout(HttpSession session);
	
	public MemberVO viewMember(MemberVO vo);
}
