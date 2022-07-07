/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import model.Account;
import model.Course;
import model.Learn;
import model.Schedule;

/**
 *
 * @author Admin
 */
public class LearnDB extends DBContext {

    private CourseDB courseDB = new CourseDB();
    private AccountDB accDB = new AccountDB();

    public static void main(String[] args) {
        LearnDB learnDB = new LearnDB();

        Account a = new Account();
        a.setId(2);

        Course c = new Course();
        c.setId(3);

        
        System.out.println("" + learnDB.getStudentCourses("2").get(0).getCourse().getName());
    }

    public ArrayList<Learn> getLearns() {
        ArrayList<Learn> learns = new ArrayList<>();
        try {

            String sql = "select * from Learn l";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while (rs.next()) {
                Learn l = new Learn();
                l.setId(rs.getInt("id"));
                l.setRegisterDate(rs.getTimestamp("registerDate"));

                Course c = courseDB.getCourse(rs.getString("courseId"));
                l.setCourse(c);

                Account a = accDB.getAccount(rs.getString("studentId"));
                l.setStudent(a);

                learns.add(l);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return learns;
    }

    public ArrayList<Learn> getStudentLearns(String studentId) {
        ArrayList<Learn> learns = new ArrayList<>();
        try {

            String sql = "select * from Learn l where l.studentId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(studentId));
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Learn l = new Learn();
                l.setId(rs.getInt("id"));
                l.setRegisterDate(rs.getTimestamp("registerDate"));

                Course c = courseDB.getCourse(rs.getString("courseId"));
                l.setCourse(c);

                Account a = accDB.getAccount(rs.getString("studentId"));
                l.setStudent(a);

                learns.add(l);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return learns;
    }

    public ArrayList<Learn> getStudentCourses(String studentId) {
        ArrayList<Learn> learns = new ArrayList<>();
        try {

            String sql = "select distinct  l.courseId , l.studentId from Learn l where l.studentId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(studentId));
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Learn l = new Learn();
//                l.setId(rs.getInt("id"));
//                l.setRegisterDate(rs.getTimestamp("registerDate"));
                
                Course c = courseDB.getCourse(rs.getString("courseId"));
                l.setCourse(c);

                Account a = accDB.getAccount(rs.getString("studentId"));
                l.setStudent(a);

                learns.add(l);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return learns;
    }

    public void createLearn(Account student, Course course) {

        try {

            String sql = "insert into Learn ([courseId], [studentId]) values(?, ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course.getId());
            stm.setInt(2, student.getId());
            stm.execute();
        } catch (Exception ex) {
            System.out.println(ex);
        }

    }

}
