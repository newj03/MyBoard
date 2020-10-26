package com.board.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.controller.service.BoardService;
import com.board.controller.vo.BoardVO;
import com.board.controller.vo.LoginVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value="/loginForm.do")
	public String index() {
		return "login/Login";
	}
	
	@RequestMapping(value="/boardSignUpForm.do")
	public String signUpForm() {
		return "login/SignUp";
	}
	
	@RequestMapping(value="/boardIdOverlap.do")
	@ResponseBody
	public String idOverlap(String id) {
		String result = "overlap";
		String id1 = this.boardService.idOverlap(id);
		if(id1 == null)
			result = "no";
		return result;
	}
	
	@RequestMapping(value="/boardSignUp.do")
	public String signUp(LoginVO vo) {
		this.boardService.signUp(vo);
		return "redirect:/loginForm.do";
	}
	
	@RequestMapping(value="/boardLogin.do")
	@ResponseBody
	public String login(LoginVO vo, HttpSession session) {
		String result = null;
		LoginVO vo1 = this.boardService.login(vo);
		if(vo1 != null) {
			if(vo1.getId() != null) {
				if(vo.getPw().equals(vo1.getPw())) {
					result = "success";
					session.setAttribute("id", vo.getId());
				} else {
					result = "pwFail";
				}
			}
		} else {
			result = "signUp";
		}
		return result;
	}
	
	@RequestMapping(value="/boardList.do")
	public String boardList(BoardVO vo, HttpServletRequest request, Model model) {
		int page = 1; //페이지 쪽 번호
		if(request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		vo.setStartRow((page - 1) * 10 + 1);
		vo.setEndRow(page * 10);
		int total = this.boardService.getListCount();
		List<BoardVO> list = this.boardService.boardList(vo);
		
		int pageCount = total / 10 + (total % 10 == 0 ? 0 : 1); //총 페이지 수
		int pageBlock = 5; //한 번에 보여질 페이지 쪽 개수
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		model.addAttribute("list", list);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", page);
		
		return "board/BoardList";
	}
	
	@RequestMapping(value="/boardWriteForm.do")
	public String boardWriteForm(int page, Model model) {
		model.addAttribute("page", page);
		return "board/BoardWriteForm";
	}
	
	@RequestMapping(value="/boardWrite.do")
	public String boardWrite(BoardVO vo, RedirectAttributes rttr, HttpSession session) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		this.boardService.insertBoard(vo);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/boardList.do";
	}
	
	@RequestMapping(value="/boardContent.do")
	public String boardContent(BoardVO vo, int page, Model model) {
		this.boardService.addCount(vo);
		BoardVO vo1 = this.boardService.selectContent(vo);
		model.addAttribute("vo", vo1);
		model.addAttribute("page", page);
		return "board/BoardContent";
	}

	@RequestMapping(value="/boardUpdateForm.do")
	public String boardUpdateForm(BoardVO vo, int page, Model model) {
		BoardVO vo1 = this.boardService.selectContent(vo);
		model.addAttribute("vo", vo1);
		model.addAttribute("page", page);
		return "board/BoardUpdate";
	}

	@RequestMapping(value="/boardUpdate.do")
	public String boardUpdate(BoardVO vo, int page) {
		this.boardService.updateBoard(vo);
		return "redirect:/boardContent.do?no="+vo.getNo()+"&page="+page;
	}
	
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete(BoardVO vo) {
		this.boardService.deleteBoard(vo);
		return "redirect:/boardList.do";
	}
	
	@RequestMapping(value="/boardLogout.do")
	public String boardLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginForm.do";
	}
	
	@RequestMapping(value="/boardMyWriting.do")
	public String boardMyWriting(HttpSession session, BoardVO vo, HttpServletRequest request, Model model) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		
		int page = 1; //페이지 쪽 번호
		if(request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		vo.setStartRow((page - 1) * 10 + 1);
		vo.setEndRow(page * 10);
		int total = this.boardService.getMyListCount(id);
		List<BoardVO> list = this.boardService.boardMyList(vo);
		
		int pageCount = total / 10 + (total % 10 == 0 ? 0 : 1); //총 페이지 수
		int pageBlock = 5; //한 번에 보여질 페이지 쪽 개수
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		model.addAttribute("list", list);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", page);
		
		return "board/BoardMyList";
	}
	
	@RequestMapping(value="/boardMyContent.do")
	public String boardMyContent(BoardVO vo, int page, Model model) {
		this.boardService.addCount(vo);
		BoardVO vo1 = this.boardService.selectContent(vo);
		model.addAttribute("vo", vo1);
		model.addAttribute("page", page);
		
		return "board/BoardMyContent";
	}
	
	@RequestMapping(value="/boardMyDelete.do")
	public String boardMyDelete(BoardVO vo) {
		this.boardService.deleteBoard(vo);
		return "redirect:/boardMyWriting.do";
	}
	
	@RequestMapping(value="/boardMyUpdateForm.do")
	public String boardMyUpdateForm(BoardVO vo, int page, Model model) {
		BoardVO vo1 = this.boardService.selectContent(vo);
		model.addAttribute("vo", vo1);
		model.addAttribute("page", page);
		return "board/BoardMyUpdate";
	}
	
	@RequestMapping(value="/boardMyUpdate.do")
	public String boardMyUpdate(BoardVO vo, int page) {
		this.boardService.updateBoard(vo);
		return "redirect:/boardMyWriting.do?no="+vo.getNo()+"&page="+page;
	}
	
	@RequestMapping(value="/boardModifyInfoForm.do")
	public String boardModifyInfoForm(HttpSession session, LoginVO vo, Model model) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		LoginVO vo1 = this.boardService.login(vo);
		model.addAttribute("vo", vo1);
		
		return "login/ModifyInfo";
	}
	
	@RequestMapping(value="/boardModifyInfo.do")
	public String boardModifyInfo(LoginVO vo) {
		this.boardService.updateLogin(vo);
		return "redirect:/boardList.do";
	}
}
