package org.hyucs.service;

import javax.inject.Inject;

import org.hyucs.domain.UserVO;
import org.hyucs.dto.LoginDTO;
import org.hyucs.persistence.UserDAO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO udao;

	@Override
	public void registUser(UserVO uvo) throws Exception {
		udao.regist(uvo);		
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return udao.login(dto);
	}

}
