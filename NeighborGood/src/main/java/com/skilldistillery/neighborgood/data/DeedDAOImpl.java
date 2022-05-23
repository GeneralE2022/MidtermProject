package com.skilldistillery.neighborgood.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.neighborgood.entities.Deed;

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

			/*
			 * TODO: command to update the deed's Category Note on above: I am not sure this
			 * is necessary since our Deed table doesn't touch so maybe there is an easy way
			 * to do b/w those two tables/POJOs
			 */
		}
		return dbDeed;
	}

	@Override
	public boolean destroyDeed(int id) {

		boolean destroyed = false;

		Deed deedToRemove = em.find(Deed.class, id);

		em.remove(deedToRemove);

		if (deedToRemove == null) {
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
}
