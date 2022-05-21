package com.skilldistillery.neighborgood.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {

	/*
	 * Update AccountController - add methods for the URL account.do.
	 * 
	 * If the user is logged in (i.e. in session), display the account view. If the
	 * user is not logged in, the page redirects to login.do.
	 */
	@RequestMapping(path = "account.do")
	public String goToProfile(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "account";
		} else {
			return "redirect:login.do";
		}
	}

}
