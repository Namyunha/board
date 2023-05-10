package com.icia.ex.controller;

import com.icia.ex.dto.BoardDTO;
import com.icia.ex.dto.BoardFileDTO;
import com.icia.ex.dto.CommentDTO;
import com.icia.ex.dto.PageDTO;
import com.icia.ex.service.BoardService;
import com.icia.ex.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private CommentService commentService;

    @GetMapping("/index")
    public String board() {
        return "boardPages/board";
    }

    @GetMapping("/save")
    public String boardSave() {
        return "boardPages/boardSave";
    }

    @PostMapping("/save")
    public String saveParam(@ModelAttribute BoardDTO boardDTO) throws IOException {
        System.out.println(boardDTO);
        boardService.save(boardDTO);
        return "redirect:/board/paging";
    }

    @GetMapping
    public String boardDetail(@RequestParam("id") Long id, @RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        boardService.upHits(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTO = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTO);
            System.out.println("boardFileDTO = " + boardFileDTO);
        }
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        return "boardPages/boardDetail";
    }

    @GetMapping("/")
    public String boardList(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        System.out.println(boardDTOList);
        return "boardPages/boardList";
    }

    @GetMapping("/ajax-detail")
    public ResponseEntity detailAjax(@RequestParam("id") Long id) {
        System.out.println("id = " + id);
        BoardDTO dto = boardService.findById(id);
        boardService.upHits(id);
        System.out.println("dto: " + dto);
        if (dto != null) {
            return new ResponseEntity<>(dto, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/update")
    public String boardUpdate(@RequestParam("id") Long id, Model model) {
        System.out.println("id = " + id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDTO", boardDTO);
        return "boardPages/boardUpdate";
    }

    @PostMapping("/update")
    public String boardUpdate(@ModelAttribute BoardDTO boardDTO) {
        System.out.println(boardDTO);
        boardService.update(boardDTO);
        return "redirect:/board?id=" + boardDTO.getId();
    }

    @GetMapping("/delete")
    public String deleteCheck(@RequestParam("id") Long id, Model model) {
        BoardDTO deleteBoard = boardService.findById(id);
        model.addAttribute("deleteBoard", deleteBoard);
        return "boardPages/deleteCheck";
    }

    @GetMapping("/delete-check")
    public String delete(@RequestParam("boardPass") String password) {
        boardService.delete(password);
        return "redirect:/board/";
    }

    //    @PostMapping("/search")
//    public String searchParam(@ModelAttribute BoardDTO boardDTO, Model model) {
//        System.out.println(boardDTO);
//        BoardDTO searchDTO = boardService.findOne(boardDTO);
//        System.out.println(searchDTO);
//        model.addAttribute("searchDTO", searchDTO);
//        return "searchResult";
//    }

    @GetMapping("paging")
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type", required = false, defaultValue = "boartTitle") String type,
                         Model model) {
        System.out.println("page = " + page);
        List<BoardDTO> pagingList = null;
        PageDTO pageDTO = null;
        if(q.equals("")){
            pagingList = boardService.pagingList(page);
            pageDTO = boardService.pagingParam(page);
        }else{
            pagingList = boardService.searchPagingList(page, type, q);
            pageDTO = boardService.searchPagingParam(page, type, q);
        }
        System.out.println("pagingList: " + pagingList);
        System.out.println(pageDTO);
        model.addAttribute("boardList", pagingList);
        model.addAttribute("paging", pageDTO);
        return "/boardPages/paging";
    }
}
