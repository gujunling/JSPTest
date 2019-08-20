package web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 登录验证的过滤器
 *
 * @author gjq
 * @create 2019-08-20-15:37
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        //强制转换(只有与http相关的servlet才会有获取路径的方法)
        HttpServletRequest request = (HttpServletRequest) req;

        //获取资源的请求路径
        String uri = request.getRequestURI();
        //判断是否包含登录相关的资源路径,要注意排除掉 css/js/图片/验证码等资源
        if (uri.contains("/login.jsp") || uri.contains("/loginServlet") || uri.contains("/css/")
                || uri.contains("/js/") || uri.contains("/fonts/")
                || uri.contains("/checkCodeServlet")) {
            //包含登录相关资源，用户需要登录，放行
            chain.doFilter(req, resp);
        } else {
            //不包含登录相关的资源，验证用户是否登录
            //从session中获取user
            Object user = request.getSession().getAttribute("user");
            if (user != null) {
                //用户已经登录，放行
                chain.doFilter(req, resp);
            } else {
                //没有登录,跳转到登录页面

                request.setAttribute("login_msg", "您尚未登录，请登录");
                //跳转到登录页面
                request.getRequestDispatcher("/login.jsp").forward(request, resp);
            }
        }

        // chain.doFilter(req, resp);

    }

    @Override
    public void destroy() {

    }

}
