package com.skilldistillery.neighborgood.controllers;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.neighborgood.data.ContactDAOImpl;
import com.skilldistillery.neighborgood.data.SubcategoryDAOImpl;
import com.skilldistillery.neighborgood.data.UserDAOImpl;
import com.skilldistillery.neighborgood.entities.User;

@Controller
public class SubcategoryController {

	@Autowired
	private UserDAOImpl userDao;
	
	@Autowired
	private ContactDAOImpl contactDao;
	
	@Autowired
	private SubcategoryDAOImpl subDao;

	
	
	
	
}
