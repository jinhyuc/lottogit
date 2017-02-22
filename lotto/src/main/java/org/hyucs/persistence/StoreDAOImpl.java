package org.hyucs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.hyucs.domain.StoreVO;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.hyucs.mapper.StoreMapper";
	
	@Override
	public void regist(StoreVO svo) throws Exception {
		session.insert(namespace + ".regist", svo);
	}

	@Override
	public List<StoreVO> listAll() throws Exception {
		return session.selectList(namespace + ".listall");
	}

	@Override
	public void remove(int storeid) throws Exception {
		session.delete(namespace + ".remove", storeid);
	}

}
