import java.util.Scanner;
public class Saldo{
    public static void main(String[] args) {
        double saldo, tarik;
        Scanner input = new Scanner(System.in);
        System.out.println("");
        System.out.println("********** Bank Suka Maju **********");
        System.out.println("-----------------------------------");
        System.out.println("");
        System.out.println("===================================");
        System.out.println("isi saldo");
        System.out.println("===================================");
        System.out.print("Isi nominal : ");
        saldo = input.nextDouble();
        System.out.println("");
        System.out.println("===================================");
        System.out.println("isi uang yang ingin ditarik");
        System.out.println("===================================");
        System.out.print("Isi nominal : ");
        tarik = input.nextDouble();
        saldo -= tarik;
        System.out.println("");
        System.out.println("===================================");
        System.out.println("sisa saldo : " + saldo);
        System.out.println("===================================");
        System.out.println("jumlah uang yang ditarik : " + tarik);
        System.out.println("===================================");
    }
}