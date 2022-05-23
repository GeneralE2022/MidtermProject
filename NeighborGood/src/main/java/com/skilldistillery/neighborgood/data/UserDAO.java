package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.User;

public interface UserDAO {
	
	public User createNewUser(User newUser);
	User updateUser(int id, User user);
	User deleteUser();
	public boolean destroy(int id);
	public Object findById(int i);
	User getUserByUserNameAndPassword(String username, String password);
	
}