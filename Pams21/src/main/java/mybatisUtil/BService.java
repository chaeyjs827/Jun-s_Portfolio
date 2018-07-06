package mybatisUtil;

import java.util.List;

import vo.BoardVO;
import vo.PageVO;

public interface BService {
	//PageVO getPagingList(int cPage);
	
	public int totalCount();
	
	public int totalCount(String searchWord);
	
	public int totalCountNotice();

	public int totalCountNotice(String searchWord);
	
	public int typeTotalCount(PageVO pvo);
	
	public int bInsert(BoardVO vo);

	List<BoardVO> getPageList(PageVO pvo);

	List<BoardVO> searchPaging(PageVO pvo);

	List<BoardVO> getNoticePageList(PageVO pvo);

	List<BoardVO> getNoticePageListSearch(PageVO pvo);
	
	List<BoardVO> getTypePageList(PageVO pvo);
	
	public List<BoardVO> bRead(BoardVO bvo);
	
	public List<BoardVO> bReadNotice(BoardVO bvo);
}
