package com.eshop.controller;

import com.eshop.entity.BaseResponse;
import com.eshop.entity.Customer;
import com.eshop.service.CustomerService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * <author> 丰
 * <date>   2018/12/31 10:39
 * <desc>   登录验证控制层
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    private CustomerService customerService;

    @Autowired
    public LoginController(CustomerService service) {
        customerService = service;
    }

    @RequestMapping(value = "customer", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse loginVerify(HttpServletRequest request, String account, String password) {
        BaseResponse response = new BaseResponse();
        Customer customer = customerService.getCustomer(account);
        if (customer == null) {
            response.setCode(400);
            response.setMsg("该用户不存在");
            return response;
        }
        System.out.println("" + customer.getCpass());
        if (BCrypt.checkpw(password, customer.getCpass())) {
            request.getSession().setAttribute("LOGIN_USER", customer);
            response.setCode(200);
            response.setMsg("登录成功");
            return response;
        } else {
            response.setCode(500);
            response.setMsg("登录失败！密码错误！");
            return response;
        }
    }

    @RequestMapping(value = "logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "/login");
    }
}
