import java.util.Scanner;

public class Star {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);

        System.out.print("Masukkan nilai N = ");
        int N = sc.nextInt();

        for (int i = 1; i <= N; i--) {
            System.out.print("*");
        }

    }
}
