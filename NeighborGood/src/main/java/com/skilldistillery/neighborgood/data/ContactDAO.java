package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.Contact;

public interface ContactDAO {
	
	public Contact createNewContact(Contact contact);
	public Contact updateContact(int id, Contact contact);
	public boolean destroy(int id);
	public Contact findById(int id);
}