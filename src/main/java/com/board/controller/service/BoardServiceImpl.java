package com.board.controller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.controller.service.dao.BoardDAO;
import com.board.controller.vo.BoardVO;
import com.board.controller.vo.LoginVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boarddao;

	@Override
	public String idOverlap(String id) {
		
		return this.boarddao.idOverlap(id);
	}

	@Override
	public void signUp(LoginVO vo) {
		
		this.boarddao.signUp(vo);
	}

	@Override
	public LoginVO login(LoginVO vo) {
		
		return this.boarddao.login(vo);
	}

	@Override
	public List<BoardVO> boardList(BoardVO vo) {
		
		return this.boarddao.boardList(vo);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		
		this.boarddao.insertBoard(vo);
	}

	@Override
	public BoardVO selectContent(BoardVO vo) {
		
		return this.boarddao.selectContent(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		
		this.boarddao.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		
		this.boarddao.deleteBoard(vo);
	}

	@Override
	public void addCount(BoardVO vo) {
		
		this.boarddao.addCount(vo);
	}

	@Override
	public int getListCount() {
		
		return this.boarddao.getListCount();
	}

	@Override
	public List<BoardVO> boardMyList(BoardVO vo) {
		
		return this.boarddao.boardMyList(vo);
	}

	@Override
	public int getMyListCount(String id) {
		
		return this.boarddao.getMyListCount(id);
	}

	@Override
	public void updateLogin(LoginVO vo) {
		
		this.boarddao.updateLogin(vo);
	}

}
