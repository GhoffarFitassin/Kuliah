import java.util.Scanner;

public class ForKelipatan12 {
    public static void main(String[] args) throws Exception {
        Scanner scan = new Scanner(System.in);

        int kelipatan, total = 0, counter = 0;

        System.out.print("Masukkan bilangan kelipatan (1-9): ");
        kelipatan = scan.nextInt();
        
        for (int i = 0; i < 50; i++) {
            if (i % kelipatan == 0) {
                total += i;
                counter++;
            }
        }
        System.out.printf("Banyaknya bilangan %d dari 1 sampai 50 adalah %d\n", kelipatan, counter);
        System.out.printf("total bilangan kelipatan %d dari 1 sampai 50 adalah %d\n", kelipatan, total);
    }
}
