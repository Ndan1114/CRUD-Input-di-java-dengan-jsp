<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dao.MahasiswaDAO, model.Mahasiswa"%>

<%
    Mahasiswa mahasiswa = null;

    // Proses request POST untuk menyimpan atau mengupdate data
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String action = request.getParameter("action");

        if ("save".equals(action)) {
            mahasiswa = new Mahasiswa(
                request.getParameter("nim"),
                request.getParameter("nama"),
                request.getParameter("kode_kelas"),
                request.getParameter("mata_kuliah"),
                request.getParameter("program_studi")
            );
            MahasiswaDAO.save(mahasiswa);
        } else if ("update".equals(action)) {
            mahasiswa = new Mahasiswa(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("nim"),
                request.getParameter("nama"),
                request.getParameter("kode_kelas"),
                request.getParameter("mata_kuliah"),
                request.getParameter("program_studi")
            );
            MahasiswaDAO.update(mahasiswa);
        }
    }

    // Proses request DELETE untuk menghapus data mahasiswa
    String deleteId = request.getParameter("deleteId");
    if (deleteId != null) {
        MahasiswaDAO.delete(Integer.parseInt(deleteId));
    }

    // Proses request GET untuk mengambil data mahasiswa berdasarkan ID (Edit)
    String editId = request.getParameter("editId");
    if (editId != null) {
        mahasiswa = MahasiswaDAO.getById(Integer.parseInt(editId));
    }

    // Ambil semua data mahasiswa untuk ditampilkan
    List<Mahasiswa> mahasiswaList = MahasiswaDAO.getAll();
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Input Data Mahasiswa</title>
    <style>
        /* Styling sama seperti sebelumnya */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        input[type="text"]:focus {
            border-color: #0056b3;
            outline: none;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
        }

        button:hover {
            background-color: #45a049;
        }

        .table-container {
            margin-top: 30px;
            width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        th {
            background-color: #f4f4f4;
            color: #333;
        }

        td {
            background-color: #fafafa;
        }

        tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        td button {
            background-color: #f44336;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            border: none;
            color: white;
        }

        td button:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Form Input Mahasiswa</h2>
    <form method="POST">
        <input type="hidden" name="id" value="<%= mahasiswa != null ? mahasiswa.getId() : "" %>">
        <div class="form-group">
            <label for="nim">NIM:</label>
            <input type="text" id="nim" name="nim" value="<%= mahasiswa != null ? mahasiswa.getNim() : "" %>" required>
        </div>
        <div class="form-group">
            <label for="nama">Nama:</label>
            <input type="text" id="nama" name="nama" value="<%= mahasiswa != null ? mahasiswa.getNama() : "" %>" required>
        </div>
        <div class="form-group">
            <label for="kode_kelas">Kode Kelas:</label>
            <input type="text" id="kode_kelas" name="kode_kelas" value="<%= mahasiswa != null ? mahasiswa.getKodeKelas() : "" %>" required>
        </div>
        <div class="form-group">
            <label for="mata_kuliah">Mata Kuliah:</label>
            <input type="text" id="mata_kuliah" name="mata_kuliah" value="<%= mahasiswa != null ? mahasiswa.getMataKuliah() : "" %>" required>
        </div>
        <div class="form-group">
            <label for="program_studi">Program Studi:</label>
            <input type="text" id="program_studi" name="program_studi" value="<%= mahasiswa != null ? mahasiswa.getProgramStudi() : "" %>" required>
        </div>
        <div class="form-group">
            <button type="submit" name="action" value="<%= mahasiswa != null ? "update" : "save" %>">
                <%= mahasiswa != null ? "Update" : "Simpan" %>
            </button>
        </div>
    </form>

    <div class="table-container">
        <h3>Daftar Mahasiswa:</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NIM</th>
                    <th>Nama</th>
                    <th>Kode Kelas</th>
                    <th>Mata Kuliah</th>
                    <th>Program Studi</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Mahasiswa mhs : mahasiswaList) {
                %>
                <tr>
                    <td><%= mhs.getId() %></td>
                    <td><%= mhs.getNim() %></td>
                    <td><%= mhs.getNama() %></td>
                    <td><%= mhs.getKodeKelas() %></td>
                    <td><%= mhs.getMataKuliah() %></td>
                    <td><%= mhs.getProgramStudi() %></td>
                    <td>
                        <form method="GET" style="display:inline;">
                            <button type="submit" name="editId" value="<%= mhs.getId() %>">Edit</button>
                        </form>
                        <form method="POST" style="display:inline;">
                            <button type="submit" name="deleteId" value="<%= mhs.getId() %>">Hapus</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
