package org.zerock.domain;

import lombok.Data;

@Data
public class CCTVVO {

	private String pid;
	private String managerID;
	private String address;
	private String mongoDBid;
	private double latitude;
	private double longitude;
	private String cctvName;
	private String ip;
	
}
