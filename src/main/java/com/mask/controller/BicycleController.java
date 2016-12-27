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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
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

    // 添加商品表单页面
    @RequestMapping(value = "/addGood", method = RequestMethod.GET)
    public String addUser(){
        return "addGood";
    }
    // 添加用户处理
    @RequestMapping(value = "/addGoodPost", method = RequestMethod.POST)
    public String addGoodPost(Flower flower){

        // 向数据库添加一个商品，并将内存中缓存区的数据刷新，立即写入数据库，之后才可以进行访问读取
        flowerDao.saveAndFlush(flower);

        // 返回重定向页面
        return "redirect:/goodsLists";
    }

    /**
     * 图片文件上传
     */
    @ResponseBody
    @RequestMapping(value = "/photoUpload",method = RequestMethod.POST)
    public String photoUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IllegalStateException, IOException {

        if (file!=null) {// 判断上传的文件是否为空
            String path=null;// 文件路径
            String type=null;// 文件类型
            String fileName=file.getOriginalFilename();// 文件原名称
            System.out.println("上传的文件原名称:"+fileName);
            // 判断文件类型
            type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
            if (type!=null) {// 判断文件类型是否为空
//                if ("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())) {
                if ("JPG".equals(type.toUpperCase())) {
                    // 项目在容器中实际发布运行的根路径
                    String realPath=request.getSession().getServletContext().getRealPath("/")+"static\\picture\\";
//                    String realPath2=request.getSession().getServletContext().getContextPath();
                    out(realPath+"  :  ");
                    List<Flower> flowerList=flowerDao.findAll();
                    Integer id=0;
                    for (Flower flower:flowerList){
                        if(flower.getId()>id)
                            id=flower.getId();
                    }
                    // 自定义的文件名称
//                    String trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
                    String trueFileName=id+1+".jpg";
                    // 设置存放图片文件的路径
                    path=realPath+trueFileName;
                    System.out.println("存放图片文件的路径:"+path);
                    // 转存文件到指定的路径
                    file.transferTo(new File(path));
                    System.out.println("文件成功上传到指定目录下");
                    return "文件成功上传到指定目录下";
                }else {
                    System.out.println("不是我们想要的文件类型,请按要求重新上传");
                    return "不是我们想要的文件类型,请按要求重新上传";
                }
            }else {
                System.out.println("文件类型为空");
                return "文件类型为空";
            }
        }else {
            System.out.println("没有找到相对应的文件");
            return "没有找到相对应的文件";
        }
    }
}
