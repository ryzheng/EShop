package com.eshop.controller;

import com.eshop.entity.BaseResponse;
import com.eshop.entity.Product;
import com.eshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <author> 丰
 * <date>   2019/1/1 13:29
 * <desc>   产品相关控制层
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    private ProductService productService;

    @Autowired
    public ProductController(ProductService service) {
        productService = service;
    }

    @RequestMapping(value = "getAllProducts", method = RequestMethod.GET)
    @ResponseBody
    public BaseResponse<List<Product>> getAllProducts() {
        BaseResponse<List<Product>> response = new BaseResponse<>();
        List<Product> products = productService.getAllProducts();
        if (products.size() > 0) {
            response.setCode(200);
            response.setMsg("查询成功");
            response.setCount(products.size());
            response.setData(products);
        } else {
            response.setCode(500);
            response.setMsg("查询失败");
        }
        return response;
    }

    @RequestMapping(value = "getProductsForPage", method = RequestMethod.GET)
    @ResponseBody
    public BaseResponse<List<Product>> getProductsForPage(int page, int limit) {
        int begin = (page - 1) * limit;
        BaseResponse<List<Product>> response = new BaseResponse<>();
        List<Product> products = productService.getProductsForPage(begin, limit);
        if (products.size() > 0) {
            response.setCode(200);
            response.setMsg("查询成功");
            response.setCount(productService.countProducts());
            response.setData(products);
        } else {
            response.setCode(500);
            response.setMsg("查询失败");
        }
        return response;
    }

    @RequestMapping(value = "addProduct", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse addProduct(@RequestBody Product product) {
        System.out.println("" + product);
        BaseResponse response = new BaseResponse();
        if (productService.addProduct(product)) {
            response.setCode(200);
            response.setMsg("产品添加成功");
        } else {
            response.setCode(500);
            response.setMsg("产品添加失败");
        }
        return response;
    }

    @RequestMapping(value = "updateProduct", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse updateProduct(String pid, double price, String status, String intro) {
        BaseResponse response = new BaseResponse();
        if (productService.updateProduct(pid, price, status, intro)) {
            response.setCode(200);
            response.setMsg("产品更新成功");
        } else {
            response.setCode(500);
            response.setMsg("产品更新失败");
        }
        return response;
    }

    @RequestMapping(value = "deleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse deleteProduct(String pid) {
        BaseResponse response = new BaseResponse();
        if (productService.deleteProduct(pid)) {
            response.setCode(200);
            response.setMsg("产品删除成功");
        } else {
            response.setCode(500);
            response.setMsg("产品删除失败");
        }
        return response;
    }
}
