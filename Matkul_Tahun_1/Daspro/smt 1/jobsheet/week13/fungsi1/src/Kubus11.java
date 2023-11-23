public class Kubus11 {
    public static int hitungVolume(int sisi){
        int vol = sisi * sisi * sisi;
        return vol;
    }
    public static int hitungLuasPermukaan(int sisi){
        int luas = sisi * sisi;
        int luasPermukaan = luas * 6;
        return luasPermukaan;
    }
    public static void main(String[] args) {
        System.out.println("Volume kubus dengan sisi 5 = " + hitungVolume(5));
        System.out.println("Luas permukaan kubu dengan sisi 5 = " + hitungLuasPermukaan(5));
    }
}
