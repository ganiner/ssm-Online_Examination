package cn.ganiner.util;

import com.google.gson.Gson;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CustomExceptionResolver implements HandlerExceptionResolver {


    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest,
                                         HttpServletResponse httpServletResponse,
                                         Object o,
                                         Exception e) {

        CustomException customException = null;

        if (e instanceof CustomException){ //此错误是我们预期的错误
            customException = (CustomException)e;

        }else{ //非预期错误
            customException = new CustomException("未知错误");
        }
        String message = customException.getMessage(); //错误文字信息
        ModelAndView modelAndView = new ModelAndView();

        //判断请求的类型， 是否是json
        HandlerMethod handlerMethod = (HandlerMethod) o;
        ResponseBody responseBody = handlerMethod.getMethod().getAnnotation(ResponseBody.class);
        //是json请求， 则放回json数据
        if (responseBody != null){
            //设置状态码和信息
            Map<String, Object> responseMap = new HashMap<String, Object>();
            responseMap.put("code", "0");
            responseMap.put("message", message);
            String json = new Gson().toJson(responseMap);
            System.out.println(json);
            httpServletResponse.setContentType("UTF-8");
            httpServletResponse.setContentType("application/json;charset=utf-8");
            try{
                httpServletResponse.getWriter().write(json);
                httpServletResponse.getWriter().flush();;
            }catch (IOException e1){
                e1.printStackTrace();
            }
            return modelAndView;
        }

        modelAndView.addObject("message", message);

        //不是json数据， 携带message到跳转到错误页面
        modelAndView.setViewName("page/error");
        return modelAndView;
    }
}