package mybatisUtil;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.UserVO;

@Service
public class MServiceImpl implements MService{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "my.mappers.member";
	
	public int loginCheck(UserVO uvo) {
		return sqlSession.selectOne(namespace+".loginCheck", uvo);
	}
}
