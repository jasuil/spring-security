package encrypt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class test {

	@Autowired
	BCryptPasswordEncoder encriptor;
	
	@RequestMapping(value="/encrypt", method=RequestMethod.GET)
	public String encrypt(Model model,@RequestParam(value="obj", required=false, defaultValue="")String gets){
		if(StringUtils.hasText(gets)){
			String encrypt = encriptor.encode(gets);
			model.addAttribute("before", gets);
			model.addAttribute("after", encrypt);
		}
		return "encrypt/home";
	}
}
