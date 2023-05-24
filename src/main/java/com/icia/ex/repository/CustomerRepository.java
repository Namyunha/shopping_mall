package com.icia.ex.repository;

import com.icia.ex.dto.CustomerDTO;
import com.icia.ex.dto.OrderDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public void save(CustomerDTO customerDTO) {
        sql.insert("Customer.save", customerDTO);
    }

    public String fundByEmail(String email) {
        return sql.selectOne("Customer.findByEmail", email);
    }

    public CustomerDTO login(CustomerDTO customerDTO) {
        return sql.selectOne("Customer.login", customerDTO);
    }

    public Long findBySeller(String id) {
        return sql.selectOne("Customer.findId", id);
    }

    public CustomerDTO findByUser(String loginId) {
        return sql.selectOne("Customer.findByUser", loginId);
    }


    public List<OrderDTO> orderList(Long id) {
        return sql.selectList("Book.orderList", id);
    }

    public Long countNum(Long loginNum) {
        return sql.selectOne("Customer.countNum", loginNum);
    }
}
