import java.util.Scanner;

public class Tugas2 {
    static int[][] arrayNilai = new int[5][7];

    static void inputData(){
        Scanner sc = new Scanner(System.in);
        for (int i = 0; i < arrayNilai[0].length; i++) {
            System.out.println("Minggu ke : " + (i+1));
            for (int j = 0; j < arrayNilai.length; j++) {
                System.out.println("Masukkan Nilai Mahasiswa ke-"+j+": ");
                arrayNilai[j][i] = sc.nextInt();
            }
        }
    }

    static void outputData(){
        for (int i = 0; i < arrayNilai[0].length; i++) {
            System.out.println("Minggu ke : " + (i+1));
            for (int j = 0; j < arrayNilai.length; j++) {
                System.out.println("Nilai Mahasiswa ke-"+j+": "+ arrayNilai[j][i] );
            }
        }
    }

    static void highestWeek(){
        int nilai = 0 , minggu = -1;
        for (int i = 0; i < arrayNilai[0].length; i++) {
            for (int j = 0; j < arrayNilai.length; j++) {  
                if (nilai < arrayNilai[j][i]) {
                    nilai = arrayNilai[j][i];
                    minggu = i;
                }
            }
        }
        System.out.println("Nilai tertinggi ada pada minggu ke-"+(minggu+1));
    }

    static void highestScore(){
        int nilai = 0 , minggu = -1, mahasiswa = -1;
        for (int i = 0; i < arrayNilai[0].length; i++) {
            for (int j = 0; j < arrayNilai.length; j++) {  
                if (nilai < arrayNilai[j][i]) {
                    nilai = arrayNilai[j][i];
                    minggu = i;
                    mahasiswa = j;
                }
            }
        }
        System.out.println("Nilai tertinggi diraih oleh mahasiswa ke-"+mahasiswa+" pada minggu ke-"+(minggu+1)+" dengan nilai "+nilai);
    }

    public static void main(String[] args) {
        inputData();
        outputData();
        highestWeek();
        highestScore();
    }
}
