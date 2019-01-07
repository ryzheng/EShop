package com.eshop.dao;

import com.eshop.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <author> 丰
 * <date>   2019/1/1 13:29
 * <desc>   产品相关的数据操作层
 */
public interface ProductDao {
    List<Product> getAllProducts();

    List<Product> getProductsForPage(@Param("begin") int begin, @Param("limit") int limit);

    Integer countProducts();

    boolean addProduct(Product product);

    boolean updateProduct(@Param("pid") String pid, @Param("price") Double price,
                          @Param("status") String status, @Param("intro") String intro);

    boolean deleteProduct(String pid);
}
