package org.example;

import java.sql.*;

public class DBConnection {

        private static Connection conn;

        public static Connection getConnection() {
                if (conn == null) {
                    createConnection();
                }
                return conn;
        }
        private static void createConnection() {

            String url = "jdbc:sqlite:./Datenbank.db";

            try {
                Class.forName("org.sqlite.JDBC");
                conn = DriverManager.getConnection(url);
                if (conn != null) {
                    DatabaseMetaData meta = conn.getMetaData();
                    createTables(conn);
                }

            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        private static void createTables(Connection conn){
            String sql = "CREATE TABLE IF NOT EXISTS \"Kunde\" (\n" +
                    "    \"Kunden_ID\"    INTEGER NOT NULL UNIQUE,\n" +
                    "    \"Vorname\"    TEXT,\n" +
                    "    \"Nachname\"    TEXT,\n" +
                    "    \"Groesse_cm\"    INTEGER,\n" +
                    "    \"Geburtsdatum\"    TEXT,\n" +
                    "    \"Geschlecht\"    TEXT,\n" +
                    "    PRIMARY KEY(\"Kunden_ID\" AUTOINCREMENT)\n" +
                    ")";

            try {
                Statement stmt = conn.createStatement();
                stmt.execute(sql);
            } catch (SQLException e) {
                System.out.println("Fehler: " + e.getMessage());
            }

            sql = "CREATE TABLE IF NOT EXISTS\"Training\" (\n" +
                    "    \"Trainings_ID\"    INTEGER NOT NULL UNIQUE,\n" +
                    "    \"Prozess_ID\"    TEXT,\n" +
                    "    \"Trainingsdatum\"    TEXT,\n" +
                    "    \"Trainingsvariante\"    TEXT,\n" +
                    "    \"Unterschrift_Trainer\"    BLOB,\n" +
                    "    \"Unterschrift_Kunde\"    BLOB,\n" +
                    "    FOREIGN KEY(\"Prozess_ID\") REFERENCES \"Prozess\"(\"Prozess_ID\"),\n" +
                    "    PRIMARY KEY(\"Trainings_ID\" AUTOINCREMENT)\n" +
                    ")";

            try {
                Statement stmt = conn.createStatement();
                stmt.execute(sql);
            } catch (SQLException e) {
                System.out.println("Fehler: " + e.getMessage());
            }

            sql = "CREATE TABLE IF NOT EXISTS \"Prozess\" (\n" +
                    "    \"Prozess_ID\"    TEXT NOT NULL UNIQUE,\n" +
                    "    \"Kunden_ID\"    INTEGER,\n" +
                    "    \"Status\"    TEXT,\n" +
                    "    \"Trainingsvariante_aktuell\"    TEXT,\n" +
                    "    FOREIGN KEY(\"Kunden_ID\") REFERENCES \"Kunde\"(\"Kunden_ID\"),\n" +
                    "    PRIMARY KEY(\"Prozess_ID\")\n" +
                    ")";

            try {
                Statement stmt = conn.createStatement();
                stmt.execute(sql);
            } catch (SQLException e) {
                System.out.println("Fehler: " + e.getMessage());
            }

            sql = "CREATE TABLE IF NOT EXISTS\"Untersuchung\" (\n" +
                    "    \"Untersuchung_ID\"    INTEGER NOT NULL UNIQUE,\n" +
                    "    \"Prozess_ID\"    TEXT,\n" +
                    "    \"Typ\"    TEXT,\n" +
                    "    \"Testtag_zeit\"    TEXT,\n" +
                    "    \"Gewicht_kg\"    REAL,\n" +
                    "    \"Skelettmuskelmasse_kg\"    REAL,\n" +
                    "    \"Koerperfettmassekg\"    REAL,\n" +
                    "    \"BMI\"    REAL,\n" +
                    "    \"KoerperfettProz\"    REAL,\n" +
                    "    FOREIGN KEY(\"Prozess_ID\") REFERENCES \"Prozess\"(\"Prozess_ID\"),\n" +
                    "    PRIMARY KEY(\"Untersuchung_ID\" AUTOINCREMENT)\n" +
                    ")";
            try {
                Statement stmt = conn.createStatement();
                stmt.execute(sql);
            } catch (SQLException e) {
                System.out.println("Fehler: " + e.getMessage());
            }
        }

        public static void main(String[] args) {
            getConnection();
        }
}