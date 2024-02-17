import java.util.Scanner;

public class Tugas2 {
    static Scanner sc = new Scanner(System.in);
    static int jumlahMahasiswa = sc.nextInt();
    static int jumlahtugas = sc.nextInt();
    static int[][] arrayNilai = new int[jumlahMahasiswa][jumlahtugas];

    static void inputData(){
        Scanner sc = new Scanner(System.in);
        for (int i = 0; i < arrayNilai[0].length; i++) {
            System.out.println("Tugas ke : " + (i+1));
            for (int j = 0; j < arrayNilai.length; j++) {
                System.out.println("Masukkan Nilai Mahasiswa ke-"+j+": ");
                arrayNilai[j][i] = sc.nextInt();
            }
        }
    }

    static void outputData(){
        for (int i = 0; i < arrayNilai[0].length; i++) {
            System.out.println("Tugas ke : " + (i+1));
            for (int j = 0; j < arrayNilai.length; j++) {
                System.out.println("Nilai Mahasiswa ke-"+j+": "+ arrayNilai[j][i] );
            }
        }
    }

    static void highestWeek(){
        int nilai = 0 , tugas = -1;
        for (int i = 0; i < arrayNilai[0].length; i++) {
            for (int j = 0; j < arrayNilai.length; j++) {  
                if (nilai < arrayNilai[j][i]) {
                    nilai = arrayNilai[j][i];
                    tugas = i;
                }
            }
        }
        System.out.println("Nilai tertinggi ada pada Tugas ke-"+(tugas+1));
    }

    static void highestScore(){
        int nilai = 0 , tugas = -1, mahasiswa = -1;
        for (int i = 0; i < arrayNilai[0].length; i++) {
            for (int j = 0; j < arrayNilai.length; j++) {  
                if (nilai < arrayNilai[j][i]) {
                    nilai = arrayNilai[j][i];
                    tugas = i;
                    mahasiswa = j;
                }
            }
        }
        System.out.println("Nilai tertinggi diraih oleh mahasiswa ke-"+mahasiswa+" pada Tugas ke-"+(tugas+1)+" dengan nilai "+nilai);
    }

    public static void main(String[] args) {
        inputData();
        outputData();
        highestWeek();
        highestScore();
    }
}
