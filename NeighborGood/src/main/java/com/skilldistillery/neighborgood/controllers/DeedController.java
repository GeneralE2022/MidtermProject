package com.skilldistillery.neighborgood.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.neighborgood.data.DeedDAO;
import com.skilldistillery.neighborgood.entities.Contact;
import com.skilldistillery.neighborgood.entities.Deed;
import com.skilldistillery.neighborgood.entities.User;

@Controller
public class DeedController {

	@Autowired
	private DeedDAO deedDao;

	@RequestMapping(path = "createDeed.do")
	public String createNewDeed(Deed deed, Model model) {
		boolean newDeedCreated = false;
		/* TODO
		 * Subcategory_id can be pulled from the page by giving the user a subcat menu. 
		 * Provider_id I think will need to be pulled directly from the session object,
		 * since it will contain the active user's id who is creating the Deed.
		 */
		Deed newDeed = deedDao.createNewDeed(deed);
		newDeedCreated = newDeed != null;
		model.addAttribute("newDeed", newDeed);
		model.addAttribute("newDeedCreated", newDeedCreated);
		return "index";
	}
	
	@RequestMapping(path = "requestDeedUpdate.do") // When user clicks "update this deed"
	public String updateDeed(int deedId, Model model) {
		Deed deedBeingUpdated = deedDao.findDeedById(deedId);
		
		model.addAttribute("deedBeingUpdated", deedBeingUpdated);
		return "updatingDeed"; // User is taken to a dedicated JSP with input forms to change deed details
	}
	
	@RequestMapping(path = "runDeedUpdate.do") // When user clicks "Save Updates" etc after making changes on updatingDeed.jsp
	public String runDeedUpdate(Deed deedWithUpdates, Model model) {
		Deed updatedDbDeed = deedDao.updateDeed(deedWithUpdates.getId(), deedWithUpdates);
		model.addAttribute("updatedDeed", updatedDbDeed); //TODO We dont' necessarily need a dedicated JSP for updated Deed, could send user back to deed listing where they started.
		return "deedView"; // TODO need name of actual JSP
	}

}