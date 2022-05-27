package com.skilldistillery.neighborgood.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.neighborgood.data.DeedDAO;
import com.skilldistillery.neighborgood.data.DeedTransactionDAO;
import com.skilldistillery.neighborgood.data.UserDAO;
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
	
	@Lazy
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = "claimDeed.do")
	public String claimDeed(Integer deedId, HttpSession session, Model m) {
		DeedTransaction updated = new DeedTransaction();
		User user = (User) session.getAttribute("loggedInUser");
		Deed beingClaimed = deedDao.findDeedById(deedId);
		
		updated = dtDao.claimDeed(beingClaimed, user);
		System.out.println(updated.toString());
		System.out.println(beingClaimed.toString());
		m.addAttribute("deed", beingClaimed);
		m.addAttribute("deedTransaction", updated);
//		session.setAttribute("loggedInUser", userDao.findUserById(user.getId()));
		return "deedView"; //TODO fix to JSP
	}
	
	@RequestMapping(path = "deedComplete.do")
	public String deedComplete(@RequestParam(name = "dtid1") int dtid, Model m) {
		DeedTransaction dt = dtDao.markDeedAsCompleted(dtid); 
		Deed deed = deedDao.findDeedById(dt.getDeedId()); 
		m.addAttribute("deedTransaction", dt); 
		m.addAttribute("deed", deed); 
		return "deedView"; 
	}
}