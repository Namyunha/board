package com.icia.ex.service;

import com.icia.ex.dto.BoardDTO;
import com.icia.ex.dto.BoardFileDTO;
import com.icia.ex.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;
//    public int save(BoardDTO boardDTO) {
//        return boardRepository.save(boardDTO);
//    }
    public void save(BoardDTO boardDTO) throws IOException {
        if(boardDTO.getBoardFile().isEmpty()){

            System.out.println("파일없음");
            boardDTO.setFileAttached(0);

        }else{
            System.out.println("파일있음");
            boardDTO.setFileAttached(1);
            BoardDTO dto = boardRepository.save(boardDTO);


            String originalFilename = boardDTO.getBoardFile().getOriginalFilename();
            System.out.println("originalFilename = " + originalFilename);
            System.out.println(System.currentTimeMillis());
            System.out.println(UUID.randomUUID().toString());
            String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
            System.out.println("storedFileName = " + storedFileName);


            // 저장을 위한 BoardFileDTO 세팅
            BoardFileDTO boardFileDTO = new BoardFileDTO();
            boardFileDTO.setOriginalFileName(originalFilename);
            boardFileDTO.setStoredFileName(storedFileName);
            boardFileDTO.setBoardId(dto.getId());

            // 로컬에 파일 저장
            // 저장할 경로 설정 (저장할폴더+저장할이름)
            String savePath = "D:\\springframework_img\\" + storedFileName;
            // 저장처리
            boardDTO.getBoardFile().transferTo(new File(savePath));
            boardRepository.saveFile(boardFileDTO);
        }
    }
    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public void upHits(Long id) {
        boardRepository.upHits(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public List<BoardDTO> findAll2() {
        return boardRepository.findAll2();
    }

    public BoardDTO findOne(BoardDTO boardDTO) {
        return boardRepository.findOne(boardDTO);
    }
}
