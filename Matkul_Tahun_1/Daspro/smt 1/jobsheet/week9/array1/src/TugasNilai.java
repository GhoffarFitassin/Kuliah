import java.util.Scanner;

public class TugasNilai {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        int jumlahNilai;
        double rata2 = 0.0;

        System.out.print("Masukkan jumlah Nilai: ");
        jumlahNilai = sc.nextInt();

        int[] nilai = new int[jumlahNilai];
        
        for (int i = 0; i < jumlahNilai; i++) {
            System.out.print("Masukkan Nilai ke-" + (i + 1) + ": ");
            nilai[i] = sc.nextInt();
        }
        int max = nilai[0], min = nilai[0], sum = 0; 
        for (int i = 0; i < jumlahNilai; i++) {
            if (nilai[i] > max) {
                max = nilai[i];
            }
            if (nilai[i] < min) {
                min = nilai[i];
            }
            sum += nilai[i];
        }
        rata2 = (double) sum / jumlahNilai;
        System.out.println("Nilai tertinggi: " + max);
        System.out.println("Nilai terendah: " + min);
        System.out.println("Nilai rata-rata: " + rata2);
    }
}
