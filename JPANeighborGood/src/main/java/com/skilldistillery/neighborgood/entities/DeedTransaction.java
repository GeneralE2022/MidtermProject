package com.skilldistillery.neighborgood.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="deed_transaction")
public class DeedTransaction {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="deed_id")
	private Deed deed;
	
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

	public Deed getDeedId() {
		return deed;
	}

	public void setDeedId(Deed deed) {
		this.deed = deed;
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
		return "DeedTransaction [id=" + id + ", deed=" + deed + ", recipientId=" + recipientId + ", providedDate="
				+ providedDate + "]";
	}
	
	

}
