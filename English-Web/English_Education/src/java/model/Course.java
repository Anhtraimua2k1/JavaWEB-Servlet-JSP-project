/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Course {
//    id int identity(1,1) primary key,
//	[name] varchar(100),
//	instruction text,
//	[description] text,
//	schedule int,	
//	lesson int,
//	[week] int,
//	img text,
//	price float,
//	teacherId int references Teacher(id)
    
    private int id;
    private String name;
    private String instruction;
    private String description;
    private Schedule schedule;
    private int lesson;
    private int week;
    private String img;
    private double price;
    private Teacher teacher;
    private int numOfStudent;

    public Course() {
    }

    public Course(int id, String name, String instruction, String description, Schedule schedule, int lesson, int week, String img, double price, Teacher teacher, int numOfStudent) {
        this.id = id;
        this.name = name;
        this.instruction = instruction;
        this.description = description;
        this.schedule = schedule;
        this.lesson = lesson;
        this.week = week;
        this.img = img;
        this.price = price;
        this.teacher = teacher;
        this.numOfStudent = numOfStudent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public int getLesson() {
        return lesson;
    }

    public void setLesson(int lesson) {
        this.lesson = lesson;
    }

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public int getNumOfStudent() {
        return numOfStudent;
    }

    public void setNumOfStudent(int numOfStudent) {
        this.numOfStudent = numOfStudent;
    }

   
    
    
}
