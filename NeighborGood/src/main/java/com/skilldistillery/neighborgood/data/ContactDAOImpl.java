package com.skilldistillery.neighborgood.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.neighborgood.entities.Contact;

@Transactional
@Service
public class ContactDAOImpl implements ContactDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Contact createNewContact(Contact contact) {
		em.persist(contact);
		em.flush();
		return contact;
	}

	@Override
	public Contact updateContact(int id, Contact contact) {

		Contact dbContact = em.find(Contact.class, id);

		if (dbContact != null) {
			dbContact.setStreet(contact.getStreet());
			dbContact.setCity(contact.getCity());
			dbContact.setState(contact.getState());
			dbContact.setPhone(contact.getPhone());
			dbContact.setPhone2(contact.getPhone2());
			dbContact.setEmail(contact.getEmail());
			dbContact.setZipCode(contact.getZipCode());
		}

		return dbContact;
	}

	public Contact findById(int id) {
		Contact contact = em.find(Contact.class, id);
		return contact;
	}

	public Contact findContactByUserId(int userId) {
		Contact contact = new Contact();
		String JPQL = "SELECT c FROM Contact c WHERE user_id = " + userId;
		contact = em.createQuery(JPQL, Contact.class).getSingleResult();

		return contact;
	}
}