package com.mask.exception;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.mask.utils.Util.out;

/**
 * Created by zyl on 2017/1/3.
 */
@Component
public class MyExceptionResolver implements HandlerExceptionResolver {



    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

        out("MyExceptionResolver");
        // 被拦截的请求跳转到该视图
        ModelAndView modelAndView = new ModelAndView("/login");
        return modelAndView;
    }
}
