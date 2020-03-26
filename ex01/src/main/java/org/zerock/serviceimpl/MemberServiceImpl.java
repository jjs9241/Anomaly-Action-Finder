package org.zerock.serviceimpl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.mapper.CCTVMapper;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;

import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	MemberMapper mapper;
	
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		
		boolean result = mapper.loginCheck(vo);
		if (result) { // true 일 경우 세션에 등록
			MemberVO vo2 = viewMember(vo); // 세션 변수 등록
			session.setAttribute("userId", vo2.getPid());
			session.setAttribute("userEmail", vo2.getEmail());
		}
		return result;
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
	
}
