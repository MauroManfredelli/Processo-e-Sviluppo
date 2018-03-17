package it.assignment3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import it.assignment3.model.SessionUser;
import it.assignment3.model.User;
import it.assignment3.service.UserService;

/**
 *  Intercetta la prima richiesta dell'avvio (quella data da "/" specificata nel web.xml).
 *  Prepara la view di index.
 */
@Controller
public class IndexController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = {"/index", "/"}, method = RequestMethod.GET)
	public ModelAndView index(@RequestParam(value = "error", required = false) String error, 
			HttpSession session) {
		SessionUser sessionUser = (SessionUser) session.getAttribute("sessionUser");
		if(sessionUser != null) {
			ModelAndView mw = new ModelAndView("user/login");
			mw.addObject("loginUser", userService.getUserById(sessionUser.getId()));
			return mw;
		}
		ModelAndView mw = new ModelAndView("index");
		if (error != null) {
			mw.addObject("error", "Credenziali non valide!");
		}
		mw.addObject("newUser", new User());
		return mw;
	}

}
