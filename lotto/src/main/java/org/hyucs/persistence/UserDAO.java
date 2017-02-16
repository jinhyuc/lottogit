package org.hyucs.persistence;

import org.hyucs.domain.UserVO;
import org.hyucs.dto.LoginDTO;

public interface UserDAO {
	public void regist(UserVO uvo) throws Exception;
	
	public UserVO login(LoginDTO dto) throws Exception;

}
