package ssm.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import ssm.pojo.Mine.Customer;
import ssm.pojo.Mine.Dynamic;
import ssm.service.*;
import ssm.service.impl.*;

@Controller
public class BigDataHandler {

	@Autowired
	private BigDataService bigDataService;
	
	public BigDataService getBigDataService() {
		return bigDataService;
	}

	public void setBigDataService(BigDataService bigDataService) {
		this.bigDataService = bigDataService;
	}

	@RequestMapping("/ProductDownSuggestion.action")
	@ResponseBody
	public ModelAndView ProductDownSuggestion() {
		
		ModelAndView modelAndView = new ModelAndView();
		List<Dynamic> dynamicList = bigDataService.ProductDownSuggestion();
		modelAndView.addObject("dynamicList",dynamicList);
		for (Dynamic dynamic : dynamicList) {
			System.out.println(dynamic);
		}
		
		modelAndView.setViewName("jsps/ProductDownSuggestion.jsp");
		
		return modelAndView;
		
	}
	
	@RequestMapping("/ProductUpSuggestion.action")
	public ModelAndView ProductUpSuggestion() {
		
		ModelAndView modelAndView = new ModelAndView();
		List<Dynamic> dynamicList = bigDataService.ProductUpSuggestion();
		modelAndView.addObject("dynamicList",dynamicList);
		for (Dynamic dynamic : dynamicList) {
			System.out.println(dynamic);
		}
		
		modelAndView.setViewName("jsps/ProductUpSuggestion.jsp");
		
		return modelAndView;
		
	}
}
