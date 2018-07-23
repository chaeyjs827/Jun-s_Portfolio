package mybatisUtil;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.BoardVO;

@Service
public class BServiceImpl implements BService {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "my.mappers.testMapper";

	@Override
	public int test() {
		return sqlSession.selectOne(namespace + ".selectTest");
	}

	@Override
	public int bInsert(BoardVO bvo) {
		return sqlSession.insert(namespace + ".boardInsert", bvo);
	}
	
	@Override
	public List<BoardVO> indexList() {
		return sqlSession.selectList(namespace + ".indexList");
	}
	
	@Override
	public int totalCount(int boardType) {
		return sqlSession.selectOne(namespace + ".totalCount", boardType);
	}
	
	@Override
	public List<BoardVO> pagingList(HashMap<String, Integer> map) {
		return sqlSession.selectList(namespace+".pagingList", map);
	}
	
	@Override
	public List<BoardVO> reader(int postIndex) {
		return sqlSession.selectList(namespace+".reader", postIndex);
	}
	
	@Override
	public int deletePost(int pi) {
		return sqlSession.delete(namespace+".deletePost", pi);
	}
	
	@Override
	public int updatePost(BoardVO bvo, int pi) {
		return sqlSession.update(namespace+".updatePost", bvo);
	}
}
