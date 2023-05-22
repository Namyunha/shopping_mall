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


    public String findByEmail(String email) {
        return customerRepository.fundByEmail(email);
    }


    public boolean login(CustomerDTO customerDTO) {
        CustomerDTO dto = customerRepository.login(customerDTO);
        if (dto == null) {
            return false;
        } else {
            return true;
        }
    }

    public Long findBySeller(String id) {
        return customerRepository.findBySeller(id);
    }

    public CustomerDTO findByUser(String loginId) {
        return customerRepository.findByUser(loginId);
    }
}
