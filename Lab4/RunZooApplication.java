import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the ZooApplication class
 * in a similar manner to the sample RunFilmsApplication.java program.
*/


public class RunZooApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username (twice) and password for your
            // Postgres account in the arguments of the getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cse182-db.lt.ucsc.edu/mabdulqa",
                                                     "mabdulqa",
                                                     "AlSaadi1998");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the ZooApplication class.
             * The sample code in RunFilmsApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
			
			ZooApplication app = new ZooApplication(connection);

			// first test
			// get the number of memebers with status 'H'
			Integer test_1 = app.getMemberStatusCount("H");

			// now call output
			System.out.println("Output of getMemeberStatusCount()");
			System.out.println("When parameter of theMemberStatus is 'H'");
			System.out.printf("%d\n", test_1);

			/*
			 * Output of getMemeberStatusCount() 
			 * When parameter of theMemberStatus is 'H' 
			 * 5
			 */

			// second test
			// call  updateMemberStatus with 2 tests
			//
			// theMemberID 1006 and newMemberAddress 200 Rocky Road
			//
			// theMemberID 1011 and newMemberAddress 300 Rocky Road

			// test 2, part 1
			int first_ID = 1006;
			String first_address = "200 Rocky Road";
			int test_2_part_1 = app.updateMemberAddress(first_ID, first_address);

			// test 2, part 2
			int second_ID = 1011;
			String second_address = "300 Rocky Road";
			int test_2_part_2 = app.updateMemberAddress(second_ID, second_address);


			// now call output
			System.out.println("Output of updateMemberAddress()");
			System.out.println("When parameters theMemberID 1006 and newMemberAddress 200 Rocky Road");
			System.out.printf("%d\n", test_2_part_1);

			// now call output
			System.out.println("Output of updateMemberAddress()");
			System.out.println("When parameters theMemberID 1011 and newMemberAddress 300 Rocky Road");
			System.out.printf("%d\n", test_2_part_2);

			/*
			 * Output of updateMemberAddress() 
			 * When parameters theMemberID 1006 and newMemberAddress 200 Rocky Road 
			 * 1 
			 * Output of updateMemberAddress() 
			 * When parameters theMemberID 1011 and newMemberAddress 300 Rocky Road 
			 * 0 
			 */

			// third test
			// call increaseSomeKeeperSalaries 
			// with parameters maxIncreaseAmount 451
			//
			// with parameters maxIncreaseAmount 132

			// test 3, part 1
			int first_max_amount = 451;
			int test_3_part_1 = app.increaseSomeKeeperSalaries(first_max_amount);

			// test 3, part 2
			int second_max_amount = 132;
			int test_3_part_2 = app.increaseSomeKeeperSalaries(second_max_amount);

			// now call output
			System.out.println("Output of increaseSomeKeeperSalaries()");
			System.out.println("When parameters maxIncreaseAmount 451");
			System.out.printf("%d\n", test_3_part_1);

			// now call output
			System.out.println("Output of increaseSomeKeeperSalaries()");
			System.out.println("When parameters maxIncreaseAmount 132");
			System.out.printf("%d\n", test_3_part_2);

			/* 
			 * Output of increaseSomeKeeperSalaries() 
			 * When parameters maxIncreaseAmount 451 
			 * 400 
			 * Output of increaseSomeKeeperSalaries() 
			 * When parameters maxIncreaseAmount 132 
			 * 120
			 */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
