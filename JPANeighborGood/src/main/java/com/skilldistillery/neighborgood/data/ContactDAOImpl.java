package com.skilldistillery.neighborgood.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.neighborgood.entities.Contact;

public class ContactDAOImpl implements ContactDAO {

	@Override
	public Contact create(Contact contact) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPANeighborGood");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(contact);
		em.flush();
		em.getTransaction().commit();
		em.clear();
		em.close();
		emf.close();
		return contact;
	}

	@Override
	public Contact update(int id, Contact contact) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPANeighborGood");
		EntityManager em = emf.createEntityManager();

		Contact dbContact = em.find(Contact.class, id);

		if (dbContact != null) {
			em.getTransaction().begin();
			dbContact.setStreet(contact.getStreet());
			dbContact.setCity(contact.getCity());
			dbContact.setState(contact.getState());
			dbContact.setPhone(contact.getPhone());
			dbContact.setPhone2(contact.getPhone2());
			dbContact.setEmail(contact.getEmail());
			dbContact.setZipCode(contact.getZipCode());
			em.getTransaction().commit();
		}
		
		em.clear();
		em.close();
		emf.close();
		return dbContact;
	}

	@Override
	public boolean destroy(int id) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPANeighborGood");
		EntityManager em = emf.createEntityManager();

		boolean destroyed = false;

		Contact contactToRemove = em.find(Contact.class, id);
		em.getTransaction().begin();

		em.remove(contactToRemove);

		if (contactToRemove == null) {
			destroyed = !em.contains(contactToRemove);
			System.out.println("Remove success");
		}

		em.getTransaction().commit();

		em.clear();
		em.close();
		emf.close();
		return destroyed;

	}
}