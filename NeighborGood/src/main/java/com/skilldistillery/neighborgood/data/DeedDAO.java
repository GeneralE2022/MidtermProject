package com.skilldistillery.neighborgood.data;

import com.skilldistillery.neighborgood.entities.Deed;

public interface DeedDAO {
	
	public Deed create(Deed deed);
	public Deed update(int id, Deed deed);
	public boolean destroy(int id);

}