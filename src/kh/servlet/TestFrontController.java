package kh.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.JoinMemberDTO;
import dto.MemberDTO;


@WebServlet("*.test")
public class TestFrontController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqURI.substring(ctxPath.length());
		MemberDAO dao = new MemberDAO();
		
		if(cmd.equals("/submit.test")) {
			String name = request.getParameter("name");
			String msg = request.getParameter("msg");
			try {
				int result = dao.insert(new MemberDTO(name, msg));
				request.setAttribute("result", result);
				request.getRequestDispatcher("submit.jsp").forward(request, response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}else if(cmd.equals("/list.test")) {
			List<MemberDTO> dtos = new ArrayList<>();
			try {
				dtos = dao.selectAll();
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("dtos",dtos);
			request.getRequestDispatcher("list.jsp").forward(request, response);
		}else if(cmd.equals("/join.test")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			try {
				if(dao.inputMember(new JoinMemberDTO(id,pw,name,email))>0){
					request.setAttribute("result","성공");
					request.getRequestDispatcher("join.jsp").forward(request, response);
				}else {
					request.setAttribute("result","실패");
					request.getRequestDispatcher("join.jsp").forward(request, response);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
