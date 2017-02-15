package org.hyucs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.hyucs.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.hyucs.mapper.UserMapper";
	
	@Override
	public void regist(UserVO uvo) throws Exception {
		session.insert(namespace + ".registration", uvo);
	}

}
