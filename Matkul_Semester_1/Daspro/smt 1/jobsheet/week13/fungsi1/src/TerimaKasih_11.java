public class TerimaKasih_11 {
    public static void ucapanTerimakasih(){
        System.out.println("Thank you for being the best teacher in the world.\n" + 
        "You inspired in me a love for learning and made me feel like I could ask you anything.");
    }

    public static void ucapanTambahan(String ucapan){
        System.out.println(ucapan);
    }
    public static void main(String[] args){
        ucapanTerimakasih();
        String ucapan = "Terima Kasih Pak.. Bu.. Semoga Sehat Selalu";
        ucapanTambahan(ucapan);
    }
}
