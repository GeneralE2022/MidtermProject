package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.Deed;
import com.skilldistillery.neighborgood.entities.DeedTransaction;
import com.skilldistillery.neighborgood.entities.User;

public interface DeedTransactionDAO {
	
	public DeedTransaction createDeedTransaction(Deed deed);
	public DeedTransaction updateDeedTransaction(int id, DeedTransaction dt);
	public DeedTransaction findDeedTransactionByDeedId(int id);
	public boolean destroyDeedTransaction(int id);
	public DeedTransaction claimDeed(Deed deedToClaim, User recipient);
	public DeedTransaction markDeedAsCompleted(int id); 
}