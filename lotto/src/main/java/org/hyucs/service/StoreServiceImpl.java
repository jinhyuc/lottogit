package org.hyucs.service;

import java.util.List;

import javax.inject.Inject;

import org.hyucs.domain.StoreVO;
import org.hyucs.persistence.StoreDAO;
import org.springframework.stereotype.Service;

@Service
public class StoreServiceImpl implements StoreService {

	@Inject
	private StoreDAO sdao;
	
	@Override
	public void registStore(StoreVO svo) throws Exception {
		sdao.regist(svo);
	}

	@Override
	public List<StoreVO> listAll() throws Exception {
		return sdao.listAll();
	}

	@Override
	public void remove(int storeid) throws Exception {
		sdao.remove(storeid);
	}

}
