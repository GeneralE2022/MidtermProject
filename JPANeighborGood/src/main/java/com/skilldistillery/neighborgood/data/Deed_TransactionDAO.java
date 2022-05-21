package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.DeedTransaction;

public interface Deed_TransactionDAO {
	
	public DeedTransaction create(DeedTransaction dt);
	public DeedTransaction update(int id, DeedTransaction dt);
	public boolean destroy(int id);

}