package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	boolean loginCheck(MemberVO vo);
	
	MemberVO viewMember(MemberVO vo);
}
