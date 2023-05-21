/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author twin_n
 */
public class Teacher extends User {
    
    public Teacher(){}
    
    public Teacher(String id) {
        this.id = id;
    }
    
    public Teacher(String id, String username) {
        this.id = id;
        this.username = username; 
    }
    
    public Teacher(String id, String firstName, String lastName) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
    }

}
