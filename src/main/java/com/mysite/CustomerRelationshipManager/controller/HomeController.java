package com.mysite.CustomerRelationshipManager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@GetMapping(path="/")
	public String home() {
		return "index";
	}
	
	@GetMapping(path="/customer-list")
	public ModelAndView getCustomerList() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customerList");
		
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
