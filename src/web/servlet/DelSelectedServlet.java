package web.servlet;

import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author gjq
 * @create 2019-08-18-13:51
 */
@WebServlet("/delSelectedServlet")
public class DelSelectedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

          //获取所有的id
        String[] ids = request.getParameterValues("uid");

        //调用service进行删除
        UserService service  = new UserServiceImpl();
        service.delSelectedUser(ids);

        //跳转到所有的servlet
        response.sendRedirect(request.getContextPath()+"/findUserByPageServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);

    }
}
