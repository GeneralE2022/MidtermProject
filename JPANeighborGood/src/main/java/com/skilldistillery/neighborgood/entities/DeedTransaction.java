package com.skilldistillery.neighborgood.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DeedTransaction {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="deed_id")
	private int deedId;
	
	@Column(name="recipient_id")
	private int recipientId;
	
	@Column(name="provided_date")
	private LocalDate providedDate;

	public DeedTransaction() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDeedId() {
		return deedId;
	}

	public void setDeedId(int deedId) {
		this.deedId = deedId;
	}

	public int getRecipientId() {
		return recipientId;
	}

	public void setRecipientId(int recipientId) {
		this.recipientId = recipientId;
	}

	public LocalDate getProvidedDate() {
		return providedDate;
	}

	public void setProvidedDate(LocalDate providedDate) {
		this.providedDate = providedDate;
	}

	@Override
	public String toString() {
		return "DeedTransaction [id=" + id + ", deedId=" + deedId + ", recipientId=" + recipientId + ", providedDate="
				+ providedDate + "]";
	}
	
	

}
