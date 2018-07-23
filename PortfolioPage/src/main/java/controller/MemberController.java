package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatisUtil.MService;
import vo.UserVO;

@Controller
public class MemberController {

	@Autowired
	private MService mDAO;

	@RequestMapping(value = "/login.do")
	public ModelAndView login(ModelAndView mav, HttpSession session, UserVO uvo) throws ServletException, IOException {
		int chkNum = mDAO.loginCheck(uvo);

		if (chkNum == 0) {
			mav.addObject("returnValue", chkNum);
			mav.setViewName("login");
		} else if (chkNum == 1) {
			session.setAttribute("sessionID", uvo.getId());
			mav.setViewName("redirect:index.do");
		}

		return mav;
	}

	@RequestMapping(value = "/logout.do")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("index");
		return mav;
	}
}
