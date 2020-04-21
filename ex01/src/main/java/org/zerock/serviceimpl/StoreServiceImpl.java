package org.zerock.serviceimpl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.mapper.CCTVMapper;
import org.zerock.mapper.MemberMapper;
import org.zerock.mapper.StoreMapper;

import lombok.Setter;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import org.zerock.controller.LoginController;
import org.zerock.domain.MemberVO;
import org.zerock.domain.CCTVVO;
import org.zerock.domain.StoreVO;
import org.zerock.service.StoreService;
import java.util.List;
import java.util.ArrayList;

@Log4j
@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {

private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Setter(onMethod_ = @Autowired)
	StoreMapper storeMapper;
	
	@Setter(onMethod_ = @Autowired)
	CCTVMapper cctvMapper;
	
	@Override
	public List<CCTVVO> getCCTVList(StoreVO vo) {
		return cctvMapper.getCCTVList(vo.getPid());		
	}
	
	@Override
	public StoreVO viewStore(StoreVO vo) {
		
		return storeMapper.viewStore(vo);
	}
	
	@Override
	public boolean modify(StoreVO store) {
		log.info("modify......" + store);
		
		return storeMapper.update(store) == 1;
	}
	
	@Override
	public boolean remove(String pid) {
		log.info("remove...." + pid);
		
		return storeMapper.delete(pid)==1;
	}
	
	@Override
	public String getManagerId(String storeId) {
		log.info("store...." + storeId);
		StoreVO storeVO = new StoreVO();
		storeVO.setPid(storeId);
		return storeMapper.viewStore(storeVO).getManagerId();
	}
	
	@Override
	public boolean register(StoreVO store) {
		log.info("store...." + store);
		
		return storeMapper.register(store) == 1;
	}
}
