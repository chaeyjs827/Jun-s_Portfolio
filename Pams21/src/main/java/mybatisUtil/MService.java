package mybatisUtil;

import java.util.List;

import vo.BoardVO;
import vo.MemberVO;

public interface MService {
	List<MemberVO> getMemberList();
	
	List<BoardVO> getBoardList(String param);
}


