package model;

public class Mahasiswa {
    private int id;
    private String nim;
    private String nama;
    private String kodeKelas;
    private String mataKuliah;
    private String programStudi;

    // Constructor
    public Mahasiswa(String nim, String nama, String kodeKelas, String mataKuliah, String programStudi) {
        this.nim = nim;
        this.nama = nama;
        this.kodeKelas = kodeKelas;
        this.mataKuliah = mataKuliah;
        this.programStudi = programStudi;
    }

    public Mahasiswa(int id, String nim, String nama, String kodeKelas, String mataKuliah, String programStudi) {
        this.id = id;
        this.nim = nim;
        this.nama = nama;
        this.kodeKelas = kodeKelas;
        this.mataKuliah = mataKuliah;
        this.programStudi = programStudi;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNim() { return nim; }
    public void setNim(String nim) { this.nim = nim; }

    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }

    public String getKodeKelas() { return kodeKelas; }
    public void setKodeKelas(String kodeKelas) { this.kodeKelas = kodeKelas; }

    public String getMataKuliah() { return mataKuliah; }
    public void setMataKuliah(String mataKuliah) { this.mataKuliah = mataKuliah; }

    public String getProgramStudi() { return programStudi; }
    public void setProgramStudi(String programStudi) { this.programStudi = programStudi; }
}
