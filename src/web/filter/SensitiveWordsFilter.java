package web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.*;

/**
 * 敏感词汇过滤器
 *
 * @author gjq
 * @create 2019-08-20-16:06
 */
@WebFilter("/*")
public class SensitiveWordsFilter implements Filter {

    private List<String> list = new ArrayList<String>(); //存放敏感词汇的list集合
    private static Map<String, String> map = new HashMap<String, String>();


    @Override
    public void init(FilterConfig config) throws ServletException {

        try {
            //获取文件真实路径
            ServletContext servletContext = config.getServletContext();
            String realPath = servletContext.getRealPath("/WEB-INF/classes/SensitiveWords.txt");
            //读取文件
            BufferedReader br = new BufferedReader(new FileReader(realPath));
            //将文件的每一行数据添加到list中
            String line = null;
            while ((line = br.readLine()) != null) {
                list.add(line);
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;

        //创建代理对象，增强getParameter()方法
        ServletRequest proxy_req = (ServletRequest) Proxy.newProxyInstance(req.getClass().getClassLoader(), req.getClass().getInterfaces(), new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {

                //增强getParameter()方法
                //判断是否是 getParameter()方法
                if (method.getName().equals("getParameter")) {
                    //增强返回值
                    //获取返回值
                    String value = (String) method.invoke(req, args);

                    if (value != null) {
                        for (String str : list) {
                            if (value.contains(str)) {
                                value = value.replaceAll(str, "***");
                            }

                        }
                    }
                    return value;
                }
                if (method.getName().equals("getParameterMap")) {
                    //判断方法名是否是getParameterMap
                    Map<String, String[]> map = new HashMap(req.getParameterMap());
                    if (map != null) {
                        // 遍历转换字符
                        Collection<String[]> values1 = map.values();

                        for (String[] values : values1) {
                            for (String value : values) {
                                value = value.replace(value, "***");
                            }
                        }

                    }
                    return map;
                }
                //判断方法名是否是getParameterValue


                return method.invoke(req, args);
            }
        });

        //放行
        chain.doFilter(proxy_req, resp);

    }

    @Override
    public void destroy() {

    }

}
