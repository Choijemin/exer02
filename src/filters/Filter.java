package filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Filter extends HttpFilter {

	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String uri = request.getRequestURI();
		System.out.println("[Filter] at" + uri);
		
		HttpSession session = request.getSession();
		// ����� ���ǿ� ������ ��Ÿ���� Ű�� ������ �α������� �����̷�Ʈ
		//boolean b = (Boolean)session.getAttribute("auth");
		if(session.getAttribute("auth") != null) {
			//������ ���
			chain.doFilter(request, response);
		} else {
			// ������ �α������� �����̷�Ʈ
			session.setAttribute("uri", uri);
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	}

}
