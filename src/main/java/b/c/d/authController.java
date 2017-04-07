package b.c.d;

import java.util.HashMap;
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
public class authController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	authService authServ;
//	private authService authServ = new authServiceImpl();;
	
	private static utility util = new utility();
	
	@ResponseBody
	@RequestMapping(value="/insertAuth", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> insertAuth(HttpServletRequest request, HttpServletResponse response, Model model){			
		
		request.getParameter("USERNAME");
		String USERNAME = request.getParameter("USERNAME");
		String PASSWORD = util.nullToString(request.getParameter("PASSWORD"));
		String AUTHORITY = util.nullToString(request.getParameter("AUTHORITY"));
		
		Map<Object, Object>parameterMap = new HashMap<Object, Object>();
		parameterMap.put("USERNAME", USERNAME);
		parameterMap.put("PASSWORD", PASSWORD);
		parameterMap.put("AUTHORITY", AUTHORITY);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "성공";
		resultMap.put("msg", "성공");
		
		try{
		
			authServ.insertAuth(parameterMap);	
			
		}catch(Exception e){
			e.printStackTrace();
			result = e.getMessage();
		}
		
		return resultMap;
	}
}
