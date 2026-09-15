package main.java.others;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public final class DBConnection {

    public static final String STANDARD_CONFIG = "db_standard.properties";
    public static final String ADMIN_CONFIG = "db_admin.properties";

    private DBConnection() {}

    public static Connection getConnection(String propertiesFileName) throws SQLException {
        Properties props = new Properties();

        try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream(propertiesFileName)) {
            if (input == null) {
                throw new IOException("File di configurazione non trovato nel classpath: " + propertiesFileName);
            }
            props.load(input);
        } catch (IOException e) {
            throw new SQLException("Impossibile caricare le proprietà del database: " + e.getMessage(), e);
        }

        String url = props.getProperty("URL");
        String user = props.getProperty("username");
        String password = props.getProperty("password");

        return DriverManager.getConnection(url, user, password);
    }
}
