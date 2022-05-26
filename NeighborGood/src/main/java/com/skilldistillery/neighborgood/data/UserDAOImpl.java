package com.skilldistillery.neighborgood.data;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.skilldistillery.neighborgood.entities.Contact;
import com.skilldistillery.neighborgood.entities.User;

@Transactional
@Service
public class UserDAOImpl implements UserDAO {

	@Lazy
	@Autowired
	private UserDAO userDao;

	@PersistenceContext
	private EntityManager em;

	private Map<Integer, User> users;

	@Override
	public User createNewUser(User newUser) {
		em.persist(newUser);
		em.flush();
		return newUser;
	}

	@Override
	public User updateUser(int id, User user) {
		User dbUser = em.find(User.class, id);

		if (dbUser != null) {
			dbUser.setFirstName(user.getFirstName());
			dbUser.setLastName(user.getLastName());
			dbUser.setUsername(user.getUsername());
			dbUser.setPassword(user.getPassword());
			em.flush();
		}
		return dbUser;
	}

	@Override
	public User findUserById(int id) {
		User user = em.find(User.class, id);
		return user;
	}

	@Override
	public User getUserByUserNameAndPassword(String username, String password) {
		User u = null;
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :up";
		users = new LinkedHashMap<>();
		User loginUser = em.createQuery(jpql, User.class).setParameter("un", username).setParameter("up", password)
				.getSingleResult();
		users.put(loginUser.getId(), loginUser);
		Set<Integer> keys = users.keySet();
		for (Integer key : keys) {
			User user = users.get(key);
			System.out.println(user.toString());
			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				u = user;
				break;
			}
		}
		return u;
	}

	@Override
	public boolean deactivateUser(int id) {
		User user = userDao.findUserById(id);
		user.setActive(0);
		boolean deactivated = user.getActive() == 0;

		return deactivated;
	}

	@Override
	public List<User> findAllUsers() {
		List<User> users = new ArrayList<>();
		String jpql = "SELECT u FROM User u";
		users = em.createQuery(jpql, User.class).getResultList();
		System.out.println(users != null);
		return users;
	}

	@Override
	public boolean reactivateUser(int uid) {
		User user = userDao.findUserById(uid);
		user.setActive(1);
		boolean reactivated = user.getActive() == 1;

		return reactivated;
	}

	@Override
	public boolean destroyUser(int id) {
		boolean destroyed = false;
		User userToDestroy = em.find(User.class, id);
		Contact contactToDestroy = em.find(Contact.class, userToDestroy.getContact().getId());
		if (userToDestroy != null) {
			em.remove(contactToDestroy);
			
			if (!em.contains(contactToDestroy)) {
				em.remove(userToDestroy);
				destroyed = !em.contains(userToDestroy);
			}
		}

		return destroyed;
	}

}
