package com.skilldistillery.neighborgood.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;

import com.skilldistillery.neighborgood.data.DeedTransactionDAO;

@Controller
public class DeedTransactionController {

	@Lazy
	@Autowired
	private DeedTransactionDAO dtDao;
	
	

}