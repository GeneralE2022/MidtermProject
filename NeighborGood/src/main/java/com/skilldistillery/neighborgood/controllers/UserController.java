package com.skilldistillery.neighborgood.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.neighborgood.data.ContactDAO;
import com.skilldistillery.neighborgood.data.DeedDAO;
import com.skilldistillery.neighborgood.data.UserDAO;
import com.skilldistillery.neighborgood.entities.Contact;
import com.skilldistillery.neighborgood.entities.Deed;
import com.skilldistillery.neighborgood.entities.User;

@Controller
public class UserController {

	@Lazy
	@Autowired
	private UserDAO userDao;

	@Lazy
	@Autowired
	private ContactDAO contactDao;
	
	@Lazy
	@Autowired
	private DeedDAO deedDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		List<Deed> deeds = deedDao.findAllDeeds(); 
		model.addAttribute("deeds", deeds); 
		return "index";
	}

	@RequestMapping(path = "registration.do")
	public String createNewUser(User user, Contact contact, Model model) {
		boolean newUserCreated = false;
		user.setActive(1);
		user.setRole("user");
		User newUser = userDao.createNewUser(user);
		model.addAttribute("newUser", newUser);
		newUserCreated = (newUser != null);
		model.addAttribute("newUserCreated", newUserCreated);

		contact.setUser(newUser);

		Contact newContact = contactDao.createNewContact(contact);
		model.addAttribute("newContact", newContact);
		return "index";
	}

	@RequestMapping(path = "updateProfile.do")
	public String updateUser(Integer existingId, User user, Contact contact, HttpSession session, Model m) {
		
		User updateUser = userDao.updateUser(existingId, user); 
		Contact updateContact = contactDao.updateContact(updateUser.getId(), contact); 

		m.addAttribute("updateUser", updateUser); 
		System.out.println(updateUser);
		m.addAttribute("updateContact", updateContact); 
//		System.out.println(updateContact.toString());
		
		return "profileUpdateSuccess";
	}
	
	@RequestMapping(path = "account.do")
	public String goToAccount(Model model, HttpSession session) {
		Integer id = (Integer) session.getAttribute("loggedInUserId"); 
		List<Deed> deeds = deedDao.findDeedsByProviderId(id); 
		List<Deed> deedsR = deedDao.findDeedsByRecipientId(id); 
		model.addAttribute("deeds", deeds); 
		model.addAttribute("deedsR", deedsR); 
		return "account";
	}
	
	@RequestMapping(path = "deactivateAccount.do")
	public String deactviateUser(int deactivateId, Model m, HttpSession session) {
		
		boolean deactivated = userDao.deactivateUser(deactivateId);
		if (deactivated) {
			session.removeAttribute("loggedInUser");
			session.removeAttribute("loggedInUserId");
			session.removeAttribute("loggedInUserContact");
			session.removeAttribute("loginTime");
//			session.invalidate(); //TODO maybe good for "back button" problem
		}
		m.addAttribute("deactivated", deactivated);
		return "redirect:accountDeactivated.do";
	}
	
	@RequestMapping(path ="accountDeactivated.do")
	public String deactivateRedirect() {
		return "accountDeactivated";
	}


}