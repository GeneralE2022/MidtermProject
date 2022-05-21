package com.skilldistillery.neighborgood.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;
	
	@OneToMany(mappedBy = "category")
	private List<Subcategory> subcategories;

	public Category() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public List<Subcategory> getSubcategories() {
		return subcategories;
	}

	public void setSubcategories(List<Subcategory> subcategories) {
		this.subcategories = subcategories;
	}
	
	public void addSubcategory(Subcategory sub) {
		if (subcategories == null) { subcategories = new ArrayList<>();}
		if (!subcategories.contains(sub)) {
			subcategories.add(sub);
		}
	}
	
	public void removeSubcategory(Subcategory sub) {
		if (subcategories != null && subcategories.contains(sub)) {
			subcategories.remove(sub);
		}
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", title=" + title + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, subcategories);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		return id == other.id && Objects.equals(subcategories, other.subcategories);
	}
	
	

}
