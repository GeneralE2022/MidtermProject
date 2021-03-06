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

class DeedTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private static Deed deed;

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
		deed = em.find(Deed.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		deed = null;
	}

	@Test
	void test_field_mappings() {
		assertNotNull(deed);
		assertEquals("Happy weeder", deed.getTitle());
	}
	
	@Test
	void test_subcategory_mappings() {
		assertNotNull(deed);
		assertEquals(21, deed.getSubcategory().getId());
	}
	
	@Test
	void test_provider_mappings() {
		assertNotNull(deed);
		assertEquals(2, deed.getProvider().getId());
	}
	

	}

