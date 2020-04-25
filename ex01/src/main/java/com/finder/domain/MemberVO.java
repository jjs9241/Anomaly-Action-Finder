package com.finder.domain;

import java.util.Date;

import lombok.Data;
import java.util.List;

@Data
public class MemberVO {

	private String pid;
	private String email;
	private String passwd;
	private String phoneNumber;
	private Date registerDate;
	private Date updateDate;
	private char enabled;
	
	private List<AuthVO> authList;
}
