package com.mask.dao;


import com.mask.bean.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Mr丶周 on 2016/12/6.
 */
@Repository
public interface CartDaoI extends JpaRepository<Cart,Integer> {

}
