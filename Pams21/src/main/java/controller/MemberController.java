package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatisUtil.MService;
import vo.BoardVO;
import vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MService serviceVO;

	@RequestMapping(value = "/mlist.do")
	public ModelAndView mlist(HttpServletRequest request, HttpServletResponse response, ModelAndView mav)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8"); // 인코딩

		List<MemberVO> mList = serviceVO.getMemberList();// MemberDAO.java 로 이동
		mav.addObject("orange", mList);

		mav.setViewName("memberList");
		return mav;
	}

	// mainPage.jsp 에 표시될 공지사항 및 자주하는 질문
	@RequestMapping(value = "mainBody.do")
	public ModelAndView mainBoardList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String boardTypeNotice = "notice";
		String boardTypeOften = "oftenQue";

		List<BoardVO> mainNoticeB = serviceVO.getBoardList("mvc2_noticeBoard");
		mav.addObject("noticeObject", mainNoticeB);
		List<BoardVO> mainOftenQB = serviceVO.getBoardList("mvc2_oftenQue");
		mav.addObject("mainOftenQB", mainOftenQB);

		mav.addObject("boardTypeNotice", boardTypeNotice);
		mav.addObject("boardTypeOften", boardTypeOften);

		System.out.println("두 놈다 잘 실행됨");

		mav.setViewName("mainBody");
		return mav;
	}

	@RequestMapping(value = "/login.do")
	public ModelAndView login(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelAndView mav)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		String adminId = "admin";
		String adminPw = "12345";
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		if(userId.equals(adminId)&&userPw.equals(adminPw)) {
			session.setAttribute("sessionID", userId);
			session.setAttribute("sessionPW", userPw);
		}
		
		mav.setViewName("redirect:/mainBody.do");
		return mav;
	}
}
