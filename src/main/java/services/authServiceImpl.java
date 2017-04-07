package services;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import DAO.authDAO;

@Service
public class authServiceImpl implements authService {

	@Inject
	authDAO dao;
	
	private static BCryptPasswordEncoder encryptor = new BCryptPasswordEncoder();
	
	@Override
	public void insertAuthentication(Map<Object, Object> parameterMap) {
		// TODO Auto-generated method stub
		dao.insertAuthentication(parameterMap);
	}

	@Override
	public void insertAuthority(Map<Object, Object> parameterMap) {
		// TODO Auto-generated method stub
		parameterMap.put("PASSWORD", (encryptor.encode(parameterMap.get("PASSWORD").toString() )) );
		dao.insertAuthority(parameterMap);
	}

	@Override
	@Transactional
	public void insertAuth(Map<Object, Object> parameterMap) {
		// TODO Auto-generated method stub
		parameterMap.put("PASSWORD", encryptor.encode(parameterMap.get("PASSWORD").toString() ) );
		dao.insertAuthentication(parameterMap);
		dao.insertAuthority(parameterMap);
	}

	
}
