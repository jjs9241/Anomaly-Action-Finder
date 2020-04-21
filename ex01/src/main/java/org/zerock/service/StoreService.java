package org.zerock.service;

import org.zerock.domain.StoreVO;
import org.zerock.domain.CCTVVO;
import java.util.List;

public interface StoreService {

	public List<CCTVVO> getCCTVList(StoreVO vo);
	
	public StoreVO viewStore(StoreVO vo);
	
	public boolean modify(StoreVO store);
	
	public boolean remove(String pid);
	
	public boolean register(StoreVO store);
	
	public String getManagerId(String storeId);
}
