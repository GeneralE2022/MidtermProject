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
	public String createNewUser(String username, String password, String role, String firstName, String lastName, Model model) { //TODO need params from JSP, probably 
		User newUser = new User();
		newUser.setUsername(username);
		newUser.setPassword(password);
		newUser.setActive(1);
		newUser.setRole(role);
		newUser.setFirstName(firstName);
		newUser.setLastName(lastName);
		userDao.createNewUser(newUser);

		return "account"; 
	}
}
