package com.contacts.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.contacts.dao.ContactDao;
import com.contacts.model.Address;
import com.contacts.model.Contact;

@Controller
public class ContactController {
	
	private ContactDao contactDao;
	
	@Autowired
	public ContactController(ContactDao contactDao) {
		this.contactDao = contactDao;
	}
	@GetMapping({"/","/index"})
	public String showContacts(Model model,String name) {
		List<Contact> contacts = contactDao.getContacts();
		model.addAttribute("contacts", contacts);
		return "index";
	}
	
	@PostMapping("/add")
	public String addContacts(@RequestParam("name") String name,
			@RequestParam("email") String email,@RequestParam("category") String category
			,@RequestParam("mobile") String mobile,@RequestParam("addressLine") String addressLine,
			@RequestParam("city") String city,@RequestParam("pincode") int pincode) {
		if(contactDao.getContact(name)==null) {
		Address address = new Address(0,addressLine, city, pincode);
		Contact contact = new Contact(name, email, category, mobile, address);
		contactDao.addContact(contact);}
		return "redirect:/index";
	}
	@PostMapping("/searchByName")
	public String searchByName(@RequestParam("name") String name,Model model) {
		Contact contact = contactDao.getContact(name);
		model.addAttribute("search", contact);
		return "search";
		
	}
	@GetMapping("/delete")
	public String deleteContact(@RequestParam("name") String name) {
		contactDao.deleteContact(name);
		return "redirect:/index";
	}
	@GetMapping("/updatePrompt")
	public String updatePrompt(Model model,@RequestParam("name") String name) {
		
		model.addAttribute("existing", contactDao.getContact(name));
		return "update";
		
	}
	
	@PostMapping("/update")
	public String updateContact(@RequestParam("name") String name,
			@RequestParam("email") String email,@RequestParam("category") String category
			,@RequestParam("mobile") String mobile,@RequestParam("addressLine") String addressLine,
			@RequestParam("city") String city,@RequestParam("pincode") int pincode) {
		if(contactDao.getContact(name)!=null) {
		Address address = contactDao.updateAddress(name, addressLine, city, pincode);
		Contact contact = new Contact(name, email, category, mobile, address);
		contactDao.updateContact(contact);}
		return "redirect:/index";
	}
	
	@PostMapping("/category")
	public String searchByCategory(@RequestParam("category") String category,Model model) {
		List<Contact> contacts = contactDao.getContactByCategory(category);
		model.addAttribute("catgSearch", contacts);
		return "search";	
	}
	
	
	
	
	
	
	

}
