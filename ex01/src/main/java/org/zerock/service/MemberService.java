package org.zerock.service;

import javax.servlet.http.HttpSession;

import org.zerock.domain.MemberVO;
import java.util.List;
import org.zerock.domain.StoreVO;

public interface MemberService {
	
	//public List<String> getURLList(MemberVO vo);
	
	public List<StoreVO> getStoreList(MemberVO vo);
	
	public boolean loginCheck(MemberVO vo, HttpSession session);

	public void logout(HttpSession session);
	
	public MemberVO viewMember(MemberVO vo);
	
	public boolean modify(MemberVO member);
	
	public boolean remove(String pid);
}
