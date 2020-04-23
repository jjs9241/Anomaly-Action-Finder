package com.finder.domain;

import java.util.Date;

import lombok.Data;

@Data
public class VideoVO {
		
	private String pid;
	private String mongoDBID;
	private String managerID;
	private String category;
	private String extension;
	private int size;
	private Date registerDay;
	private String cctvID;
	private String actionType;
	private Boolean bookmark;
}
