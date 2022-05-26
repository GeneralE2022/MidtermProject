package com.skilldistillery.neighborgood.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.time.Month;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class DeedTransactionTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private static DeedTransaction dt;

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
		dt = em.find(DeedTransaction.class, 10);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		dt = null;
	}

	@Test
	void test_field_mappings() {
		assertNotNull(dt);
		assertEquals(2022, dt.getProvidedDate().getYear());
		assertEquals(Month.APRIL, dt.getProvidedDate().getMonth());
	}
	
	@Test
	void test_deed_mappings() {
		assertNotNull(dt);
		assertEquals(10, dt.getDeedId());
	}
	
	@Test
	void test_user_mappings() {
		assertNotNull(dt);
		assertEquals("awettstein", dt.getRecipient().getPassword());
	}

}
