package b.c.d;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import Utilities.utility;
import services.authService;
import services.authServiceImpl;


@Controller
public class mobileController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	authService authServ;
//	private authService authServ = new authServiceImpl();;
	
	private static utility util = new utility();
		
	@RequestMapping(value="/mobile/home", method={RequestMethod.GET, RequestMethod.POST})
	public String insertAuth(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model){			
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		Map<Object, Object>resultMap = new HashMap<Object, Object>();
	//	authServ.insertAuth(parameterMap);
		
		String result = "성공";
		resultMap.put("msg", "성공");
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("resultMap", resultMap );
	
		return "mobile/home";
	}
	
	@ResponseBody
	@RequestMapping(value="/mobile/postIt", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> postIt(HttpServletRequest request, HttpServletResponse response){
		String comment = util.nullToString(request.getParameter("comment"));
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("comment", comment + "r");
		return resultMap;
	}
}
