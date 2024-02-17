public class Tugas1 {
    static void deretRekursif(int n) {
        if (n <= 0) {
            System.out.println(n);
            return;
        } else {
            System.out.print(n + ", ");
            deretRekursif(n - 1);
        }
        
    }
    static void deretIteratif(int n) {
        for (int i = n; i >= 0; i--) {
            System.out.print(i);
            if (i != 0) {
                System.out.print(", ");
            }
        }
    }
    public static void main(String[] args) {
        deretRekursif(5);
        deretIteratif(5);
    }
}
