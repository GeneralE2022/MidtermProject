package com.skilldistillery.neighborgood.data;

import java.util.List;

import com.skilldistillery.neighborgood.entities.Deed;

public interface DeedDAO {

	public Deed findDeedById(int id);

	public List<Deed> findAllDeeds();

	public List<Deed> findDeedsByProviderId(int id);

	public List<Deed> findDeedsByRecipientId(int id);

	public List<Deed> findDeedsBySubcategoryId(int id);
	
	public Deed createNewDeed(Deed deed);

	public Deed updateDeed(int id, Deed deed);

	public boolean destroyDeed(int id);
	
}