package com.eshop.service;

import com.eshop.dao.CustomerDao;
import com.eshop.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CustomerService {

    private CustomerDao customerDao;

    @Autowired
    public CustomerService(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    public List<Customer> getAllCustomer() {
        return customerDao.getAllCustomers();
    }

    public List<Customer> getCustomersForPage(int begin, int limit) {
        return customerDao.getCustomersForPage(begin, limit);
    }

    public Integer countCustomers() {
        return customerDao.countCustomers();
    }

    public Customer getCustomer(String account) {
        return customerDao.getCustomer(account);
    }

    public String getCustomerPass(String cid) {
        return customerDao.getCustomerPass(cid);
    }

    public boolean addCustomer(Customer customer) {
        return customerDao.addCustomer(customer);
    }

    public boolean updateCustomer(Customer customer) {
        return customerDao.updateCustomer(customer);
    }

    public boolean updatePassword(String cid, String newPass) {
        return customerDao.updatePassword(cid, newPass);
    }

    public boolean deleteCustomer(String cid) {
        return customerDao.deleteCustomer(cid);
    }
}
