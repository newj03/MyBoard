package com.board.controller.service.dao;

import java.util.List;

import com.board.controller.vo.BoardVO;
import com.board.controller.vo.LoginVO;

public interface BoardDAO {
	
	String idOverlap(String id);

	void signUp(LoginVO vo);

	LoginVO login(LoginVO vo);
	
	int getListCount();

	List<BoardVO> boardList(BoardVO vo);

	void insertBoard(BoardVO vo);

	BoardVO selectContent(BoardVO vo);

	void updateBoard(BoardVO vo);

	void deleteBoard(BoardVO vo);

	void addCount(BoardVO vo);

	List<BoardVO> boardMyList(BoardVO vo);

	int getMyListCount(String id);

	void updateLogin(LoginVO vo);

	

}
