package com.contacts.dao;

import java.util.List;

import com.contacts.model.Address;
import com.contacts.model.Contact;

public interface ContactDao {
	
	public boolean addContact(Contact contact);
	public boolean deleteContact(String name);
	public List<Contact> getContacts();
	public Contact getContact(String name);
	public List<Contact> getContactByCategory(String category);
	public boolean updateContact(Contact contact);
	public Address updateAddress(String name,String addressLine,
				String city,int pincode); 
	
	

}
