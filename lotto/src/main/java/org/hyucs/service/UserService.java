package org.hyucs.service;

import org.hyucs.domain.UserVO;
import org.hyucs.dto.LoginDTO;

public interface UserService {
	public void registUser(UserVO uvo) throws Exception;

	public UserVO login(LoginDTO dto) throws Exception;
}
