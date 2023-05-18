package com.icia.ex.repository;
import com.icia.ex.dto.BookDTO;
import com.icia.ex.dto.BookFileDTO;
import com.icia.ex.dto.BooksDTO;
import com.icia.ex.dto.CartDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

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
    public List<BooksDTO> findBooksList() {
        return sql.selectList("Book.selectAll");
    }

}
