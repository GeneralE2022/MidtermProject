package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.User;

public interface UserDAO {

	User findById (int userId); 
	User findByUsernameAndPassword(String username, String password); 
	
}
