package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatisUtil.BService;
import vo.BoardVO;
import vo.PageVO;

@Controller
public class BoardController {
	@Autowired
	private BService bDAO;

	@RequestMapping(value = "/binsert.do")
	public ModelAndView bInsert(HttpServletRequest request, ModelAndView mav, BoardVO bvo)
			throws ServletException, IOException {

		bDAO.bInsert(bvo);
		mav.setViewName("redirect:blist.do?boardType=oftenQue&cPage=1&listType=all");
		return mav;
	}

	@RequestMapping(value = "/noticeRead.do")
	public ModelAndView noticeRead(HttpServletRequest request, ModelAndView mav, PageVO pvo)
			throws ServletException, IOException {
		String boardType = request.getParameter("boardType");
		String searchWord = request.getParameter("searchWord");
		System.out.println("boardType : " + boardType);

		int cPage = 1; // 현재 페이지(처음 출력시 무조건 1페이지)

		if (request.getParameter("cPage") != null) {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		int totalCount = 0;
		System.out.println(searchWord);
		if (searchWord == null) {
			totalCount = bDAO.totalCountNotice(); // 테이블 총 칼럼 수를 불러옴
		} else {
			totalCount = bDAO.totalCountNotice(searchWord); // 테이블 총 칼럼 수를 불러옴
		}

		int perPage = pvo.getPerPage();// 페이지당 보여줄 갯수
		int skip = 0; // 글 번호를 위한놈

		if (cPage > 1) {
			skip = (cPage - 1) * perPage;
		}

		int fno = skip;
		int lno = (fno + perPage);
		pvo.setFno(fno);

		// List<BoardVO> blist = bDAO.getNoticePageList(pvo);
		List<BoardVO> blist = null;

		if (searchWord == null) {
			blist = bDAO.getNoticePageList(pvo);
		} else {
			pvo.setSearchWord(searchWord);
			blist = bDAO.getNoticePageListSearch(pvo);
		}

		int totalPage = totalCount / perPage;
		if ((totalCount % perPage) != 0) {
			totalPage++;
		}

		mav.addObject("boardList", blist);
		mav.addObject("totalTitles", totalCount);
		mav.addObject("totalPage", totalPage);
		mav.addObject("currentPage", cPage);
		mav.addObject("searchWord", searchWord);
		// mav.addObject("paramListType", listType);
		mav.addObject("boardType", boardType);
		mav.setViewName("cscMainNotice");
		return mav;
	}

	@RequestMapping(value = "/bRead.do")
	public ModelAndView bRead(HttpServletRequest request, ModelAndView mav, BoardVO bvo)
			throws ServletException, IOException {
		String boardType = request.getParameter("boardType");
		int postIndex = Integer.parseInt(request.getParameter("postIndex"));
		System.out.println(boardType + " 이랑   " + postIndex);
		bvo.setPostIndex(postIndex);

		List<BoardVO> rlist = null;

		if (boardType.equals("oftenQue")) {
			rlist = bDAO.bRead(bvo);
			System.out.println("bRead(bvo);");
		} else if (boardType.equals("notice")) {
			rlist = bDAO.bReadNotice(bvo);
			System.out.println("bReadNotice(bvo)");
		}

		/*
		 * else if(boardType.matches("notice")) { //rlist = bDAO.bReadNotice(bvo); }
		 */

		System.out.println(rlist);
		mav.addObject("rlist", rlist);
		mav.addObject("boardType", boardType);
		mav.addObject("postIndex", postIndex);
		mav.setViewName("reader");
		return mav;
	}

	@RequestMapping(value = "/blist.do")
	/*
	 * public ModelAndView plist(HttpServletResponse response, ModelAndView mav,
	 * HttpServletRequest request, PageVO pvo, @RequestParam("boardType")String
	 * boardType)
	 */
	public ModelAndView plist(HttpServletResponse response, ModelAndView mav, HttpServletRequest request, PageVO pvo)
			throws ServletException, IOException {

		String listType = request.getParameter("listType");
		String searchWord = request.getParameter("searchWord");
		String boardType = request.getParameter("boardType");
		System.out.println("listType : " + listType);

		/*
		 * String boardType = request.getParameter("boardType");
		 * System.out.println(boardType);
		 */

		int cPage = 1; // 현재 페이지(처음 출력시 무조건 1페이지)

		// 이 경우는 도메인 파라미터로 넘어올떄 ex) blist.do?cPage=2
		if (request.getParameter("cPage") != null) {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}

		int totalCount = 0;
		System.out.println("searchWord : " + searchWord);

		if (listType.equals("all")) {
			if (searchWord == null) {
				totalCount = bDAO.totalCount(); // 테이블 총 칼럼 수를 불러옴
				System.out.println("null일떄 : " + totalCount);
			} else {
				totalCount = bDAO.totalCount(searchWord); // 테이블 총 칼럼 수를 불러옴
				System.out.println("null 아닐때 : " + totalCount);
			}
		} else {
			totalCount = bDAO.typeTotalCount(pvo); // 테이블 총 칼럼 수를 불러옴
			System.out.println("값 있을때 : " + totalCount);

		}

		int perPage = pvo.getPerPage();// 페이지당 보여줄 갯수
		int skip = 0; // 글 번호를 위한놈

		if (cPage > 1) {
			skip = (cPage - 1) * perPage;
		}

		int fno = skip;
		int lno = (fno + perPage);
		pvo.setFno(fno);
		pvo.setListType(listType);
		// pvo.setLno(lno);

		// System.out.println(fno);
		// System.out.println(lno);

		List<BoardVO> blist = null;

		if (listType.equals("all")) {
			if (searchWord == null) {
				blist = bDAO.getPageList(pvo);
			} else {
				pvo.setSearchWord(searchWord);
				blist = bDAO.searchPaging(pvo);
			}
		} else {
			blist = bDAO.getTypePageList(pvo);
		}

		int totalPage = totalCount / perPage;
		if ((totalCount % perPage) != 0) {
			totalPage++;
		}

		if (boardType.matches("oftenQue")) {
			mav.setViewName("cscMainOften");
		} else if (boardType.matches("notice")) {
			mav.setViewName("cscMainNotice");
		}

		mav.addObject("searchWord", searchWord);
		mav.addObject("boardList", blist);
		mav.addObject("totalTitles", totalCount);
		mav.addObject("totalPage", totalPage);
		mav.addObject("currentPage", cPage);
		mav.addObject("paramListType", listType);
		mav.addObject("boardType", boardType);
		return mav;
	}

	@RequestMapping(value = "/postDelete.do")
	public ModelAndView postDelete(HttpServletRequest request,ModelAndView mav) throws ServletException, IOException {
		String test1 = request.getParameter("boardType");
		String test2 = request.getParameter("postIndex");
		
		return mav;
	}
	
}
