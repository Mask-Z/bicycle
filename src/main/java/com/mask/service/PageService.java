package com.mask.service;

import com.mask.bean.User;
import com.mask.dao.UserDaoI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

/**
 * Created by zyl on 2016/12/30.
 */
@Service
public class PageService {
    @Autowired
    private  UserDaoI userDao;

    public  Page<User> getSourceCode(int pageNumber, int pageSize) {
        PageRequest request = buildPageRequest(pageNumber, pageSize);
        Page<User> sourceCodes = userDao.findAll(request);
        return sourceCodes;
    }

    //构建PageRequest
    private  PageRequest buildPageRequest(int pageNumber, int pageSize) {
        return new PageRequest(pageNumber - 1, pageSize, null);
    }
}
