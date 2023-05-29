package com.icia.ex.service;

import com.icia.ex.dto.CbookDTO;
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

    public List<OrderDTO> orderList(Long loginNum) {
        return customerRepository.orderList(loginNum);
    }

    public Long countNum(Long loginNum) {
        return customerRepository.countNum(loginNum);
    }

    public List<CbookDTO> cbookList(Long loginNum) {
        return customerRepository.cbookList(loginNum);
    }

}
