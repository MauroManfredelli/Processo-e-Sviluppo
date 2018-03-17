package it.assignment3.model;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Model che rappresenta l'utente. Ogni attributo ha delle annotazioni che gestiscono la validazione.
 * Nel momento in cui viene anteposto il @Valid a questo model nella firma del metodo nel controller, 
 * viene automaticamente chiamata la validazione con le regole individuate dalle annotazioni degli attributi.
 */
public class User implements Serializable, Comparable<User> {

	private static final long serialVersionUID = 6479342266162948043L;
	
	// id univoco dell'utente (chiave surrogata)
	private Long id;
	
	@NotNull
    @Size(min=5, max=20)
	private String username;
	
	@NotNull
    @Size(min=8, max=30)
	private String password;
	
	@NotNull
	@NotEmpty
	private String name;
	
	@NotNull
	@NotEmpty
	private String surname;
	
	@NotNull
	@NotEmpty
	private String address;
	
	@NotNull
	@NotEmpty
    @Email
	private String email;
	
	@NotNull
	@NotEmpty
	private String city;
	
	@NotNull
	@NotEmpty
	private String country;
	
	private Role role;
	
	public User() {};
	
	public User(Long id, String username, String password, String name, String surname, String address, String email,
			String city, String country, Role role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.surname = surname;
		this.address = address;
		this.email = email;
		this.city = city;
		this.country = country;
		this.role = role;
	}

	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public User(Long id) {
		super();
		this.id = id;
	}

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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public int compareTo(User o) {
		return this.username.compareTo(o.username);
	}
	
	@Override
	public boolean equals(Object other){
	    if (other == null) return false;
	    if (other == this) return true;
	    if (!(other instanceof User))return false;
	    User otherUser = (User)other;
	    return this.id.equals(otherUser.id);
	}

}
