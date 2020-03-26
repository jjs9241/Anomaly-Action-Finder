package org.zerock.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {

	private String pid;
	private String email;
	private String passwd;
	private String phoneNumber;
	private String sessionKey;
	private Timestamp sessionLimit;
}
