public class Tugas2 {
    static int hitungPangkat(int f, int s) {
        System.out.print(s);
        if (s >= f) {
            return s;
        } else {
            System.out.print(" + ");
            return (s + hitungPangkat(f, s + 1));
        }
    }
    public static void main(String[] args) {
        System.out.print(" = " + hitungPangkat(8, 1));
    }
}
