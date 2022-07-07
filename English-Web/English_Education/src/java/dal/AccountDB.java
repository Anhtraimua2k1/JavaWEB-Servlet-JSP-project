/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDB extends DBContext {

    public static void main(String[] args) {
        AccountDB accDB = new AccountDB();
        System.out.println("" + accDB.getAccounts().get(0).getUsername());
        System.out.println("" + accDB.getAccount("admin", "admin").getLastname());

        System.out.println("" + Boolean.parseBoolean("true"));
    }

    public ArrayList<Account> getAccounts() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {

            String sql = "select * from Account a";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setType(rs.getInt("type"));
                a.setCreate_at(rs.getString("create_at"));

                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setGender(rs.getBoolean("gender"));
                a.setDob((rs.getDate("dob")));
                a.setPhone(rs.getString("phone"));
                a.setImg(rs.getString("img"));

                accounts.add(a);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return accounts;
    }

    public Account getAccount(String username, String password) {

        try {

            String sql = "select * from Account a where a.Username like ? and a.[Password] like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setType(rs.getInt("type"));
                a.setCreate_at(rs.getString("create_at"));

                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setGender(rs.getBoolean("gender"));
                a.setDob((rs.getDate("dob")));
                a.setPhone(rs.getString("phone"));
                a.setImg(rs.getString("img"));

                return a;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Account getAccount(String id) {

        try {

            String sql = "select * from Account a where a.id =? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setType(rs.getInt("type"));
                a.setCreate_at(rs.getString("create_at"));

                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setGender(rs.getBoolean("gender"));
                a.setDob((rs.getDate("dob")));
                a.setPhone(rs.getString("phone"));
                a.setImg(rs.getString("img"));

                return a;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void createAccount(String username, String password, String firstName, String lastName, String DOB, String gender, String phone, String img) {

        try {

            String sql = "insert into Account\n"
                    + "([Username],\n" //1
                    + "[Password],\n"
                    + "[firstName],\n" //3
                    + "[lastName],\n"
                    + "[DOB],\n" //5
                    + "[gender],\n"
                    + "[phone],\n" //7
                    + "[img]\n" //8
                    + "\n"
                    + ")\n"
                    + "values(?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, firstName);
            stm.setString(4, lastName);
            stm.setDate(5, Date.valueOf(DOB));
            stm.setBoolean(6, Boolean.valueOf(gender));
            stm.setString(7, phone);
            stm.setString(8, img);
            stm.execute();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public void updateAccount(String id, String firstName, String lastName, String DOB, String gender, String phone, String img) {

        try {

            String sql = "UPDATE [Account]\n"
                    + "SET [firstName] = ?,\n"
                    + "[lastName] = ?,\n"
                    + "[DOB] = ?,\n"
                    + "[gender] = ?,\n"
                    + "[phone] = ?,\n"
                    + "[img] = ?\n"
                    + "WHERE id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, firstName);
            stm.setString(2, lastName);
            stm.setDate(3, Date.valueOf(DOB));
            stm.setBoolean(4, Boolean.parseBoolean(gender));           
            stm.setString(5, phone);
            stm.setString(6, img);
            
            
            stm.setString(7, id);
            
             stm.execute();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}