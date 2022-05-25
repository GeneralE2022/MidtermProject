package com.skilldistillery.neighborgood.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.neighborgood.data.DeedDAO;
import com.skilldistillery.neighborgood.data.DeedTransactionDAO;
import com.skilldistillery.neighborgood.data.SubcategoryDAO;
import com.skilldistillery.neighborgood.data.UserDAO;
import com.skilldistillery.neighborgood.entities.Deed;
import com.skilldistillery.neighborgood.entities.DeedTransaction;

@Controller
public class DeedController {

	@Lazy
	@Autowired
	private DeedDAO deedDao;
	
	@Lazy
	@Autowired
	private SubcategoryDAO subcategoryDao;
	
	@Lazy
	@Autowired
	private UserDAO userDao;
	
	@Lazy
	@Autowired
	private DeedTransactionDAO dtDao;
	
	@RequestMapping(path = "requestCreateDeed.do")
	public String requestCreateDeed() {
		
		return "deedCreate";
	}
	
	@RequestMapping(path = "deedView.do")
	public String viewDeed(Model m, int deedId) {
		Deed deed = deedDao.findDeedById(deedId);
		DeedTransaction dt = dtDao.findDeedTransactionByDeedId(deedId);
		m.addAttribute("deed", deed);
		m.addAttribute("deedTransaction", dt);
		
		return "deedView";
	}

	@RequestMapping(path = "createDeed.do")
	public String createNewDeed(String title, String description, int subcategory, int provider, Model model, HttpSession session) {
		DeedTransaction newDt = new DeedTransaction();
		boolean newDeedCreated = false;
		/* 
		 * Subcategory_id can be pulled from the page by giving the user a subcat menu. 
		 * Provider_id I think will need to be pulled directly from the session object,
		 * since it will contain the active user's id who is creating the Deed.
		 */
		Deed deed = new Deed();
		deed.setTitle(title);
		deed.setDescription(description);
		deed.setSubcategory(subcategoryDao.findSubcategoryById(subcategory));
		deed.setProvider(userDao.findUserById(provider));
		session.setAttribute("sessionProviderId", session);
		Deed newDeed = deedDao.createNewDeed(deed);
		newDeedCreated = newDeed != null;
		if (newDeedCreated) {
			newDt = dtDao.createDeedTransaction(newDeed);
		}
		model.addAttribute("deedTransaction", newDt);
		model.addAttribute("deed", newDeed);
		model.addAttribute("newDeedCreated", newDeedCreated);
		return "deedView";
	}
	
	@RequestMapping(path = "requestDeedUpdate.do") // When user clicks "update this deed"
	public String updateDeed(int deedId, Model model) {
		System.out.println(deedId);
		Deed deedBeingUpdated = deedDao.findDeedById(deedId);
//		
		model.addAttribute("deedBeingUpdated", deedBeingUpdated);
		return "deedUpdate"; // User is taken to a dedicated JSP with input forms to change deed details
	}
	
	@RequestMapping(path = "runDeedUpdate.do") // When user clicks "Save Updates" etc after making changes on updatingDeed.jsp
	public String runDeedUpdate(int deedId, String description, String title, int subcategory, int provider, Model model) {
		Deed deedWithUpdates = new Deed();
		deedWithUpdates.setDescription(description);
		deedWithUpdates.setTitle(title);
		deedWithUpdates.setProvider(userDao.findUserById(provider));
		deedWithUpdates.setSubcategory(subcategoryDao.findSubcategoryById(subcategory));
		
		
		Deed updatedDbDeed = deedDao.updateDeed(deedId, deedWithUpdates);
		model.addAttribute("deed", updatedDbDeed); 
		return "deedView"; 
	}
	
	@RequestMapping(path = "runDeedDestroy.do")
	public String requestDeedDestroy(int deedId, Model m) {
		boolean destroyed = deedDao.destroyDeed(deedId);
		m.addAttribute("destroyed", destroyed);
		return "deedDestroyed";
	}

}