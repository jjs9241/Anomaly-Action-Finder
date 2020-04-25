package com.finder.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.finder.domain.CCTVVO;
import com.finder.domain.MemberVO;
import com.finder.domain.StoreVO;

public interface StoreMapper {

	public List<String> getStoreList(MemberVO member);
	
	public List<String> getUrlListById(String pid);
	
	public StoreVO getStore(String pid);
	
	public StoreVO viewStore(StoreVO vo);
	
	public StoreVO viewStoreById(String storeId);
	
	public int register(StoreVO vo);
	
	public int update(StoreVO store);
	
	public int delete(String pid);
}
