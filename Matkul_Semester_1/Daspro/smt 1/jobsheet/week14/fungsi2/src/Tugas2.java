public class Tugas2 {
    static int hitungDeret(int f, int s) {
        System.out.print(s);
        if (s >= f) {
            return s;
        } else {
            System.out.print(" + ");
            return (s + hitungDeret(f, s + 1));
        }
    }
    public static void main(String[] args) {
        System.out.print(" = " + hitungDeret(8, 1));
    }
}
