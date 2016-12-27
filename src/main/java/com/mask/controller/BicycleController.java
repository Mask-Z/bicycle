package com.mask.controller;

import com.mask.bean.Flower;
import com.mask.bean.Indent;
import com.mask.bean.User;
import com.mask.dao.CartDaoI;
import com.mask.dao.FlowerDaoI;
import com.mask.dao.IndentDaoI;
import com.mask.dao.UserDaoI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

import static com.mask.utils.Util.out;

/**
 * Created by zyl on 2016/12/27.
 */
@Controller
public class BicycleController {
    @Autowired
    private IndentDaoI indentDao;
    @Autowired
    private UserDaoI userDao;
    @Autowired
    private CartDaoI cartDao;
    @Autowired
    private FlowerDaoI flowerDao;
//    /**
//     * 保存用户订单(先这样接收数据)
//     *
//     * @return
//     */
//    @RequestMapping(value = "saveIndent", method = RequestMethod.POST)
//    public String saveIndent(String address, Integer postStyle, Integer payStyle, Double totalMoney, String dealDetails, HttpServletRequest request) {
//        out("saveIndent...");
//        Indent indent = new Indent();
//        indent.setAddress(address);
//        indent.setDealDetails(dealDetails);
//        indent.setPayDate(new Date());
//        indent.setPostStyle(postStyle);
//        indent.setPayStyle(payStyle);
//        indent.setTotalMoney(totalMoney);
//        indent.setUserByUserId((User) request.getSession().getAttribute("baseUser"));
//        indent.setState(1);//设置订单初始状态为1,代表为出库
//        indentDao.saveAndFlush(indent);
//        //移除购物车信息
//        User user = (User) request.getSession().getAttribute("baseUser");
//        User newUser = userDao.getOne(user.getId());
//        cartDao.delete(newUser.getCartsById());
//        cartDao.flush();
//        userDao.flush();
//        request.setAttribute("msg", "已成功付款,请等待收货");
//        List<Flower> flowerList=flowerDao.findAll();
//        request.setAttribute("flowerList",flowerList);
//        return "home";
//    }
}
