package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.Subcategory;

public interface SubcategoryDAO {
	
	public Subcategory createSubcategory(Subcategory subcategory);
	public Subcategory updateSubcategory(int id, Subcategory subcategory);
	public Subcategory findSubcategoryById(int id);
	public boolean destroySubcategory(int id);

}