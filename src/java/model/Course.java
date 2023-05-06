package model;

import dto.dbConn;
import java.sql.*;

import java.io.Serializable;

public class Course implements Serializable {
	
	String name;
        String id = null;
        Teacher assignedTo;
	
	public Course() {
	  
	}   
	
        public Course(String name) {
            this.name = name; 
	}
        
	public Course(String id, String name) {
            this.id = id;
            this.name = name; 
	}
	
        public String getId() {
            return this.id;
	}
        
        public String getName() {
            return this.name;
	}
        
	public void setName(String name) {
		this.name = name;
	}
        
        public Teacher getAssignedTo() {
            return this.assignedTo;
        }
        
        public void assignTo( Teacher teacher ) {
            this.assignedTo = teacher;
        }
        
        public void sync() {
            Connection conn = dbConn.getConn();
            
        }
	
}


