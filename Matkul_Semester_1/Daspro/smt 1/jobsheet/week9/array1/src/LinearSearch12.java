import java.util.Scanner;

public class LinearSearch12 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        int key, jumlahElemen;
        int hasil = 0;
        
        System.out.print("Masukkan jumlah elemen array: ");
        jumlahElemen = sc.nextInt();
        int[] arrayInt = new int[jumlahElemen];

        for (int i = 0; i < jumlahElemen; i++) {
            System.out.print("Masukkan elemen array ke-" + (i + 1) + ": ");
            arrayInt[i] = sc.nextInt();
        }

        System.out.print("Masukkan jumlah elemen array: ");
        key = sc.nextInt();

        for (int i = 0; i < arrayInt.length; i++) {
            if (arrayInt[i] == key) {
                hasil = i;
                System.out.println("Key ada di posisi indeks ke-"+hasil);
                break;
            } else{
                System.out.println("Key tidak ditemukan");
                break;
            }
        }
    }
}
