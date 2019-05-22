package kh.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;


@WebServlet("*.test")
public class TestFrontController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqURI.substring(ctxPath.length());
		System.out.println(cmd);
		
		if(cmd.equals("/submit.test")) {
			MemberDAO dao = new MemberDAO();
			String name = request.getParameter("name");
			String msg = request.getParameter("msg");
			try {
				int result = dao.insert(new MemberDTO(name, msg));
				request.setAttribute("result", result);
				request.getRequestDispatcher("submit.jsp").forward(request, response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
