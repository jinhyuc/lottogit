package org.hyucs.persistence;

import java.util.List;

import org.hyucs.domain.StoreVO;

public interface StoreDAO {
	public void regist(StoreVO svo) throws Exception;
	
	public List<StoreVO> listAll() throws Exception;
	
	public void remove(int storeid) throws Exception;
	
}
