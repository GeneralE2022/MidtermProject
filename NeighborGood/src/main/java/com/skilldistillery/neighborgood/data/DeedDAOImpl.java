package com.skilldistillery.neighborgood.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.neighborgood.entities.Deed;
import com.skilldistillery.neighborgood.entities.DeedTransaction;

@Transactional
@Service
public class DeedDAOImpl implements DeedDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Deed createNewDeed(Deed deed) {
		em.persist(deed);
		em.flush();
		return deed;
	}

	@Override
	public Deed updateDeed(int id, Deed deedWithUpdates) {

		Deed dbDeed = em.find(Deed.class, id);

		if (dbDeed != null) {
			dbDeed.setTitle(deedWithUpdates.getTitle());
			dbDeed.setDescription(deedWithUpdates.getDescription());
			dbDeed.setProvider(deedWithUpdates.getProvider());
			dbDeed.setSubcategory(deedWithUpdates.getSubcategory());
		}
		return dbDeed;
	}

	@Override
	public boolean destroyDeed(int id) {

		boolean destroyed = false;
		boolean dtDestroyed = false;

		DeedTransaction dtToRemove = em.find(DeedTransaction.class, id);

		Deed deedToRemove = em.find(Deed.class, id);
		em.remove(dtToRemove);
		if (dtToRemove != null) {
			dtDestroyed = !em.contains(dtToRemove);
			if (dtDestroyed) {
				em.remove(deedToRemove);
			}
		}

		if (deedToRemove != null) {
			destroyed = !em.contains(deedToRemove);
			System.out.println("Remove success");
		}

		return destroyed;
	}

	@Override
	public Deed findDeedById(int id) {
		Deed foundDeed = em.find(Deed.class, id);
		return foundDeed;
	}

	@Override
	public List<Deed> findAllDeeds() {
		String jpql = "SELECT d FROM Deed d";
		List<Deed> deeds;
		deeds = em.createQuery(jpql, Deed.class).getResultList();
		return deeds;
	}

	@Override
	public List<Deed> findDeedsByProviderId(int id) {
		String jpql = "SELECT d FROM Deed d WHERE d.provider = " + id;
		List<Deed> deeds;
		deeds = em.createQuery(jpql, Deed.class).getResultList();
		return deeds;
	}

	@Override
	public List<Deed> findDeedsByRecipientId(int id) {
		String jpql = "SELECT d FROM Deed d JOIN DeedTransaction t ON t.deed = d.id "
				+ "JOIN User u ON u.id = t.recipient WHERE u.id = " + id;
		List<Deed> deeds;
		deeds = em.createQuery(jpql, Deed.class).getResultList();
		return deeds;
	}
}
