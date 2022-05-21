package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.User;

public interface UserDAO {
	
	public User create(User user);
	public User update(int id, User user);
	public boolean destroy(int id);

}