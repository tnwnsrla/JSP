package chap02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/JoinServlet")
public class JoinServlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet02() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>회원가입폼</title></head>");
		out.println("<body>");
		out.println("<h2>회원가입 폼</h2>");
		out.println("<form method='post' action=' " + request.getContextPath() + "/JoinServlet'>");
		out.println("<label for='id'>아이디 : </label>");
		out.println("<input type = 'text' id='id' name='id'><br>");
		out.println("<label for='pwd'>암&nbsp; 호 : </label>");
		out.println("<input type = 'password' id='pwd' name='pwd'><br>");
		out.println("<label for='name'>이&nbsp;름 : </label>");
		out.println("<input type = 'text' id='name' name='name'><br>");
		out.println("<input type='submit' value ='회원가입'>");
		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>회원정보 출력</title></head>");
		out.println("<body>");
		out.println("<h2>회원정보 출력</h2>");
		out.println("아이디 : " + id + "<br>");
		out.println("암   호  : " + pwd + "<br>");
		out.println("이름  : " + name + "<br>");
		out.println("</body>");
		out.println("</html>");
	}

}
