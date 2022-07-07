/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDBContext extends DBContext {

    public static void main(String[] args) {
        AccountDBContext accDB = new AccountDBContext();

        System.out.println("" + accDB.getAllAccounts().get(0).getFirst_name());
//        accDB.changePassword("5", "6");
        accDB.updateUser(4,"ádasd" , "đá", "dấdasd", "1234567890");
        
    }

    public ArrayList<Account> getAllAccounts() {
        ArrayList<Account> accounts = new ArrayList<>();

        try {

            String sql = "select * from Accounts_HE151102";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFirst_name(rs.getString("first_name"));
                a.setLast_name(rs.getString("last_name"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setType(rs.getInt("type"));
                a.setCreated_at(rs.getTimestamp("created_at"));

                accounts.add(a);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return accounts;

    }

    public Account getAccount(String username, String password) {

        try {

            String sql = "select * from Accounts_HE151102 acc where acc.username like ? and acc.[password] like ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFirst_name(rs.getString("first_name"));
                a.setLast_name(rs.getString("last_name"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setType(rs.getInt("type"));
                a.setCreated_at(rs.getTimestamp("created_at"));

                return a;

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Account getAccount(String id) {

        try {

            String sql = "select * from Accounts_HE151102 acc where acc.id like ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, id);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFirst_name(rs.getString("first_name"));
                a.setLast_name(rs.getString("last_name"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setType(rs.getInt("type"));
                a.setCreated_at(rs.getTimestamp("created_at"));

                return a;

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean checkAccount(String username) {

        try {

            String sql = "select * from Accounts_HE151102 acc where acc.username like ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFirst_name(rs.getString("first_name"));
                a.setLast_name(rs.getString("last_name"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setType(rs.getInt("type"));
                a.setCreated_at(rs.getTimestamp("created_at"));

                return true;

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean checkPassAccount(String id, String password) {

        try {

            String sql = "select * from Accounts_HE151102 acc where acc.id like ? and acc.[password] like ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, id);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFirst_name(rs.getString("first_name"));
                a.setLast_name(rs.getString("last_name"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setType(rs.getInt("type"));
                a.setCreated_at(rs.getTimestamp("created_at"));

                return true;

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Account checkAccount(String username, String phone, String address) {

        try {

            String sql = "select * from Accounts_HE151102 acc where acc.username like ? and acc.[address] like ? and phone like ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, "%" + address + "%");
            stm.setString(3, phone);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFirst_name(rs.getString("first_name"));
                a.setLast_name(rs.getString("last_name"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setType(rs.getInt("type"));
                a.setCreated_at(rs.getTimestamp("created_at"));

                if (a.getType() == 1) {
                    return null;
                } else {
                    return a;
                }

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void createAccount(String username, String password, String firstname, String lastname, String phone, String address) {

        try {

            String sql = "insert into Accounts_HE151102\n"
                    + "([username],\n"
                    + "[password],\n"
                    + "[first_name],\n"
                    + "[last_name],\n"
                    + "[phone],\n"
                    + "[address])\n"
                    + "values(?, ?,?,? ,?,?);";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, firstname);
            stm.setString(4, lastname);
            stm.setString(5, phone);
            stm.setString(6, address);

            stm.execute();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public void changePassword(String id, String password) {

        try {

            String sql = "UPDATE Accounts_HE151102\n"
                    + "SET [password] = ?\n"
                    + "WHERE id = ?;";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, id);

            stm.execute();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public void updateUser(int id, String first_name, String last_name, String address, String phone) {

        try {

            String sql = "UPDATE Accounts_HE151102\n"
                    + "SET [first_name] = ?,\n"
                    + "[last_name] = ?,\n"
                    + "[address] = ?,\n"
                    + "[phone] = ?\n"
                    + "WHERE id = ?;";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, first_name);
            stm.setString(2, last_name);
            stm.setString(3, address);
            stm.setString(4, phone);
            
            stm.setInt(5, id);

            stm.execute();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
