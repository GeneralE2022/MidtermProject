package com.skilldistillery.neighborgood.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.neighborgood.data.UserDAO;
import com.skilldistillery.neighborgood.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("DEBUG", userDao.findById(1));

		return "index";
	}

	@RequestMapping(path = "registration.do")
	public String createNewUser(User user, Model model) { 
		boolean newUserCreated = false;  
		User newUser = userDao.createNewUser(user); 
		model.addAttribute("newUser", newUser);
		newUserCreated = newUser != null;
		model.addAttribute("newUserCreated", newUserCreated); 
		return "index"; 
	}
}