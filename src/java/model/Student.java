package model;

import dto.dbConn;
import java.sql.*;

import java.io.Serializable;
import java.util.ArrayList;
import model.Course;

public class Student implements Serializable {
	
	String name;
        String id = null;
        ArrayList<Course> enrolledIn = new ArrayList<>();
	
	public Student() {
	  
	}   
	
        public Student(String name) {
            this.name = name; 
	}
        
	public Student(String id, String name) {
            this.id = id;
            this.name = name; 
	}
	
        public String getId() {
            return this.id;
	}
        
        public String getName() {
            return this.name;
	}
        
        public void enrollIn( Course course ) {
            enrolledIn.add(course);
        }
        
        public ArrayList<Course> getEnrolledCourses( ) {
            return enrolledIn;
        }
        
	public void setName(String name) {
		this.name = name;
	}
	
}


