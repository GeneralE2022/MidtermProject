package com.skilldistillery.neighborgood.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.neighborgood.entities.Deed;
import com.skilldistillery.neighborgood.entities.DeedTransaction;

@Transactional
@Service
public class DeedTransactionDAOImpl implements DeedTransactionDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public DeedTransaction createDeedTransaction(Deed deed) {
		DeedTransaction dt = new DeedTransaction();
		dt.setDeed(deed);
		em.persist(dt);
		em.flush();

		return dt;
	}

	@Override
	public DeedTransaction updateDeedTransaction(int id, DeedTransaction dtWithUpdates) {
		DeedTransaction dbDeedTransaction = em.find(DeedTransaction.class, id);

		if (dbDeedTransaction != null) {
			dbDeedTransaction.setDeed(dtWithUpdates.getDeed());
			dbDeedTransaction.setProvidedDate(dtWithUpdates.getProvidedDate());
			dbDeedTransaction.setRecipient(dtWithUpdates.getRecipient());

		}

		return dbDeedTransaction;
	}

	@Override
	public boolean destroyDeedTransaction(int id) {
		boolean destroyed = false;

		DeedTransaction dtToRemove = em.find(DeedTransaction.class, id);
		em.remove(dtToRemove);
		if (dtToRemove != null) {
			destroyed = !em.contains(dtToRemove);
		}
		return destroyed;
	}

	@Override
	public DeedTransaction findDeedTransactionByDeedId(int id) {
		String jpql = "SELECT t FROM DeedTransaction t WHERE t.deed = " + id;
		DeedTransaction dt = em.createQuery(jpql, DeedTransaction.class).getSingleResult();
		return dt;
	}

}
