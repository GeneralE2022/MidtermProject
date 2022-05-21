package com.skilldistillery.neighborgood.controllers;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.neighborgood.data.UserDAO;
import com.skilldistillery.neighborgood.entities.User;

@Controller
public class LoginController {

	@Autowired
	private UserDAO userDao;

//	@RequestMapping(path = "login.do", method = RequestMethod.GET)
//	public String goToLogin(HttpSession session) {
//		if (session.getAttribute("loggedInUser") != null) {
//			return "redirect:index";
//		}
//		return "account";
//	}

//	POST login.do attempts to log in the user by retrieving it from the DAO. 
//	If the userName and password match the DAO data, load the User object into session,
//	and redirect to the account page, account.do. 
//	If the login fails, display the login view.

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, HttpSession session) {
//		if (session.getAttribute("loggedInUser") != null) {
//			return "redirect:account";
//		}
		user = userDao.getUserByUserNameAndPassword(user.getUsername(), user.getPassword());
		if (user != null) {
			session.setAttribute("loggedInUser", user);
			session.setAttribute("loginTime", LocalDateTime.now());
			return "redirect:test";
		} else {
			System.out.println(user);
			return "account";
		}
	}

//	logout.do removes the user from session and redirects to index.do.
	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "redirect:account";
	}

//	@RequestMapping(path="logout.do")
//	public ModelAndView logout(HttpSession session) {
//		session.removeAttribute("loggedInUser");
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("redirect:index.do");
//		return mv;
//	}

	public boolean sessionTimedOut(HttpSession session) {
		LocalDateTime loginTime = (LocalDateTime) session.getAttribute("loginTime");
		if (java.time.Duration.between(loginTime, LocalDateTime.now()).getSeconds() > 60 * 30) {
			return true;
		}
		return false;
	}

}
