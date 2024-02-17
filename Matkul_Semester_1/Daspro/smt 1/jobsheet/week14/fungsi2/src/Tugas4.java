import java.util.Scanner;

public class Tugas4 {
    static int marmot(int bil){
        if (bil <= 1) {
            return bil;
        }
        return marmot(bil - 1) + marmot(bil - 2);
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Bulan ke: ");
        int n = sc.nextInt();
        System.out.println("Jumlah Marmot: " + marmot(n));
    }
}
