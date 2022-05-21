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
@Table(name = "deed_transaction")
public class DeedTransaction {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "deed_id")
	private Deed deed;

	@ManyToOne
	@JoinColumn(name = "recipient_id")
	private User recipient;

	@Column(name = "provided_date")
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

	public Deed getDeed() {
		return deed;
	}

	public void setDeed(Deed deed) {
		this.deed = deed;
	}

	public User getRecipient() {
		return recipient;
	}

	public void setRecipient(User recipient) {
		this.recipient = recipient;
	}

	public LocalDate getProvidedDate() {
		return providedDate;
	}

	public void setProvidedDate(LocalDate providedDate) {
		this.providedDate = providedDate;
	}

	@Override
	public String toString() {
		return "DeedTransaction [id=" + id + ", deed=" + deed + ", recipient=" + recipient + ", providedDate="
				+ providedDate + "]";
	}

}
