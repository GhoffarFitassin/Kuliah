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
        
        String message = total < 65 ? ("Remidi") : ("Tidak Remidi");

        System.out.println("Nilai akhir: " + total + " sehingga " + message);
    }
}
