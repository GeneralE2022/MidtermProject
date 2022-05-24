package com.skilldistillery.neighborgood.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.neighborgood.entities.Contact;
import com.skilldistillery.neighborgood.entities.Subcategory;

@Transactional
@Service
public class SubcategoryDAOImpl implements SubcategoryDAO {

	@PersistenceContext
	private EntityManager em;

	

	@Override
	public Subcategory findSubcategoryById(int id) {
		Subcategory subcategory = em.find(Subcategory.class, id);
		return subcategory;
	}

	@Override
	public Subcategory createSubcategory(Subcategory subcategory) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Subcategory updateSubcategory(int id, Subcategory subcategory) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean destroySubcategory(int id) {
		// TODO Auto-generated method stub
		return false;
	}
}