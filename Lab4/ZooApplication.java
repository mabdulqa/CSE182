import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the Zoo database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the Connection
 * object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case an error
 * occurs in the database, then the method should print an error message and
 * call System.exit(-1);
 */

public class ZooApplication {

    private Connection connection;

    /*
     * Constructor
     */
    public ZooApplication(Connection connection) {
        this.connection = connection;
    }

    public Connection getConnection() {
        return connection;
    }

    /**
     * getMemberStatusCount: This method has a string argument called
     * theMemberStatus, and returns the number of Keepers whose keeperLevel equals
     * theMemberStatus. A value of theMemberStatus that’s not ‘L’, ‘M’ or ‘H’
     * (corresponding to Low, Medium, and High) is an error.
     */

    public Integer getMemberStatusCount(String theMemberStatus) throws SQLException {
        Integer result = 0;
        // your code here

        // check first if it is a valid status
        List<String> allowed_status_List = Arrays.asList("H", "M", "L");
        if (!allowed_status_List.contains(theMemberStatus)) {
            System.out.println("ZooApplication Error: Invalid MemberStatus");
            System.exit(-1);
        }

        // call the query
        PreparedStatement member_status_query = this.connection.prepareStatement(
                "SELECT COUNT(m.memberStatus) FROM Members m WHERE m.memberStatus = ?");
        member_status_query.setString(1, theMemberStatus);
        ResultSet result_tuple = member_status_query.executeQuery();

        // Now lets convert the query into a string
        while (result_tuple.next()) result = result_tuple.getInt(1);

        // close connection
        member_status_query.close();

        // end of your code
        return result;
    }

    /**
     * updateMemberAddress: Sometimes a member changes address. The
     * updateMemberAddress method has two arguments, an integer argument
     * theMemberID, and a string argument, newMemberAddress. For the tuple in the
     * Members table (if any) whose memberID equals theMemberID, updateMemberAddress
     * should update the address to be newMemberAddress. (Note that there might not
     * be any tuples whose memberID matches theMemberID.)
     *
     * updateMemberAddress should return the number of tuples that were updated,
     * which will always be 0 or 1.
     */

    public int updateMemberAddress(int theMemberID, String newMemberAddress){
        // your code here; return 0 appears for now to allow this skeleton to compile.
        
        // set up the function
        PreparedStatement update_address;
        int status = 0;
        try{

            // prepare the statement and insert the parameters
            update_address = this.connection.prepareStatement("UPDATE members SET address = ? WHERE memberID = ?");
            update_address.setString(1, newMemberAddress);
            update_address.setInt(2, theMemberID);

            // now run the update
            status = update_address.executeUpdate();

            // close connection
            update_address.close();

        }catch(SQLException e){

            // handle the error
            System.out.println("Zoo Application Error: Error in updateMemeberAddress() function.");
            System.exit(-1);
        }

        // return update status
        return status;
    }

    /**
     * increaseSomeKeeperSalaries: This method has an integer parameter,
     * maxIncreaseAmount. It invokes a stored function
     * increaseSomeKeeperSalariesFunction that you will need to implement and store
     * in the database according to the description in Section 5.
     * increaseSomeKeeperSalariesFunction should have the same parameter,
     * maxIncreaseAmount. A value of maxIncreaseAmount that’s not positive is an
     * error.
     *
     * The Keepers table has a keeperSalary attribute, which gives the salary (in
     * dollars and cents) for each keepers. increaseSomeKeeperSalariesFunction will
     * increase the salary for some (but not necessarily all) keepers; Section 5
     * explains which keepers should have their salaries increased, and also tells
     * you how much they should be increased. The increaseSomeKeeperSalaries method
     * should return the same integer result that the
     * increaseSomeKeeperSalariesFunction stored function returns.
     *
     * The increaseSomeKeeperSalaries method must only invoke the stored function
     * increaseSomeKeeperSalariesFunction, which does all of the assignment work; do
     * not implement the increaseSomeKeeperSalaries method using a bunch of SQL
     * statements through JDBC.
     */

    public int increaseSomeKeeperSalaries(int maxIncreaseAmount){
        // There's nothing special about the name storedFunctionResult

        // your code here
        // check if maxIncreaseAmount is >= 0
        if (maxIncreaseAmount < 0){
            System.out.println("Zoo Application Error: maxIncreaseAmount must be greater than or equal to zero.");
            System.exit(-1);
        }

        // set up the tools
        PreparedStatement function_query;
        int storedFunctionResult = 0;

        try{

            // prepare statement
            function_query = this.connection.prepareStatement("select increaseSomeKeeperSalariesFunction(?)");
            function_query.setInt(1, maxIncreaseAmount);

            // do the magic
            ResultSet function_output = function_query.executeQuery();
            while (function_output.next()) storedFunctionResult = function_output.getInt(1);

            // close the connection
            function_query.close();

        }catch(SQLException e){

            // catch error
            System.out.println("Zoo Application Error: Error happened in increaseSomeKeeperSalaries() function.");
            System.exit(-1);
        }
        
        // end of your code
        return storedFunctionResult;

    }

};
