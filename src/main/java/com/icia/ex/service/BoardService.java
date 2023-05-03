package com.icia.ex.service;

import com.icia.ex.dto.BoardDTO;
import com.icia.ex.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;
    public int save(BoardDTO boardDTO) {
        return boardRepository.save(boardDTO);
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
