package com.skilldistillery.neighborgood.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ContactTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private static Contact contact;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPANeighborGood");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		contact = em.find(Contact.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		contact = null;
	}

	@Test
	void test_field_mappings() {
		assertNotNull(contact);
		assertEquals("admin@neighborgood.com", contact.getEmail());
		assertEquals("00 Nowhere Ln", contact.getStreet());
	}
	
	@Test
	void test_user_mappings() {
		assertNotNull(contact);
		assertEquals("admin", contact.getUser().getFirstName());
		
	}

}
