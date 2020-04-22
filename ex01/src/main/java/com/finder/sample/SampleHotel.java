package com.finder.sample;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.ToString;
import lombok.AllArgsConstructor;

@Component
@ToString
@Getter
@AllArgsConstructor
public class SampleHotel {

	private Chef chef;
}
