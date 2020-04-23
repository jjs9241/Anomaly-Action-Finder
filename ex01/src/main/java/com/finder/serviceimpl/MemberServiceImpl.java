package com.finder.serviceimpl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import com.finder.controller.LoginController;
import com.finder.domain.MemberVO;
import com.finder.domain.StoreVO;
import com.finder.mapper.CCTVMapper;
import com.finder.mapper.MemberMapper;
import com.finder.mapper.StoreMapper;
import com.finder.service.MemberService;

import java.util.List;
import java.util.ArrayList;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Setter(onMethod_ = @Autowired)
	MemberMapper mapper;
	
	//@Setter(onMethod_ = @Autowired)
	//CCTVMapper cctvMapper;
	
	@Setter(onMethod_ = @Autowired)
	StoreMapper storeMapper;
	
	/*@Override
	public List<String> getURLList(MemberVO vo) {
		return cctvMapper.getURLList(vo.getPid());		
	}*/
	
	@Override
	public List<StoreVO> getStoreList(MemberVO vo) {
		List<String> storeIdList = storeMapper.getStoreList(vo);
		List<StoreVO> storeList = new ArrayList<StoreVO>();
		for(int i=0;i<storeIdList.size();i++) {
			log.info("store id......" + storeIdList.get(i));
			storeList.add(storeMapper.getStore(storeIdList.get(i)));
		}
		return storeList;
	}
	
	
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		
		String checkEmail = mapper.loginCheck(vo);
		
		if (checkEmail.equals(vo.getEmail())) { // true 일 경우 세션에 등록
			MemberVO vo2 = viewMember(vo); // 세션 변수 등록
			session.setAttribute("userId", vo2.getPid());
			session.setAttribute("userEmail", vo2.getEmail());
			return true;
		}
		return false;
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
	
	@Override
	public boolean modify(MemberVO member) {
		log.info("modify......" + member);
		
		return mapper.update(member) == 1;
	}
	
	@Override
	public boolean remove(String pid) {
		log.info("remove...." + pid);
		
		return mapper.delete(pid)==1;
	}
}
