package com.mysite.CustomerRelationshipManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping(path="/customer-update")
	public String updateCustomer()
	{
		return "customerUpdate";
	}
	
	@GetMapping(path="/customer-delete")
	public String deleteCustomer()
	{
		return "customerDelete";
	}
}
