package com.eshop.dao;

import com.eshop.entity.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerDao {
    List<Customer> getAllCustomers();

    List<Customer> getCustomersForPage(@Param("begin") int begin, @Param("limit") int limit);

    Integer countCustomers();

    Customer getCustomer(String account);

    String getCustomerPass(String cid);

    boolean addCustomer(Customer customer);

    boolean updateCustomer(Customer customer);

    boolean updatePassword(@Param("cid") String cid, @Param("newPass") String newPass);

    boolean deleteCustomer(String cid);
}
