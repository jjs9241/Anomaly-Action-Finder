package com.finder.domain;

import java.util.ArrayList;
import java.util.List;


import lombok.Data;

@Data
public class SampleDTOList {

	private List<SampleDTO> dtoList;
	//private List<SampleDTO> dtoList2;
	
	public SampleDTOList() {
		dtoList = new ArrayList<SampleDTO>();
		//dtoList2 = new ArrayList<>();
	}
}
