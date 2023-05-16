package com.icia.ex.service;

import com.icia.ex.dto.BookDTO;
import com.icia.ex.dto.BookFileDTO;
import com.icia.ex.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class BookService {
    @Autowired
    BookRepository bookRepository;
    public void save(BookDTO bookDTO) throws IOException {
        if(bookDTO.getBookFile().get(0).isEmpty()){
            System.out.println("파일없음");
            bookDTO.setFileAttached(0);
            bookRepository.save(bookDTO);
        } else{
            System.out.println("파일있음");
            bookDTO.setFileAttached(1);
            BookDTO dto = bookRepository.save(bookDTO);
            for (MultipartFile bookFile: bookDTO.getBookFile()) {
                // 원본 파일 이름 가져오기
                String originalFilename = bookFile.getOriginalFilename();
                System.out.println("originalFilename = " + originalFilename);
                // 저장용 이름 만들기
                System.out.println(System.currentTimeMillis());
                System.out.println(UUID.randomUUID().toString());
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                System.out.println("storedFileName = " + storedFileName);
                // 저장을 위한 BoardFileDTO 세팅
                BookFileDTO bookFileDTO = new BookFileDTO();
                bookFileDTO.setOriginalFileName(originalFilename);
                bookFileDTO.setStoredFileName(storedFileName);
                bookFileDTO.setBookId(dto.getId());
                // 로컬에 파일 저장
                // 저장할 경로 설정 (저장할폴더+저장할이름)
                String savePath = "D:\\springframework_img\\" + storedFileName;
                // 저장처리
                bookFile.transferTo(new File(savePath));
                bookRepository.saveFile(bookFileDTO);
            }

        }
    }

    public List<BookFileDTO> findAll() {
        return bookRepository.findAll();
    }
}