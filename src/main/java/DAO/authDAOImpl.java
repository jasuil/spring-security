package DAO;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class authDAOImpl implements authDAO {

	@Autowired
	SqlSession session;
	
	private static String namespace = "authentications";
	
	@Override
	public void insertAuthentication(Map<Object, Object> parameterMap) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".createAuthentication", parameterMap);
	}

	@Override
	public void insertAuthority(Map<Object, Object> parameterMap) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".createAuthorization", parameterMap);
	}

}
