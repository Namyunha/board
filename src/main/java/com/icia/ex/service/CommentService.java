package com.icia.ex.service;

import com.icia.ex.dto.CommentDTO;
import com.icia.ex.repository.CommnetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommnetRepository commnetRepository;

    public void save(CommentDTO commentDTO) {
        commnetRepository.save(commentDTO);
    }
    public List<CommentDTO> findAll(Long boardId) {
        return commnetRepository.findAll(boardId);
    }

    public CommentDTO findComment(Long boardId) {
        return commnetRepository.findComment(boardId);
    }
}
