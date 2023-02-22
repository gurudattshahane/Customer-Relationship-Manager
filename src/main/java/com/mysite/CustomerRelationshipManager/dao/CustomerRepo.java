package com.mysite.CustomerRelationshipManager.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mysite.CustomerRelationshipManager.model.Customer;

public interface CustomerRepo extends JpaRepository<Customer, Integer> {
	
	@Query(value="select * from customer order by id desc limit 1", nativeQuery = true)
	Customer getLastCustomer();
}
