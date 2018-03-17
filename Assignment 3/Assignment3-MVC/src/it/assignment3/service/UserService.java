package it.assignment3.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;

import it.assignment3.model.Role;
import it.assignment3.model.User;

/**
 * Service che gestisce la logica di business degli utenti.
 * Contiene la lista degli utenti registrati. 
 */
@Service
public class UserService {
	
	// lista degli utenti registrati
	private List<User> userList = new ArrayList<User>() {
			private static final long serialVersionUID = 1L;

			{
				this.add(new User(1l, "user01", "password", "Luca", "Bianchi", "Via De Gasperi 88", "luca.bianchi@gmail.com", "Firenze", "Italy", Role.USER));
				this.add(new User(2l, "user02", "password", "Mario", "Rossi", "Via Gariobaldi 88", "mario.rossi@gmail.com", "Milano", "Italy", Role.USER));
				this.add(new User(3l, "user03", "password", "Antonio", "Bianchi", "Via Cavour 88", "antonio.bianchi@gmail.com", "Roma", "Italy", Role.USER));
				this.add(new User(4l, "user04", "password", "Luigi", "Verdi", "Via Kennedy 88", "luigi.verdi@gmail.com", "Napoli", "Italy", Role.USER));
				this.add(new User(5l, "user05", "password", "Federico", "Gialli", "Via Pascoli 88", "federico.gialli@gmail.com", "Cosenza", "Italy", Role.USER));
				this.add(new User(6l, "user06", "password", "Carmelo", "Rossi", "Via Kennedy 88", "carmelo.rossi@gmail.com", "Venezia", "Italy", Role.USER));
				this.add(new User(7l, "user07", "password", "Maria", "Bianchi", "Via Verdi 88", "maria.bianchi@gmail.com", "Trieste", "Italy", Role.USER));
				this.add(new User(8l, "user08", "password", "Federica", "Verdi", "Via Carducci 88", "federica.verdi@gmail.com", "Trento", "Italy", Role.USER));
				this.add(new User(9l, "user09", "password", "Federico", "Violi", "Via Reitano 88", "federico.violi@gmail.com", "Ascoli", "Italy", Role.USER));
				this.add(new User(10l, "user10", "password", "Beatrice", "Rossi", "Via Ungaretti 88", "beatrice.rossi@gmail.com", "Varese", "Italy", Role.USER));
				this.add(new User(11l, "user11", "password", "Lorel", "Bianchi", "Via Limonta 88", "lorel.bianchi@gmail.com", "Bologna", "Italy", Role.USER));
				this.add(new User(12l, "user12", "password", "Emanuele", "Verdi", "Via Firenze 88", "emanuele.verdi@gmail.com", "Matera", "Italy", Role.USER));
				this.add(new User(13l, "user13", "password", "Jessica", "Gialli", "Via Carnevale 88", "jessica.gialli@gmail.com", "Bari", "Italy", Role.USER));
				this.add(new User(14l, "admin", "password", "Giulio", "Neri", "Via Milano 88", "giulio.neri@gmail.com", "Torino", "Italy", Role.ADMIN));
			}
		};
	
	/**
	 * Aggiunge l'utente alla lista di utenti nel caso non abbia username o email duplicati
	 * @param user User da registrare
	 * @return String vuota se la registrazione ha avuto successo altrimenti String contenente l'errore
	 */
	public String signIn(User user) {
		if(!this.duplicatedUser(user.getUsername(), user.getId())) {
			if(!this.duplicatedEmail(user.getEmail(), user.getId())) {
				user.setRole(Role.USER);
				user.setId(this.getNextId());
				userList.add(user);
				return "";
			} else {
				return "Email '"+user.getEmail()+"' non disponibile";
			}
		} else {
			return "Username '"+user.getUsername()+"' non disponibile";
		}
	}
	
	/**
	 * Prende l'utente corrispondente a username e password, se non lo trova torna null
	 * @param username
	 * @param password
	 * @return User loggato
	 */
	public User logIn(String username, String password) {
		for(User userCmp : userList) {
			if(userCmp.getUsername().equals(username) && userCmp.getPassword().equals(password)) {
				return userCmp;
			}
		}
		return null;
	}
	
	/**
	 * Ritorna la lista degli utenti registrati
	 * @return List<User> lista degli utenti
	 */
	public List<User> getUserList() {
		return userList;
	}
	
	/**
	 * Elimina lo user dato il suo id
	 * @param userId Id dello user da eliminare
	 * @return risultato della rimozione (true o false)
	 */
	public boolean eliminaUser(Long userId) {
		User user = new User(userId);
		if(userId != null) {
			return this.userList.remove(user);
		} else {
			return false;
		}
	}
	
	/**
	 * Modifica i dati dell'utente se non sono presenti username e email duplicati
	 * @param user Utente con i dati modificati
	 * @return String vuota se la modifica ha avuto successo altrimenti String contenente l'errore
	 */
	public String modificaDati(User user) {
		if(!this.duplicatedUser(user.getUsername(), user.getId())) {
			if(!this.duplicatedEmail(user.getEmail(), user.getId())) {
				this.eliminaUser(user.getId());
				userList.add(user);
				Collections.sort(userList);
				return "";
			} else {
				return "Email '"+user.getEmail()+"' non disponibile";
			}
		} else {
			return "Username '"+user.getUsername()+"' non disponibile";
		}
	}
	
	/**
	 * Controlla che l'username non sia duplicato
	 * @param username Username da controllare
	 * @param userId Id dell'utente loggato se sono in modifica dati
	 * @return true se è duplicato false altrimenti
	 */
	public boolean duplicatedUser(String username, Long userId) {
		for(int i=0; i<this.userList.size(); i++) {
			User user = this.userList.get(i);
			if(user.getUsername().equals(username) && userId != null && !user.getId().equals(userId)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Controlla che email non sia duplicata
	 * @param email Email da controllare
	 * @param userId Id dell'utente loggato se sono in modifica dati
	 * @return true se è duplicata false altrimenti
	 */
	public boolean duplicatedEmail(String email, Long userId) {
		for(int i=0; i<this.userList.size(); i++) {
			User user = this.userList.get(i);
			if(user.getEmail().equals(email) && userId != null && !user.getId().equals(userId)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Prende il prossimo id disponibile per la registrazione
	 * @return l'id generato
	 */
	private Long getNextId() {
		Long nextId = 0l;
		for(User user : userList) {
			if(user.getId() > nextId) {
				nextId = user.getId();
			}
		}
		return nextId + 1;
	}
	
	/**
	 * Ritorna l'utente dato il suo id
	 * @param id dell'utente
	 * @return User con quell'id
	 */
	public User getUserById(Long id) {
		return this.userList.get(userList.indexOf(new User(id)));
	}
}
