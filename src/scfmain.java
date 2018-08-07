import java.sql.*;
import org.json.*;
import java.io.*;

public class scfmain {
	public static void main(String[] args) {
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver loaded.");
			Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			System.out.println("Connection Established.");
			Statement statement = connection.createStatement();
			String sql = "SELECT * FROM TRANSACTIONS";                                        
			JSONObject jsonObject = null;
			JSONArray jsonArray = new JSONArray();
			ResultSet resultSet = statement.executeQuery(sql);
			int ctr = 0;
			while (resultSet.next()) {
				System.out.println(ctr++);
				int noOfColumns = resultSet.getMetaData().getColumnCount();
				jsonObject = new JSONObject();
				for (int i = 0; i < noOfColumns; i++) {
					if(i==4||i==7||i==10||i==11)
					{
						String columnName = resultSet.getMetaData().getColumnLabel(i + 1).toLowerCase();
						Object columnValue = resultSet.getDate(i + 1);
						jsonObject.put(columnName, columnValue);
					}
					else{
						String columnName = resultSet.getMetaData().getColumnLabel(i + 1).toLowerCase();
						Object columnValue = resultSet.getString(i + 1);
						jsonObject.put(columnName, columnValue);
					}			
				}
				jsonArray.put(jsonObject);
			}
			// Writing to a file
			File file = new File("./WebContent/JsonFile.json");
			file.createNewFile();
			FileWriter fileWriter = new FileWriter(file);
			System.out.println("Writing JSON object to file");
			System.out.println("-----------------------");
			System.out.print(jsonArray);

			fileWriter.write(jsonArray.toString());
			fileWriter.flush();
			fileWriter.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}