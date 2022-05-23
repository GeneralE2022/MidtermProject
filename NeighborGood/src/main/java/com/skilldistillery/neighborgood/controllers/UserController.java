package com.skilldistillery.neighborgood.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.neighborgood.data.ContactDAO;
import com.skilldistillery.neighborgood.data.UserDAO;
import com.skilldistillery.neighborgood.entities.Contact;
import com.skilldistillery.neighborgood.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private ContactDAO contactDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("DEBUG", userDao.findById(1));

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
	
	@RequestMapping(path = "update.do")
	public String updateUser(User user, Contact contact, Model model) {
		
		User updateUser = new User();
		Contact updateContact = new Contact();
		
		updateUser.setId(user.getId());
		updateContact.setId(user.getId());
		
		updateUser.setFirstName(user.getFirstName());
		updateUser.setLastName(user.getLastName());
		updateUser.setUsername(user.getUsername());
		updateUser.setPassword(user.getPassword());
		
		updateContact.setPhone(contact.getPhone());
		updateContact.setPhone2(contact.getPhone2());
		updateContact.setEmail(contact.getEmail());
		updateContact.setStreet(contact.getStreet());
		updateContact.setCity(contact.getCity());
		updateContact.setState(contact.getState());
		updateContact.setZipCode(contact.getZipCode());
			
		return "account";
	}
	
//	public String destroy(int id) {
//		boolean 
//	}
	
}