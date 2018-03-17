package it.assignment3.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import it.assignment3.model.Role;
import it.assignment3.model.SessionUser;
import it.assignment3.model.User;
import it.assignment3.service.UserService;

/**
 * Gestisce tutte le richieste relative all'utente
 */
@Controller
public class UserController {
	
	final static Logger log = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	/**
	 * Gestisce la login e l'accesso alla pagina personale dell'utente
	 * @param userForm L'utente che sta provando a loggarsi (contiene solo username e password)
	 * @param session La HttpSession in cui viene salvato l'utente loggato (SessionUser)
	 * @return ModelAndView della pagina personale o index con l'errore
	 */
	@RequestMapping("/login")
	public ModelAndView login(User userForm, HttpSession session) {
		log.info("Tentativo di login "+userForm.getUsername()+" "+userForm.getPassword());
		if(userForm.getUsername() == null || userForm.getUsername().isEmpty()) {
			SessionUser sessionUser = (SessionUser) session.getAttribute("sessionUser");
			if(sessionUser != null) {
				ModelAndView mw = new ModelAndView("user/login");
				mw.addObject("loginUser", userService.getUserById(sessionUser.getId()));
				return mw;
			}
		}
		if(userForm.getUsername() == null || userForm.getPassword() == null) {
			ModelAndView mw = new ModelAndView("index");
			mw.addObject("newUser", new User());
			return mw;
		}
		User user = userService.logIn(userForm.getUsername(), userForm.getPassword());
		if(user == null) {
			ModelAndView mw = new ModelAndView("index");
			mw.addObject("newUser", new User());
			mw.addObject("error", "Username o password errati!");
			return mw;
		} else {
			session.setAttribute("sessionUser", new SessionUser(user));
			ModelAndView mw = new ModelAndView("user/login");
			mw.addObject("loginUser", user);
			return mw;
		}
	}
	
	/**
	 * Gestisce l'iscrizione di un nuovo utente
	 * @param user Utente dato dalla compilazione della form (@Valid serve a far partire la validazione automatica lato server)
	 * @param bindingResult Lega gli errori rilevati lato server agli attributi dell'user
	 * @param session HttpSession in cui viene salvato l'utente se registrato con successo
	 * @return ModelAndView della pagina personale o index con l'errore (dato da bindingResult)
	 */
	@RequestMapping("/signin")
	public ModelAndView signin(@Valid User user, BindingResult bindingResult, HttpSession session) {
		if(bindingResult.hasErrors()) {
			ModelAndView mw = new ModelAndView("index");
			mw.addObject("newUser", user);
			return mw;
		}
		String error = userService.signIn(user);
		if(error.isEmpty()) {
			ModelAndView mw = new ModelAndView("user/login");
			session.setAttribute("sessionUser", new SessionUser(user));
			mw.addObject("loginUser", user);
			return mw;
		} else {
			ModelAndView mw = new ModelAndView("index");
			mw.addObject("error", error);
			mw.addObject("newUser", user);
			return mw;
		}
	}
	
	/**
	 * Gestisce il logout del'utente
	 * @param session HttpSession in cui è presente l'utente loggato che verrà rimosso
	 * @return ModelAndView dell'index
	 */
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("sessionUser");
		ModelAndView mw = new ModelAndView("index");
		mw.addObject("newUser", new User());
		return mw;
	}
	
	/**
	 * Gestisce la modifica dei dati da parte dell'utente nella pagina personale
	 * @param user Utente con i campi modificati (@Valid per validazione lato server automatica)
	 * @param bindingResult Lega gli errori rilevati agli attributi dell'User
	 * @param session HttpSession contenente l'utente loggato
	 * @return ModelAndView della pagina personale con il model aggiornato con i dati modificati
	 */
	@RequestMapping("/modificaDati")
	public ModelAndView modificaDati(@Valid User user, BindingResult bindingResult, HttpSession session) {
		if(bindingResult.hasErrors()) {
			ModelAndView mw = new ModelAndView("user/login");
			mw.addObject("loginUser", userService.getUserById(user.getId()));
			return mw;
		}
		String error = userService.modificaDati(user);
		if(error.isEmpty()) {
			ModelAndView mw = new ModelAndView("user/login");
			session.setAttribute("sessionUser", new SessionUser(user));
			mw.addObject("loginUser", user);
			return mw;
		} else {
			ModelAndView mw = new ModelAndView("user/login");
			mw.addObject("error", error);
			mw.addObject("loginUser", userService.getUserById(user.getId()));
			return mw;
		}
	}
	
	/**
	 * Gestisce l'accesso alla lista degli utenti da parte dell'admin
	 * @param session HttpSession contenente l'utente loggato (sarà utile controllare il suo Role)
	 * @return ModelAndView della lista degli utenti
	 */
	@RequestMapping("/userList")
	public ModelAndView userList(HttpSession session) {
		SessionUser sessionUser = (SessionUser) session.getAttribute("sessionUser");
		if(sessionUser == null) {
			ModelAndView mw = new ModelAndView("index");
			mw.addObject("newUser", new User());
			return mw;
		}
		if(sessionUser.getRole() == Role.ADMIN) {
			ModelAndView mw = new ModelAndView("user/usersList");
			mw.addObject("userList",userService.getUserList());
			return mw;
		} else {
			ModelAndView mw = new ModelAndView("user/login");
			mw.addObject("loginUser", userService.getUserById(sessionUser.getId()));
			return mw;
		}
	}
	
	/**
	 * Gestrisce l'eliminazione dell'utente da parte di un admin nella lista utenti (Ajax)
	 * @param userId Id dello user da eliminare
	 * @return Risultato dell'eliminazione (true ok, false errore)
	 */
	@RequestMapping("/eliminaUser")
	public @ResponseBody String eliminaUser(@RequestParam("userId") String userId) {
		return String.valueOf(userService.eliminaUser(Long.valueOf(userId)));
	}
	
	/**
	 * Gestisce il controllo dell'username duplicato (Ajax)
	 * @param username Username da controllare
	 * @param userId Id dello user loggato per escluderlo dal controllo (in caso di modifica dati altrimenti è vuoto)
	 * @return
	 */
	@RequestMapping("/duplicatedUser")
	public @ResponseBody String duplicatedUser(@RequestParam("username") String username, @RequestParam("userId") String userId) {
		return String.valueOf(userService.duplicatedUser(username, userId.isEmpty() ? null : Long.valueOf(userId)));
	}

	/**
	 * Gestisce il controllo dell'email duplicata (Ajax)
	 * @param email Email da controllare
	 * @param userId Id dello user loggato per escluderlo dal controllo (in caso di modifica dati altrimenti è vuoto)
	 * @return
	 */
	@RequestMapping("/duplicatedEmail")
	public @ResponseBody String duplicatedEmail(@RequestParam("email") String email, @RequestParam("userId") String userId) {
		return String.valueOf(userService.duplicatedEmail(email,  userId.isEmpty() ? null : Long.valueOf(userId)));
	}

}
