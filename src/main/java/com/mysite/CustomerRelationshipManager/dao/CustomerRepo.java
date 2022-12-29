package com.mysite.CustomerRelationshipManager.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mysite.CustomerRelationshipManager.model.Customer;

public interface CustomerRepo extends JpaRepository<Customer, Integer> {

}
