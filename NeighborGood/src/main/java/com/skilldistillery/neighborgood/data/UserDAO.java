package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.User;

public interface UserDAO {
	
	public User createNewUser(User newUser);
	public User updateUser(int id, User user);
	public User deleteUser();
	public boolean destroy(int id);
	public Object findById(int i);
	public User getUserByUserNameAndPassword(String username, String password);
	
}