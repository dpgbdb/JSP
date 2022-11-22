package kr.co.Jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Jboard2.service.user.UserService;
import kr.co.Jboard2.vo.TermsVO;

@WebServlet("/user/terms.do")
public class TermsController extends HttpServlet{


	private static final long serialVersionUID = 1L;
	private UserService service = UserService.INSTANCE;
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TermsVO vo= service.selectTerms();
		req.setAttribute("vo", vo);
		RequestDispatcher dispathcher = req.getRequestDispatcher("/user/terms.jsp");
		dispathcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}