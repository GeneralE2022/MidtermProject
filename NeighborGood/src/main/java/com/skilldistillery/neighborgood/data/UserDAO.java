package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.User;

public interface UserDAO {
	
	public User update(int id, User user);
	public boolean destroy(int id);
	User createNewUser(User newUser);
	public Object findById(int i);
	User getUserByUserNameAndPassword(String username, String password);
}