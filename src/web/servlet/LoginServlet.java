package web.servlet;

import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @author gjq
 * @create 2019-08-17-19:28
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置编码
        request.setCharacterEncoding("utf-8");
        //获取数据
        //获取用户输入的验证码
        String verifycode = request.getParameter("verifycode");
        //验证码校验
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");//确保验证码的一次性
         if (!checkcode_server.equalsIgnoreCase(verifycode)){
             //验证码不正确，给出提示信息，
             request.setAttribute("login_msg","验证码错误！");
             //跳转到登录页面
             request.getRequestDispatcher("/login.jsp").forward(request,response);
             return;
         }

        //获取用户信息
        Map<String, String[]> map = request.getParameterMap();
        //封装User对象
        User user = new User();
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //调用Service查询
        UserService service = new UserServiceImpl();
        User loginUser = service.login(user);

        //判断是否登录成功
        if (loginUser != null){
            //登录成功
            //将用户存入session
            session.setAttribute("user",loginUser);
            //跳转页面(重定向)
            response.sendRedirect(request.getContextPath()+"/index.jsp");

        }else {
            //登录失败
            request.setAttribute("login_msg","用户名或密码输入错误！");
            //跳转到登录页面
            request.getRequestDispatcher("/login.jsp").forward(request,response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
