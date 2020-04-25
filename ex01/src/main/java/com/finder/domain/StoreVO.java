package com.finder.domain;

import java.util.List;

import lombok.Data;

@Data
public class StoreVO {

	String pid;
	String storeName;
	String managerId;
	String ip;
	String address;
	Double latitude;
	Double longitude;
	Float rate;
	
	private List<String> cctvUrlList;
}
