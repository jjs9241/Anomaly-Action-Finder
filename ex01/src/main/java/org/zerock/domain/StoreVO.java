package org.zerock.domain;

import java.util.List;

import lombok.Data;

@Data
public class StoreVO {

	String pid;
	String storeName;
	String managerId;
	String ip;
	
	private List<String> cctvUrlList;
}
