/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AirTicketReservationSystem;

import static AirTicketReservationSystem.MDIForm.DesktopPane;
import static AirTicketReservationSystem.MDIForm.dlgSettings;
import java.beans.PropertyVetoException;
import java.sql.*;
import javax.swing.JOptionPane;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Formatter;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;


public class dbConnectr {

    static Connection dbcon;
    
    public static Connection Connect(){
        
        String conURL = "";
        String conUN = "";
        String conPW = "";

        try{
            Scanner sc = new Scanner(new File("conData.txt"));
                    while(sc.hasNext()){
                        conURL = "jdbc:mysql://"+sc.next()+":"+sc.next()+"/airline_ticket_system?autoReconnect=true&useSSL=false";
                        conUN = sc.next();
                        conPW = sc.next();
                    }
            Class.forName("com.mysql.jdbc.Driver");
            dbcon = DriverManager.getConnection(conURL,conUN,conPW);
            MDIForm.dbcon = dbcon;
            return dbcon;
        }
        catch(SQLException e){
            dlgSettings.dispose();
            int userChoice = JOptionPane.showConfirmDialog(dlgSettings, "Cannot create connection with given details. Try to Setup?", "Database Connection Error", JOptionPane.YES_NO_OPTION);
            if(userChoice==0){
                dlgSettings.setSize(850, 310);
                dlgSettings.setTitle("Settings");
                dlgSettings.setLocationRelativeTo(MDIForm.DesktopPane);
                dlgSettings.setVisible(true);
            }
            return dbcon;
        }
        catch(FileNotFoundException e){
            int userChoice = JOptionPane.showConfirmDialog(DesktopPane, "No Database Connection. Do you want to setup now?", "Setup the Connection", JOptionPane.YES_NO_OPTION);
            if(userChoice==0){
                dlgSettings.setSize(850, 310);
                dlgSettings.setTitle("Settings");
                dlgSettings.setLocationRelativeTo(MDIForm.DesktopPane);
                dlgSettings.setVisible(true);
            }
            return dbcon;
        }
        catch(Exception e){
            int userChoice = JOptionPane.showConfirmDialog(dlgSettings, "Cannot read connection data. Try to Setup?", "Database Connection Error", JOptionPane.YES_NO_OPTION);
            if(userChoice==0){
                dlgSettings.setSize(850, 310);
                dlgSettings.setTitle("Settings");
                dlgSettings.setLocationRelativeTo(MDIForm.DesktopPane);
                dlgSettings.setVisible(true);
            }
            return dbcon;
        }
    }
}
