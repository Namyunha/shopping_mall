package com.icia.ex.repository;

import com.icia.ex.dto.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BookRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public BookDTO save(BookDTO bookDTO) {
        System.out.println("insert 전 bookDTO" + bookDTO);
        sql.insert("Book.save", bookDTO);
        System.out.println("insert 후 bookDTO" + bookDTO);
        return bookDTO;
    }

    public void saveFile(BookFileDTO bookFileDTO) {
        sql.insert("Book.saveFile", bookFileDTO);
    }

    public List<BooksDTO> findAll() {
        return sql.selectList("Book.selectList");
    }

    public BooksDTO findById(Long bookId) {
        return sql.selectOne("Book.findById", bookId);
    }

    public void cartSave(CartDTO cartDTO) {
        sql.insert("Book.saveCart", cartDTO);
    }

    public List<CbookDTO> findBooksList(Long loginNum) {
        return sql.selectList("Book.cbookList", loginNum);
    }

    public ResultDTO findSum(Long loginId) {
        return sql.selectOne("Book.findSum", loginId);
    }

    public Long findNum(String loginId) {
        return sql.selectOne("Customer.findId", loginId);
    }

    public void saveOrder(OrderDTO orderDTO) {
        sql.insert("Book.saveOrder", orderDTO);
    }

    public void delete(Long id) {
        sql.delete("Book.delete", id);
    }

    public void update(Map<String, Long> updateInfo) {
        sql.update("Book.updateBook", updateInfo);
    }

    public void updateCart(Map<String, Long> updateInfo) {
        System.out.println("updateInfoCart: " + updateInfo);
        sql.update("Book.updateCart", updateInfo);
    }

    public void updateBook(Map<String, Long> updateInfo) {
        System.out.println("updateInfoBook: " + updateInfo);
        sql.update("Book.updateBook", updateInfo);
    }

    public void saveChange(ChangebookDTO changebookDTO) {
        sql.insert("Book.saveChangeBook", changebookDTO);
    }

    public void changeSave(List<ChangebookDTO> books) {
        sql.insert("Book.saveChangeList", books);
    }

    public CartDTO findCart(Long loginNum) {
        return sql.selectOne("Book.findCart", loginNum);
    }
}
