package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.Deed;

public interface DeedDAO {
	
	public Deed findDeedById(int id);
	public Deed createNewDeed(Deed deed);
	public Deed updateDeed(int id, Deed deed);
	public boolean destroyDeed(int id);

}