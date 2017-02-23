package org.hyucs.service;

import java.util.List;

import org.hyucs.domain.StoreVO;

public interface StoreService {
	public void registStore(StoreVO svo) throws Exception;
	
	public List<StoreVO> listAll() throws Exception;
	
	public void remove(int storeid) throws Exception;
	
	public void update(StoreVO svo) throws Exception;

}
