import java.util.Scanner;

public class ArrayRataNilai12 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int[] nilaiMhs = new int[5];
        int jumlahMhs;
        double total = 0, total2 = 0;
        double rata2, rata;

        System.out.print("Masukkan jumlah Mahasiswa: ");
        jumlahMhs = sc.nextInt();
        for (int i = 0; i < jumlahMhs; i++) {
            System.out.print("Masukkan nilai mahasiswa ke-" + (i + 1) + " : ");
            nilaiMhs[i] = sc.nextInt();
        }

        int lulusCount = 0;
        int tidakLulusCount = 0;
        
        for (int i = 0; i < jumlahMhs; i++) {
            if (nilaiMhs[i] > 70) {
                total += nilaiMhs[i];
                lulusCount++;
            } else {
                total2 += nilaiMhs[i];
                tidakLulusCount++;
            }
        }
        
        if (lulusCount > 0) {
            rata = total / lulusCount;
            System.out.println("Rata-rata nilai lulus = " + rata);
        }

        if (tidakLulusCount > 0) {
            rata2 = total2 / tidakLulusCount;
            System.out.println("Rata-rata nilai tidak lulus = " + rata2);
        }

        // for (int i = 0; i < nilaiMhs.length; i++) {
        //     if (nilaiMhs[i] > 70) {
        //         total += nilaiMhs[i];
        //     } else if (nilaiMhs[i] <= 70){
        //         total2 += nilaiMhs[i];
        //     }
        // }

        // rata = total / nilaiMhs.length; 
        // rata2 = total2 / nilaiMhs.length;
        // System.out.println("Rata-rata nilai lulus = " + rata);
        // System.out.println("Rata-rata nilai tidak lulus = " + rata2);
    }
}

        // for (int i = 0; i < nilaiMhs.length; i++) {
        // if (nilaiMhs[i] > 70) {
        // System.out.println("Mahasiswa ke-"+i+" lulus!");
        // }
        // }