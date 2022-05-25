package com.skilldistillery.neighborgood.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.neighborgood.data.DeedDAO;
import com.skilldistillery.neighborgood.data.DeedTransactionDAO;
import com.skilldistillery.neighborgood.entities.Deed;
import com.skilldistillery.neighborgood.entities.DeedTransaction;
import com.skilldistillery.neighborgood.entities.User;

@Controller
public class DeedTransactionController {

	@Lazy
	@Autowired
	private DeedTransactionDAO dtDao;
	
	@Lazy
	@Autowired
	private DeedDAO deedDao;
	
	@RequestMapping(path = "claimDeed.do")
	public String claimDeed(Integer deedId, HttpSession session, Model m) {
		DeedTransaction updated = new DeedTransaction();
		User user = (User) session.getAttribute("loggedInUser");
		Deed beingClaimed = deedDao.findDeedById(deedId);
		
		updated = dtDao.claimDeed(beingClaimed, user);
		m.addAttribute("deed", beingClaimed);
		m.addAttribute("deedTransaction", updated);
		
		
		return "redirect:deedViewRe.do"; //TODO fix to JSP
	}
	
	

}