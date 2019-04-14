package cn.ganiner.dao;

import cn.ganiner.pojo.Customer;
import com.github.pagehelper.Page;


public interface CustomerMapper {

    void create(Customer customer);

    void delete(Long id);

    Customer findById(Long id);

    void update(Customer customer);

    Page<Customer> findByPage(Customer customer);



}
