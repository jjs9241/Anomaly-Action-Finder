package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.MemberVO;
import org.zerock.domain.CCTVVO;
import org.zerock.domain.StoreVO;

public interface StoreMapper {

	public List<String> getStoreList(MemberVO member);
	
	public List<String> getUrlListById(String pid);
	
	public StoreVO getStore(String pid);
	
	public StoreVO viewStore(StoreVO vo);
	
	public int register(StoreVO vo);
	
	public int update(StoreVO store);
	
	public int delete(String pid);
}
