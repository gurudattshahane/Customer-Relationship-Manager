package com.mysite.CustomerRelationshipManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysite.CustomerRelationshipManager.dao.CustomerRepo;
import com.mysite.CustomerRelationshipManager.model.Customer;

@Controller
public class HomeController {
	
	@Autowired
	CustomerRepo repo;
	
	@GetMapping(path="/")
	public String home() {
		return "index";
	}
	
	@GetMapping(path="/customer-list")
	public ModelAndView getCustomerList() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customerList");
		List<Customer> customerList = repo.findAll();
		mv.addObject("customerList", customerList);
		return mv;
	}
	
	@GetMapping(path="/customer-add")
	public String addCustomer()
	{
		return "customerAdd";
	}
	@PostMapping(path="/customer-add", consumes={"application/json"})
	public ResponseEntity<Customer> addCustomer(@RequestBody Customer customer) {
		System.out.println(customer);
		Customer lastCustomer = repo.getLastCustomer();
		customer.setId(lastCustomer.getId() + 1);
		repo.save(customer);
		return new ResponseEntity<>(customer, HttpStatus.CREATED);
	}
	
	@GetMapping(path="/customer-update")
	public ModelAndView updateCustomer()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customerUpdate");
		List<Customer> customerList = repo.findAll();
		mv.addObject("customerList", customerList);
		return mv;
	}
	@PutMapping(path="/customer-update", consumes= {"application/json"})
	public ResponseEntity<Customer> UpdateCustomer(@RequestBody Customer customer){
		int id = customer.getId();
		Customer updateCustomer = repo.findById(id).orElse(new Customer());
		updateCustomer.setFirstname(customer.getFirstname());
		updateCustomer.setLastname(customer.getLastname());
		updateCustomer.setEmail(customer.getEmail());
		repo.save(updateCustomer);
		
		return new ResponseEntity<>(updateCustomer, HttpStatus.OK);
	}
	
	@GetMapping(path="/customer-delete")
	public ModelAndView deleteCustomer()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customerDelete");
		List<Customer> customerList = repo.findAll();
		mv.addObject("customerList", customerList);
		return mv;
	}
	@DeleteMapping(path="/customer-delete", consumes= {"application/json"})
	public ResponseEntity<Customer> deleteCustomer(@RequestBody Customer customer)
	{
		int id = customer.getId();
		Customer deleteCustomer = repo.findNthRecord(id);
		repo.deleteById(deleteCustomer.getId());
		return new ResponseEntity<>(customer, HttpStatus.OK);
	}
}
