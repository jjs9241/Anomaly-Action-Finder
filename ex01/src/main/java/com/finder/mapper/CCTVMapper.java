package com.finder.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.finder.domain.CCTVVO;

public interface CCTVMapper {
	
	public List<String> getURLList(String managerID);
	
	public List<CCTVVO> getCCTVList(String storeId);

	//@Select("select * from cctv")
	public List<CCTVVO> getList();
	
	public boolean insert(CCTVVO cctv);
	
	//public void insertSelectKey(CCTVVO cctv);
}
