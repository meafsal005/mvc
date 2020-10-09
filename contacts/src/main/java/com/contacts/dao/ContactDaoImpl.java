package com.contacts.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.contacts.model.Address;
import com.contacts.model.Contact;
@Transactional
@Repository
public class ContactDaoImpl implements ContactDao {
	private SessionFactory sessionFactory;
	
	public ContactDaoImpl() {}
	
	@Autowired
	public ContactDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public boolean addContact(Contact contact) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(contact);
			
		}
		catch (HibernateException e) {
			// TODO: handle exception
			return false;
		}
		return true;
		
	}
	public boolean deleteContact(String name) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Contact contact = session.get(Contact.class, name);
			session.delete(contact);
			
		}
		catch (HibernateException e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}
	public List<Contact> getContactByCategory(String category) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Contact c where c.category = :catg");
		query.setParameter("catg", category);
		List<Contact> contacts = query.list();
		return contacts;
	}
	public Contact getContact(String name) {
		Session session = sessionFactory.getCurrentSession();
		Contact contact=session.get(Contact.class, name);
		return contact;
		
	}
	public List<Contact> getContacts() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Contact");
		List<Contact> contacts = query.list();
		return contacts;
	}
	public boolean updateContact(Contact contact) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Contact contact1=session.get(Contact.class, contact.getName());
			contact1.setEmail(contact.getEmail());
			contact1.setCategory(contact.getCategory());
			contact1.setMobile(contact.getMobile());
			
		}
		catch (HibernateException e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}
	@Override
	public Address updateAddress(String name, String addressLine, String city, int pincode) {
		Session session = sessionFactory.getCurrentSession();
		Contact contact = session.get(Contact.class, name);
		Address address = session.get(Address.class, contact.getAddress().getId());
		address.setAddressLine(addressLine);
		address.setCity(city);
		address.setPincode(pincode);
		return address;
		
	}


}
