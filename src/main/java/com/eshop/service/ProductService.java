package com.eshop.service;

import com.eshop.dao.ProductDao;
import com.eshop.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <author> 丰
 * <date>   2019/1/1 13:30
 * <desc>
 */
@Service
@Transactional
public class ProductService {

    private ProductDao productDao;

    @Autowired
    public ProductService(ProductDao productDao) {
        this.productDao = productDao;
    }

    public List<Product> getAllProducts() {
        return productDao.getAllProducts();
    }

    public List<Product> getProductsForPage(int begin, int limit) {
        return productDao.getProductsForPage(begin, limit);
    }

    public Integer countProducts() {
        return productDao.countProducts();
    }

    public boolean addProduct(Product product) {
        return productDao.addProduct(product);
    }

    public boolean updateProduct(String pid, double price, String status, String intro) {
        return productDao.updateProduct(pid, price, status, intro);
    }

    public boolean deleteProduct(String pid){
        return productDao.deleteProduct(pid);
    }
}
