package controller;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mybatisUtil.BService;
import vo.BoardVO;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BService bDAO;
/*	
	@Resource(name="uploadPath")
	private String uploadPath;
	*/
	
	@RequestMapping(value = "/index.do")
	public ModelAndView portList(ModelAndView mav) throws Exception {
		List<BoardVO> indexList = bDAO.indexList();
		mav.addObject("indexList", indexList);
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping(value = "/portList.do")
	public ModelAndView portList(ModelAndView mav, BoardVO bvo, HttpServletRequest request) throws Exception {
		
		String bt = request.getParameter("bt");
		String cp = request.getParameter("cp");
		
		if(bt==null) {
			bt="0";
		}
		if(cp == null) {
			cp = "0";
		}
		
		int currentPage = Integer.parseInt(cp);
		int boardType = Integer.parseInt(bt);
		int totalCount = bDAO.totalCount(boardType);
		int perPage = 6;
		int skip = 0;
		
		if(currentPage>1) {
			skip = (currentPage-1)*perPage;
		}
		
		int finalNumber = skip;
		int lastNumber = (finalNumber+perPage);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("boardType", boardType);
		map.put("finalNumber", finalNumber);

		List<BoardVO> blist = bDAO.pagingList(map);

		System.out.println(blist);
		
		int totalPage = totalCount / perPage;
		if ((totalCount % perPage) != 0) {
			totalPage++;
		}
		
		HashMap<String, Integer> paraMap = new HashMap<String, Integer>();
		paraMap.put("currentPage", currentPage);
		paraMap.put("totalPage", totalPage);
		paraMap.put("boardType", boardType);
		paraMap.put("totalCount", totalCount);
		
		mav.addObject("paraMap", paraMap);
		mav.addObject("portList", blist);
		mav.setViewName("portfolio");
		return mav;
	}
	
	@RequestMapping(value = {"/reader.do", "/modify.do"})
	public ModelAndView reader(ModelAndView mav, HttpServletRequest request) throws Exception {
			String pi, bt, cp, mc = "0";

			pi = request.getParameter("pi");
			bt = request.getParameter("bt");
			cp = request.getParameter("cp");
			
			
			int postIndex = Integer.parseInt(pi);
			
			List<BoardVO> blist = bDAO.reader(postIndex);
			
			mav.addObject("pi", pi);
			mav.addObject("bt", bt);
			mav.addObject("cp", cp);
			mav.addObject("blist", blist);
			
			if(request.getParameter("mc") == null) {
				mav.setViewName("reader");
			} else {
				mav.setViewName("portModify");
			}
		return mav;
	}
	
	@RequestMapping(value = "/insertBoard.do", method=RequestMethod.POST)
	public ModelAndView insertBoard(ModelAndView mav, BoardVO bvo, HttpServletRequest request, MultipartFile thumnail_file) throws Exception {
		logger.info("originalName : " + thumnail_file.getOriginalFilename());
		logger.info("size : " + thumnail_file.getSize());
		logger.info("contentType : " + thumnail_file.getContentType());
		
		/*String root_path = request.getServletContext().getRealPath("/");
		System.out.println(root_path);
		String attach_path1 = "resources\\";
		String attach_path2 = "upload_img";
		System.out.println(attach_path1+attach_path2);
		System.out.println(root_path+attach_path1+attach_path2);*/
		
		String dDrivePath = "D:\\Img_Storage";
		
		// String savedName = uploadFile(thumnail_file.getOriginalFilename(), thumnail_file.getBytes(), root_path+attach_path1+attach_path2);
		String savedName = uploadFile(thumnail_file.getOriginalFilename(), thumnail_file.getBytes(), dDrivePath);
		
		bvo.setThumnail(savedName);
		
		bDAO.bInsert(bvo);
		
		mav.setViewName("redirect:portList.do?bt=0&cp=1");
		return mav;
	}
	
	private String uploadFile(String originalName, byte[] fileData, String full_path) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(full_path, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	@RequestMapping(value = "/deletePost.do")
	public ModelAndView deletePost(ModelAndView mav, HttpServletRequest request) throws Exception {
		int bt = Integer.parseInt(request.getParameter("bt"));
		int cp = Integer.parseInt(request.getParameter("cp"));
		int pi = Integer.parseInt(request.getParameter("pi"));
		
		bDAO.deletePost(pi);
		
		mav.setViewName("redirect:portList.do?bt="+bt+"&cp="+cp);
		return mav;
	}
	
	@RequestMapping(value = "/updatePost.do")
	public ModelAndView updatePost(ModelAndView mav, HttpServletRequest request, BoardVO bvo) throws Exception {
		int bt = Integer.parseInt(request.getParameter("bt"));
		int cp = Integer.parseInt(request.getParameter("cp"));
		int pi = Integer.parseInt(request.getParameter("pi"));
		
		bvo.setPostIndex(pi);
		
		bDAO.updatePost(bvo, pi);
		mav.setViewName("redirect:portList.do?bt="+bt+"&cp="+cp);
		return mav;
	}
	
	
}
