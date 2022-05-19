package com.skilldistillery.neighborgood.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.neighborgood.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao; 
}
