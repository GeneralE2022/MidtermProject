package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.User;

public interface UserDAO {
	
	public User createNewUser(User newUser);
	public User updateUser(int id, User user);
	
	public boolean deactivateUser(int id);
	public User findUserById(int i);
	public User getUserByUserNameAndPassword(String username, String password);
	
}