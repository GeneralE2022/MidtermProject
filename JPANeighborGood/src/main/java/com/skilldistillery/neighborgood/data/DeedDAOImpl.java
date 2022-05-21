package com.skilldistillery.neighborgood.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.neighborgood.entities.Deed;

public class DeedDAOImpl implements DeedDAO {

	@Override
	public Deed create(Deed deed) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPANeighborGood");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(deed);
		em.flush();
		em.getTransaction().commit();
		em.clear();
		em.close();
		emf.close();
		return deed;
	}

	@Override
	public Deed update(int id, Deed deed) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPANeighborGood");
		EntityManager em = emf.createEntityManager();

		Deed dbDeed = em.find(Deed.class, id);

		if (dbDeed != null) {
			em.getTransaction().begin();
			dbDeed.setTitle(deed.getTitle());
			dbDeed.setDescription(deed.getDescription());
			dbDeed.setSubcategory(deed.getSubcategory());
			
			// TODO: command to update the deed's Category 
			
			em.getTransaction().commit();
		}
		em.clear();
		em.close();
		emf.close();
		return dbDeed;
	}

	@Override
	public boolean destroy(int id) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPANeighborGood");
		EntityManager em = emf.createEntityManager();

		boolean destroyed = false;

		Deed deedToRemove = em.find(Deed.class, id);
		em.getTransaction().begin();

		em.remove(deedToRemove);

		if (deedToRemove == null) {
			destroyed = !em.contains(deedToRemove);
			System.out.println("Remove success");
		}

		em.getTransaction().commit();

		em.clear();
		em.close();
		emf.close();
		return destroyed;

	}
}
