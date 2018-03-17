package it.assignment3.model;

import java.io.Serializable;

/**
 * Utente che viene salvato in sessione.
 * Solo alcuni degli attributi dell'User (posso recuperarli tutti con l'id) utili per la visualizzazione delle views
 */
public class SessionUser implements Serializable {

	private static final long serialVersionUID = 3500237399223820061L;
	
	private Long id;
	private String username;
	private String name;
	private String surname;
	private Role role;
	
	public SessionUser(User user) {
		this.id = user.getId();
		this.username = user.getUsername();
		this.name = user.getName();
		this.surname = user.getSurname();
		this.role = user.getRole();
	}
	
	public SessionUser() {}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

}
