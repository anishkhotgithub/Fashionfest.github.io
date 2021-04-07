package com.anish.model;

public class Users {
	
	
	protected int uid;
	protected String name;
	protected String email;
	protected String password;
	protected String role;
	
	
	
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Users(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public Users() 
	{
	
	}
	
	public Users(int uid) 
	{
		this.uid = uid;
	}
	
	public Users(String name, String email, String password) 
	{
		this.name = name;
		this.email = email;
		this.password = password;
	}

	public Users(int uid, String name, String email, String password) 
	{
		this.name=name;
		this.email=email;
		this.password=password;
		this.uid = uid;
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
