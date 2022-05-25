package com.skilldistillery.neighborgood.controllers;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.neighborgood.data.ContactDAOImpl;
import com.skilldistillery.neighborgood.data.DeedDAOImpl;
import com.skilldistillery.neighborgood.data.UserDAOImpl;
import com.skilldistillery.neighborgood.entities.Contact;
import com.skilldistillery.neighborgood.entities.Deed;
import com.skilldistillery.neighborgood.entities.User;

@Controller
public class LoginController {

	@Lazy
	@Autowired
	private UserDAOImpl userDao;

	@Lazy
	@Autowired
	private ContactDAOImpl contactDao;

	@Lazy
	@Autowired
	private DeedDAOImpl deedDao;

//	GET/POST login.do - If a user is logged in and requests login.do, they should be redirected to index.do.
//	GET login.do displays the login view.
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String goToLogin(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "redirect:index.do";
		}
		return "login";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, HttpSession session, Model model) {
		if (session.getAttribute("loggedInUser") != null) {
			return "redirect:index.do";
		}
		user = userDao.getUserByUserNameAndPassword(user.getUsername(), user.getPassword());
		if (user != null) {
			if (user.getActive() != 1) {
				model.addAttribute("deactivated", true);
				return "accountDeactivated";
			} else {

				session.setAttribute("loggedInUser", user);
				session.setAttribute("loggedInUserId", user.getId());
				session.setAttribute("loginTime", LocalDateTime.now());

				return "redirect:accountRedirect.do";
			}
		} else {
			return "index";
		}
	}

	@RequestMapping(path = "accountRedirect.do")
	public String redirectAccount(HttpSession session, Model m) {
		Integer id = (Integer) session.getAttribute("loggedInUserId");
		Contact contact = contactDao.findContactByUserId(id); 
		List<Deed> deeds = deedDao.findDeedsByProviderId(id);
		List<Deed> deedsR = deedDao.findDeedsByRecipientId(id);
		m.addAttribute("contact", contact); 
		m.addAttribute("deeds", deeds);
		m.addAttribute("deedsR", deedsR);
		return "account";
	}

//	logout.do removes the user from session and redirects to index.do.
	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "index";
	}

	@RequestMapping(path = "registration.do", method = RequestMethod.GET)
	public String goToRegistration() {
		return "registration";
	}

	public boolean sessionTimedOut(HttpSession session) {
		LocalDateTime loginTime = (LocalDateTime) session.getAttribute("loginTime");
		if (java.time.Duration.between(loginTime, LocalDateTime.now()).getSeconds() > 60 * 30) {
			return true;
		}
		return false;
	}

}
