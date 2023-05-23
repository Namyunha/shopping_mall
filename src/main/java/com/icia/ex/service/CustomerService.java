package com.icia.ex.service;

import com.icia.ex.dto.CustomerDTO;
import com.icia.ex.dto.OrderDTO;
import com.icia.ex.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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


    public List<OrderDTO> orderList(String id) {
        return customerRepository.orderList(id);
    }

    public Long countNum(Long loginNum) {
        return customerRepository.countNum(loginNum);
    }
}
