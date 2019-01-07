package com.eshop.controller;

import com.eshop.entity.BaseResponse;
import com.eshop.entity.Customer;
import com.eshop.service.CustomerService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    private CustomerService customerService;

    @Autowired
    public CustomerController(CustomerService service) {
        customerService = service;
    }

    @RequestMapping(value = "getAllCustomer", method = RequestMethod.GET)
    @ResponseBody
    public BaseResponse<List<Customer>> getAllCustomer() {
        List<Customer> customers = customerService.getAllCustomer();
        return new BaseResponse<>(200, "查询成功", customers.size(), customers);
    }

    @RequestMapping(value = "getCustomersForPage", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse<List<Customer>> getCustomersForPage(int page, int limit) {
        int begin = (page - 1) * limit;
        BaseResponse<List<Customer>> response = new BaseResponse<>();
        List<Customer> products = customerService.getCustomersForPage(begin, limit);
        if (products.size() > 0) {
            response.setCode(200);
            response.setMsg("查询成功");
            response.setCount(customerService.countCustomers());
            response.setData(products);
        } else {
            response.setCode(500);
            response.setMsg("查询失败");
        }
        return response;
    }

    @RequestMapping(value = "updateCustomer", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse updateCustomer(@RequestBody Customer customer) {
        System.out.println("" + customer);
        BaseResponse response = new BaseResponse();
        if (customerService.updateCustomer(customer)) {
            response.setCode(200);
            response.setMsg("用户修改成功");
        } else {
            response.setCode(500);
            response.setMsg("用户修改失败");
        }
        return response;
    }

    @RequestMapping(value = "resetPassword", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse resetPassword(String cid, String oldPass, String newPass) {
        System.out.println(cid + "\t" + oldPass + "\t" + newPass);
        BaseResponse response = new BaseResponse();
        if (BCrypt.checkpw(oldPass, customerService.getCustomerPass(cid))) {
            if (customerService.updatePassword(cid, BCrypt.hashpw(newPass, BCrypt.gensalt()))) {
                response.setCode(200);
                response.setMsg("密码重置成功");
            } else {
                response.setCode(400);
                response.setMsg("密码重置失败");
            }
        } else {
            response.setCode(500);
            response.setMsg("密码不一致");
        }
        return response;
    }

    @RequestMapping(value = "addCustomer", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse addCustomer(@RequestBody Customer customer) {
        System.out.println("" + customer);
        customer.setCpass(BCrypt.hashpw(customer.getCpass(), BCrypt.gensalt()));
        BaseResponse response = new BaseResponse();
        if (customerService.addCustomer(customer)) {
            response.setCode(200);
            response.setMsg("用户添加成功");
        } else {
            response.setCode(500);
            response.setMsg("用户添加失败");
        }
        return response;
    }

    @RequestMapping(value = "deleteCustomer", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse deleteCustomer(String cid) {
        BaseResponse response = new BaseResponse();
        if (customerService.deleteCustomer(cid)) {
            response.setCode(200);
            response.setMsg("产品删除成功");
        } else {
            response.setCode(500);
            response.setMsg("产品删除失败");
        }
        return response;
    }
}
