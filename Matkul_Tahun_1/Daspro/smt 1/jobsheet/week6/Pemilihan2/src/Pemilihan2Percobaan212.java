import java.util.Scanner;

public class Pemilihan2Percobaan212 {
    public static void main(String[] args) {
        Scanner input12 = new Scanner(System.in);

        int totalSudut, sudut1, sudut2, sudut3;

        System.out.print("Masukkan sudut 1 : ");
        sudut1 = input12.nextInt();
        System.out.print("Masukkan sudut 2 : ");
        sudut2 = input12.nextInt();
        System.out.print("Masukkan sudut 3 : ");
        sudut3 = input12.nextInt();

        totalSudut = sudut1 + sudut2 + sudut3;

        if (totalSudut == 180) {
            if ((sudut1 == 90) || (sudut2 == 90) || (sudut3 == 90)) {
                System.out.println("Segitiga tersebut adalah segitiga siku-siku");
            } else if ((sudut1 == sudut2) && (sudut2 == sudut3)) {
                System.out.println("Segitiga tersebut adalah segitiga sama sisi");
            } else if ((sudut1 == sudut2) || (sudut1 == sudut3) || (sudut3 == sudut2)) {
                System.out.println("Segitiga tersebut adalah bukan segitiga sama kaki");
            } else {
                System.out.println("Segitiga tersebut adalah bukan segitiga sembarang");
            } 
        } else {
            System.out.println("Bukan Segitiga");
        }
    }
}
