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
import com.skilldistillery.neighborgood.data.SubcategoryDAO;
import com.skilldistillery.neighborgood.data.UserDAO;
import com.skilldistillery.neighborgood.entities.Contact;
import com.skilldistillery.neighborgood.entities.Deed;
import com.skilldistillery.neighborgood.entities.Subcategory;
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

	@Lazy
	@Autowired
	private SubcategoryDAO subcategoryDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {

		List<Subcategory> subcategories = subcategoryDao.findAllSubcategories();
		model.addAttribute("subcategories", subcategories);

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
		List<Subcategory> subcategories = subcategoryDao.findAllSubcategories();
		model.addAttribute("subcategories", subcategories);

		List<Deed> deeds = deedDao.findAllDeeds();
		model.addAttribute("deeds", deeds);
		return "index";
	}

	@RequestMapping(path = "updateProfile.do")
	public String updateUser(Integer existingId, User user, Contact contact, HttpSession session, Model m) {

		User updateUser = userDao.updateUser(existingId, user);
		Contact updateContact = contactDao.updateContact(updateUser.getContact().getId(), contact);

		m.addAttribute("updateUser", updateUser);
		m.addAttribute("updateContact", updateContact);
		session.setAttribute("loggedInUser", userDao.findUserById(existingId));
		return "redirect:profileUpdateSuccess.do";
	}

	@RequestMapping(path = "profileUpdateSuccess.do")
	public String updateProfileRedirect() {

		return "profileUpdateSuccess";
	}

	@RequestMapping(path = "account.do")
	public String goToAccount(Model model, HttpSession session) {
		Integer id = (Integer) session.getAttribute("loggedInUserId");
		Contact contact = contactDao.findContactByUserId(id);
		List<Deed> deeds = deedDao.findDeedsByProviderId(id);
		List<Deed> deedsR = deedDao.findDeedsByRecipientId(id);

		model.addAttribute("contact", contact);
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

	@RequestMapping(path = "accountDeactivated.do")
	public String deactivateRedirect() {
		return "accountDeactivated";
	}

	@RequestMapping(path = "adminOnly.do")
	public String adminOnly(HttpSession session, Model m) {
		User user = (User) session.getAttribute("loggedInUser");
		System.out.println(user);

		if (user.getRole().equals("admin")) {
			List<User> users = userDao.findAllUsers();
			List<Deed> deeds = deedDao.findAllDeeds();
			m.addAttribute("deeds", deeds);
			m.addAttribute("adminUser", user);
			m.addAttribute("users", users);
			return "adminOnly";
		} else {
			return "index";
		}
	}
		
	@RequestMapping(path = "deactivateUser.do")
	public String deactivateUser(int uid, Model m) {
		boolean deactivated = false;
		deactivated = userDao.deactivateUser(uid);
		m.addAttribute("deactivated", deactivated);
		return "accountDeactivated";
	}
	
	@RequestMapping(path = "reactivateUser.do")
	public String reactivateUser(int uid, Model m) {
		boolean reactivated = false;
		reactivated = userDao.reactivateUser(uid);
		m.addAttribute("reactivated", reactivated);
		return "accountReactivated";
	}
	
	@RequestMapping(path = "destroyUser.do")
	public String destroyUser(int uid, Model m) {
		boolean destroyed = userDao.destroyUser(uid);
		m.addAttribute("destroyed", destroyed);
		return "userDestroyed";
	}

}