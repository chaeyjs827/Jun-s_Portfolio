package mybatisUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.BoardVO;
import vo.MemberVO;


@Service
public class MServiceImpl implements MService{
	
	// 이 부분에 대한 설명 꼭 듣기 !!
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "my.mappers.memberMapper";
	
	@Override
	public List<MemberVO> getMemberList() {
		System.out.println("getMemberList() 실행!");
		return sqlSession.selectList(namespace+".memberList");
	}
	
	@Override
	public List<BoardVO> getBoardList(String sqlParam) {
		System.out.println("getBoardList("+sqlParam+") 실행!");
		
		if(sqlParam.equals("mvc2_noticeBoard")) 
			return sqlSession.selectList(namespace+".noticeBMain");
		else if(sqlParam.equals("mvc2_oftenQue")) 
			return sqlSession.selectList(namespace+".oftenBMain");
		else
			return null;
		
		
	}
}

