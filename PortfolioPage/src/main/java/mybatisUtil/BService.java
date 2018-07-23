package mybatisUtil;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import vo.BoardVO;

public interface BService {
	public int test();
	
	public List<BoardVO> indexList();
	//public List<BoardVO> bInsert();
	
	public int bInsert(BoardVO bvo);
	
	public int totalCount(int boardType);
	
	public List<BoardVO> pagingList(HashMap<String, Integer> map);
	
	public List<BoardVO> reader(int postIndex);
	
	public int deletePost(int pi);
	
	public int updatePost(BoardVO bvo, int pi);
}
