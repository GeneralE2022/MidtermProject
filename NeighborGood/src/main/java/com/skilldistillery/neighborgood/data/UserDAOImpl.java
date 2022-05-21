package com.skilldistillery.neighborgood.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.neighborgood.entities.User;

@Transactional
@Service
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;


	@Override
	public User createNewUser(User newUser) {
		em.persist(newUser);
		em.flush();
		return newUser;
	}

	@Override
	public User update(int id, User user) {

		User dbUser = em.find(User.class, id);

		if (dbUser != null) {
			dbUser.setFirstName(user.getFirstName());
			dbUser.setLastName(user.getLastName());
			dbUser.setUsername(user.getUsername());
			dbUser.setPassword(user.getPassword());
		}
		return dbUser;
	}

	@Override
	public boolean destroy(int id) {

		boolean destroyed = false;

		User userToRemove = em.find(User.class, id);

		em.remove(userToRemove);

		if (userToRemove == null) {
			destroyed = !em.contains(userToRemove);
			System.out.println("Remove success");
		}

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
