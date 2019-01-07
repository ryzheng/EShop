package com.eshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * <author> 丰
 * <date>   2018/12/31 19:20
 * <desc>   静态页面的控制层
 */
@Controller
@RequestMapping("/")
public class StaticPageController {

    //主界面相关
    @RequestMapping(value = "login")
    public void redirectToLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @RequestMapping(value = "index")
    public void redirectToIndex(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    //产品管理相关
    @RequestMapping(value = "product/list")
    public void redirectToProductList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/product/list.jsp").forward(request, response);
    }

    @RequestMapping(value = "product/add")
    public void redirectToProductAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/product/add.jsp").forward(request, response);
    }

    //用户管理相关
    @RequestMapping(value = "customer/list")
    public void redirectToCustomerList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/customer/list.jsp").forward(request, response);
    }

    @RequestMapping(value = "customer/add")
    public void redirectToCustomerAdd(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/customer/add.jsp").forward(request,response);
    }

}
