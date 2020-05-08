package com.finder.mapper;

import java.util.List;

import com.finder.domain.VideoVO;

public interface VideoMapper {
	
	public List<VideoVO> getVideoListByManagerID(String managerID);
	public List<VideoVO> getVideoBoomarkListByManagerID(String managerID);

}
