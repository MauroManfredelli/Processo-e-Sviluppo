package it.assignment3.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Controller che gestisce gli errori e le eccesioni generate dall'applicazione.
 * Gli errori gestiti sono 403, 404 e 500.
 */
@ControllerAdvice
@Controller
public class ErrorHandler{
	
	final static Logger log = Logger.getLogger(ErrorHandler.class);
 
	String path = "/error";
	  
	@RequestMapping(value="/403")
	public String error403(){
	    log.error("403");
	    return path+"/error403";
	}
	  
	@RequestMapping(value="/404")
	public String error404(){
		log.error("404");
	    return path+"/error404";
	}
	  
	@RequestMapping(value="/500")
	public String error500(){
		log.error("500");
	    return path+"/error500";
	}
	
	/**
	 * Nel momento in cui viene generata un'eccezione qualsiasi nell'applicazione,
	 * viene chiamato questo metodo
	 * @param ex Eccezione generale
	 * @return pagina di cortesia
	 */
	@ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {
		log.error(ex.getMessage(), ex);
		return path+"/error500";
	}
  
}