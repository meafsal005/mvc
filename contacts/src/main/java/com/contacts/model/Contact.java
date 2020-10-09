package com.contacts.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Contact {
	@Id
	@Column(columnDefinition="char(20)")
	private String name;
	private String email;
	private String category;
	@Column(columnDefinition="varchar(20)")
	private String mobile;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn
	private Address address;
	
	public Contact() {}
	
	public Contact(String name, String email, String category, String mobile, Address address) {
		this.name = name;
		this.email = email;
		this.category = category;
		this.mobile = mobile;
		this.address = address;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	
	

}
