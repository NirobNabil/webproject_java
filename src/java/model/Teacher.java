/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author twin_n
 */
public class Teacher {
    String name;
    String id;
    
    public Teacher(){}
    
    public Teacher(String name){
        this.name = name;
    }
    
    public Teacher(String id, String name) {
        this.id = id;
        this.name = name; 
    }
	
    public String getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }
}
