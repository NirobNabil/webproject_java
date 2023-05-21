package model;

import dto.dbConn;
import java.sql.*;

import java.io.Serializable;
import java.util.ArrayList;
import model.Course;

public class Student extends User {
	
        ArrayList<Course> enrolledIn = new ArrayList<>();
	
	public Student() {
	  
	}   
	
        public Student(String id) {
            this.id = id;
	}
        
	public Student(String id, String name) {
            this.id = id;
            this.lastName = name; 
	}
        
        public Student(String id, String firstName, String lastName) {
            this.id = id;
            this.firstName = firstName;
            this.lastName = lastName;
        }
        
        public void enrollIn( Course course ) {
            enrolledIn.add(course);
        }
        
        public ArrayList<Course> getEnrolledCourses( ) {
            return enrolledIn;
        }
	
}


