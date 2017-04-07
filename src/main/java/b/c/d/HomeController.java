package b.c.d;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import services.authService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
//	@Autowired
	//private authService authServ;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		Map<Object, Object>parameterMap = new HashMap<Object, Object>();
	//	authServ.insertAuth(parameterMap);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/common/error", method = RequestMethod.GET)
	public String error(String message, Model model){
		logger.info("dfdf");
		model.addAttribute("error", message);
		return "common/error";
	}
	
	@RequestMapping(value = "/common/loginck", method = RequestMethod.GET)
	public void login(String message, Model model){
		logger.info("login");
		model.addAttribute("login", message);
//		return "/common/loginck";
	}
	
	@RequestMapping(value = "/logoutck", method = RequestMethod.GET)
	public String logout(String message, Model model){
		logger.info("logout");
		model.addAttribute("logout", message);
		return "common/logoutck";
	}
	
	@RequestMapping(value = "/common/good", method = RequestMethod.POST)
	public String welcome(String message, Model model){
		logger.info("good");
		model.addAttribute("welcome", message);
		return "common/good";
	}
	@RequestMapping(value = "/emp**", method = RequestMethod.GET)
	public String welcome2(String message, Model model){
		logger.info("good");
		model.addAttribute("welcome", message);
		return "common/good";
	}
	@RequestMapping(value = "/html5", method = RequestMethod.GET)
	public String html5(){
		return "html5/home";
	}
	
	
	
}
