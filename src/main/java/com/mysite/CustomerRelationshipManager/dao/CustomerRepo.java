package com.mysite.CustomerRelationshipManager.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mysite.CustomerRelationshipManager.model.Customer;

public interface CustomerRepo extends JpaRepository<Customer, Integer> {
	
	@Query(value="select * from customer order by id desc limit 1", nativeQuery = true)
	Customer getLastCustomer();
	
	@Query(value="select * from customer order by id", nativeQuery = true)
	List<Customer> findAll();
	
	@Query(value="select * from (select * from customer order by id limit :#{#n}) as nelements order by id desc limit 1", nativeQuery= true)
	Customer findNthRecord(@Param(value = "n") int n);
}
