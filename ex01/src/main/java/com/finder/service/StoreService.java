package com.finder.service;

import java.util.List;

import com.finder.domain.CCTVVO;
import com.finder.domain.StoreVO;

public interface StoreService {

	public List<CCTVVO> getCCTVList(StoreVO vo);
	
	public StoreVO viewStore(StoreVO vo);

	public StoreVO getStore(String storeId);
	
	public boolean modify(StoreVO store);
	
	public boolean remove(String pid);
	
	public boolean register(StoreVO store);
	
	public String getManagerId(String storeId);
	
	
}
