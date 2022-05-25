package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.Deed;
import com.skilldistillery.neighborgood.entities.DeedTransaction;

public interface DeedTransactionDAO {
	
	public DeedTransaction createDeedTransaction(Deed deed);
	public DeedTransaction updateDeedTransaction(int id, DeedTransaction dt);
	public DeedTransaction findDeedTransactionByDeedId(int id);
	public boolean destroyDeedTransaction(int id);

}