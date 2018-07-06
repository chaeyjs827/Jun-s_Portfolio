package mybatisUtil;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.BoardVO;
import vo.PageVO;

@Service
public class BServiceImpl implements BService {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "my.mappers.boardMapper";

	@Override
	public int totalCount() {
		return sqlSession.selectOne(namespace + ".totalCount");
	}
	
	@Override
	public int totalCount(String searchWord) {
		return sqlSession.selectOne(namespace + ".totalCountSearch", searchWord);
	}
	
	@Override
	public int totalCountNotice() {
		return sqlSession.selectOne(namespace + ".totalCountNotice");
	}
	
	@Override
	public int totalCountNotice(String searchWord) {
		return sqlSession.selectOne(namespace + ".totalCountNoticeSearch", searchWord);
	}

	@Override
	public List<BoardVO> getPageList(PageVO pvo) {
		return sqlSession.selectList(namespace + ".getPageList", pvo);
	}
	
	@Override
	public List<BoardVO> searchPaging(PageVO pvo) {
		return sqlSession.selectList(namespace + ".searchPaging", pvo);
	}

	@Override
	public List<BoardVO> getNoticePageList(PageVO pvo) {
		return sqlSession.selectList(namespace + ".getNoticePageList", pvo);
	}

	@Override
	public List<BoardVO> getNoticePageListSearch(PageVO pvo) {
		return sqlSession.selectList(namespace + ".getNoticePageListSearch", pvo);
	}
	
	@Override
	public List<BoardVO> getTypePageList(PageVO pvo) {
		return sqlSession.selectList(namespace + ".getTypePageList", pvo);
	}

	@Override
	public int typeTotalCount(PageVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".typeTotalCount",pvo);
	}

	@Override
	public int bInsert(BoardVO vo) {
		return sqlSession.insert(namespace+".bInsert",vo);
	}
	
	@Override
	public List<BoardVO> bRead(BoardVO bvo) {
		return sqlSession.selectList(namespace+".bRead", bvo);
	}
	
	@Override
	public List<BoardVO> bReadNotice(BoardVO bvo) {
		return sqlSession.selectList(namespace+".bReadNotice", bvo);
	}
}
