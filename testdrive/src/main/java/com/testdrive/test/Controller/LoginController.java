package com.testdrive.test.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.testdrive.test.DAO.accountDAO;
import com.testdrive.test.VO.Account;

/**
 * Handles requests for the application home page.
 */

//@SessionAttributes("loginUser")
@Controller
public class LoginController {

	static Logger logger = LoggerFactory.getLogger(LoginController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Autowired
	accountDAO dao;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(HttpSession ses) {
		System.out.println(ses.getAttribute("loginUser"));
		return "login/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Account account, HttpSession ses, Model model) {
		logger.debug("Account login {}", account);
		Account result = dao.login(account);
		System.out.println(result);
		
		if (result == null) {
			model.addAttribute("loginResult", 0);
		} else if (result.getPassword().equals(account.getPassword())) {
//			model.addAttribute("loginUser", account.getId());
			ses.setAttribute("loginUser", account.getId()); // 세션에 저장
			model.addAttribute("loginResult", 1);
		} else {
			model.addAttribute("loginResult", 2);
		}

		return "login/login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {

		return "login/register";
	}

	@ResponseBody
	@RequestMapping(value = "/checkid", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String checkid(String id) {
		logger.debug("checkid id {}", id);

		String result = dao.checkid(id);

		String message = null;
		if (result == null) {
			message = "없는 아이디입니다.";
		} else {
			message = "아이디가 있습니다.";
		}

		return message;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Account account, Model model) {
		int result = dao.register(account);
		System.out.println(result);

		if (result == 0) {
			model.addAttribute("registerResult", 0);
		} else {
			model.addAttribute("registerResult", 1);
		}
		return "login/login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession ses) {
		ses.removeAttribute("loginUser");
		ses.invalidate();
		return "login/login";
	}

}
