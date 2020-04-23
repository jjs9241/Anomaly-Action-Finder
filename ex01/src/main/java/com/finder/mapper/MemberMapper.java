package com.finder.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.finder.domain.MemberVO;

public interface MemberMapper {
	
	String loginCheck(MemberVO vo);
	
	public MemberVO viewMember(MemberVO vo);
	
	public MemberVO read(String pid);
	
	public int delete(String pid); // delete 에서 리턴을 int로 주면 자동으로 실행 결과를 1 또는 0으로 넘겨준다.
	
	public int update(MemberVO member);
}
