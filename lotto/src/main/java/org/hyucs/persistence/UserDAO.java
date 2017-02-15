package org.hyucs.persistence;

import org.hyucs.domain.UserVO;

public interface UserDAO {
	public void regist(UserVO uvo) throws Exception;

}
