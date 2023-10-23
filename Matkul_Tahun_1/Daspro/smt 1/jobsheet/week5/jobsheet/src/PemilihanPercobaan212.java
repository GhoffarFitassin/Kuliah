import java.util.Scanner;

public class PemilihanPercobaan212 {
    public static void main(String[] args) {
        Scanner input12= new Scanner(System.in);

        System.out.print("Nilai UAS: ");
        float uas = input12.nextFloat();
        System.out.print("Nilai UTS: ");
        float uts = input12.nextFloat();
        System.out.print("Nilai Kuis: ");
        float kuis = input12.nextFloat();
        System.out.print("Nilai Tugas: ");
        float tugas = input12.nextFloat();

        float total = (uas * 0.4F) + (uts * 0.3F) + (kuis * 0.1F) + (tugas * 0.2F);
        
        if (total > 80 && total <= 100) {
            System.out.println("Nilai Huruf: A, Nilai Setara: 4, Kualifikasi: Sangat Baik");
        } else if (total > 73 && total <= 80) {
            System.out.println("Nilai Huruf: B+, Nilai Setara: 3.5, Kualifikasi: Lebih dari Baik");
        } else if (total > 65 && total <= 73) {
            System.out.println("Nilai Huruf: B, Nilai Setara: 3, Kualifikasi: Baik");
        } else if (total > 60 && total <= 65) {
            System.out.println("Nilai Huruf: C+, Nilai Setara: 2.5, Kualifikasi: Lebih dari Cukup");
        } else if (total > 50 && total <= 60) {
            System.out.println("Nilai Huruf: C, Nilai Setara: 2, Kualifikasi: Cukup");
        } else if (total > 39 && total <= 50) {
            System.out.println("Nilai Huruf: D, Nilai Setara: 1, Kualifikasi: Kurang");
        } else if (total <= 39){
            System.out.println("Nilai Huruf: E, Nilai Setara: 0, Kualifikasi: Gagal");        
        }
    }
}
