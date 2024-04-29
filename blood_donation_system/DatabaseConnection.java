/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package blood_donation_system;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
    
    private static final String URL = "jdbc:mysql://localhost:3306/blooddonation?user=root&password=root";
    private static final String USER = "root";
    private static final String PASSWORD = "root"; // Replace with your MySQL password

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void main(String[] args) {
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM available_pac")) {

            System.out.println("Available Packets in Blood Bank:");
            System.out.println("Blood Group\tAvailable Packets");

            while (resultSet.next()) {
                String bloodGroup = resultSet.getString("name");
                int availablePackets = resultSet.getInt("available");

                System.out.println(bloodGroup + "\t\t" + availablePackets);
            }
        } catch (SQLException e) {
        }
    }
}
