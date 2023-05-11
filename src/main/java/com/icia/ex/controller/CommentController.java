package com.icia.ex.controller;


import com.icia.ex.dto.CommentDTO;
import com.icia.ex.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/comment")

public class CommentController {
    @Autowired
    CommentService commentService;
    @PostMapping("/save")
    public ResponseEntity comment(@RequestBody CommentDTO commentDTO, Model model) {
        System.out.println(commentDTO);
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        model.addAttribute("commentList", commentDTOList);
        return new ResponseEntity<>(commentDTOList,HttpStatus.OK);
    }
}
