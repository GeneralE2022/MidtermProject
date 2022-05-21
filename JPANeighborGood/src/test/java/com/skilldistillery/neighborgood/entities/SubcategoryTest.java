package com.skilldistillery.neighborgood.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.time.Month;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class SubcategoryTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private static Subcategory sub;

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
		sub = em.find(Subcategory.class, 21);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		sub = null;
	}

	@Test
	void test_field_mappings() {
		assertNotNull(sub);
		assertEquals("Weeding", sub.getTitle());
	}
	
	@Test
	void test_category_mappings() {
		assertNotNull(sub);
		assertEquals(20, sub.getCategory().getId());
	}
}
