package com.mask.controller;

import com.mask.bean.Flower;
import com.mask.bean.User;
import com.mask.dao.CartDaoI;
import com.mask.dao.FlowerDaoI;
import com.mask.dao.IndentDaoI;
import com.mask.dao.UserDaoI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

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

    @RequestMapping(value = "/goodsLists", method = RequestMethod.GET)
    public String getUsers(ModelMap modelMap) {
        // 查询user表中所有记录
        List<Flower> goodsList = flowerDao.findAll();

        // 将所有记录传递给要返回的jsp页面，放在userList当中
        modelMap.addAttribute("goodsList", goodsList);
        // 返回pages目录下的admin/users.jsp页面
        return "goodsManage";
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String showUser(@PathVariable("id") Integer id, ModelMap modelMap) {

        // 找到Id所表示的商品
        Flower good = flowerDao.findOne(id);

        // 传递给请求页面
        modelMap.addAttribute("good", good);
        return "goodDetail";
    }

    // 更新商品信息 页面
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateUser(@PathVariable("id") Integer id, ModelMap modelMap) {

        // 找到Id所表示的商品
        Flower good = flowerDao.findOne(id);

        // 传递给请求页面
        modelMap.addAttribute("good", good);
        return "updateGood";
    }

    // 更新商品信息 操作
    @RequestMapping(value = "/updateG", method = RequestMethod.POST)
    public String updateUserPost(Flower flower) {

        // 更新商品信息
        flowerDao.updateFlower(flower.getName(), flower.getPrice(), flower.getForegift(), flower.getAmount(), flower.getId());
        // 刷新缓冲区
        flowerDao.flush();
        return "redirect:/goodsLists";
    }

    // 删除用户
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") Integer id) {

        // 删除id为userId的商品
        flowerDao.delete(id);
        // 立即刷新
        flowerDao.flush();
        return "redirect:/goodsLists";
    }
}
