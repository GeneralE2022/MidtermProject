package com.skilldistillery.neighborgood.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.neighborgood.entities.User;

public class UserDAOImpl implements UserDAO {

	@Override
	public User createNewUser(User newUser) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPANeighborGood");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(newUser);
		em.flush();
		em.getTransaction().commit();
		em.clear();
		em.close();
		emf.close();
		return newUser;
	}

	@Override
	public User update(int id, User user) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPANeighborGood");
		EntityManager em = emf.createEntityManager();

		User dbUser = em.find(User.class, id);

		if (dbUser != null) {
			em.getTransaction().begin();
			dbUser.setFirstName(user.getFirstName());
			dbUser.setLastName(user.getLastName());
			dbUser.setUsername(user.getUsername());
			dbUser.setPassword(user.getPassword());
			em.getTransaction().commit();
		}
		em.clear();
		em.close();
		emf.close();
		return dbUser;
	}

	@Override
	public boolean destroy(int id) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPANeighborGood");
		EntityManager em = emf.createEntityManager();

		boolean destroyed = false;

		User userToRemove = em.find(User.class, id);
		em.getTransaction().begin();

		em.remove(userToRemove);

		if (userToRemove == null) {
			destroyed = !em.contains(userToRemove);
			System.out.println("Remove success");
		}

		em.getTransaction().commit();

		em.clear();
		em.close();
		emf.close();
		return destroyed;

	}

	@Override
	public Object findById(int i) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public User getUserByUserNameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}
}
