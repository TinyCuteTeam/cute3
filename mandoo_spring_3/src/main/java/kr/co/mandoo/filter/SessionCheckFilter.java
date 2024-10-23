package kr.co.mandoo.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SessionCheckFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();

        // /resources 경로의 모든 정적 리소스에 대해 필터링 제외
        boolean isStaticResource = uri.startsWith(req.getContextPath() + "/resources/");

        boolean isLoginPage = uri.endsWith("/login.jsp") || uri.endsWith("login")
                || uri.contains("register.jsp") || uri.contains("register");

        // 정적 리소스 요청이나 로그인 관련 페이지가 아니라면 세션 체크
        if (!isStaticResource) {
            if (session == null || session.getAttribute("user") == null) {
                if (!isLoginPage) {
                    // 로그인 페이지로 리디렉션
                    res.sendRedirect(req.getContextPath() + "/login");
                    return;
                }
            }
        }

        // 필터 체인 계속 진행
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
