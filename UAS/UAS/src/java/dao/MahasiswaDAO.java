package dao;

import model.Mahasiswa;
import java.sql.*;
import java.util.*;

public class MahasiswaDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/mahasiswa_db";
    private static final String JDBC_USER = "root";  // Ganti dengan username MySQL Anda
    private static final String JDBC_PASSWORD = "";  // Ganti dengan password MySQL Anda

    private static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    public static void save(Mahasiswa mahasiswa) {
        String sql = "INSERT INTO mahasiswa (nim, nama, kode_kelas, mata_kuliah, program_studi) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, mahasiswa.getNim());
            statement.setString(2, mahasiswa.getNama());
            statement.setString(3, mahasiswa.getKodeKelas());
            statement.setString(4, mahasiswa.getMataKuliah());
            statement.setString(5, mahasiswa.getProgramStudi());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void update(Mahasiswa mahasiswa) {
        String sql = "UPDATE mahasiswa SET nim = ?, nama = ?, kode_kelas = ?, mata_kuliah = ?, program_studi = ? WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, mahasiswa.getNim());
            statement.setString(2, mahasiswa.getNama());
            statement.setString(3, mahasiswa.getKodeKelas());
            statement.setString(4, mahasiswa.getMataKuliah());
            statement.setString(5, mahasiswa.getProgramStudi());
            statement.setInt(6, mahasiswa.getId());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id) {
        String sql = "DELETE FROM mahasiswa WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Mahasiswa> getAll() {
        List<Mahasiswa> mahasiswaList = new ArrayList<>();
        String sql = "SELECT * FROM mahasiswa";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Mahasiswa mahasiswa = new Mahasiswa(
                    resultSet.getInt("id"),
                    resultSet.getString("nim"),
                    resultSet.getString("nama"),
                    resultSet.getString("kode_kelas"),
                    resultSet.getString("mata_kuliah"),
                    resultSet.getString("program_studi")
                );
                mahasiswaList.add(mahasiswa);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mahasiswaList;
    }
    
        public static Mahasiswa getById(int id) {
        String sql = "SELECT * FROM mahasiswa WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new Mahasiswa(
                        resultSet.getInt("id"),
                        resultSet.getString("nim"),
                        resultSet.getString("nama"),
                        resultSet.getString("kode_kelas"),
                        resultSet.getString("mata_kuliah"),
                        resultSet.getString("program_studi")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
