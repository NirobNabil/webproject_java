package model;

public class User {
	
	String firstName;
	String lastName;
	String email; 
	String password;
        String id;
        String username;
        String role;
	
	public User() {
	  
	}   
        
        public User(String id) {
            this.id = id;
        }
	
	public User(String firstName, String lastName, String email, String password, String role, String username) {
		this.firstName = firstName; 
		this.lastName = lastName;
		this.email = email;
		this.password = password;
                this.role = role;
                this.username = username;
	}
        
        public String getUsername() {
            return this.username;
        }
        
        public String getId() {
            return this.id;
	}
        
        public String getRole() {
            return this.role;
        }
        
        
        public String getName() {
            return firstName + " " + lastName;
        }
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	} 
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
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


