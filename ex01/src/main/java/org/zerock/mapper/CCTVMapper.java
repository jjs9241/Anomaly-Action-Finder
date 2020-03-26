package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.CCTVVO;

public interface CCTVMapper {

	//@Select("select * from cctv")
	public List<CCTVVO> getList();
	
	public void insert(CCTVVO cctv);
	
	//public void insertSelectKey(CCTVVO cctv);
}
