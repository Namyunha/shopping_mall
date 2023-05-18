package com.icia.ex.service;

import com.icia.ex.dto.CustomerDTO;
import com.icia.ex.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {
    @Autowired
    private CustomerRepository customerRepository;
    public void save(CustomerDTO customerDTO) {
        customerRepository.save(customerDTO);
    }
}
