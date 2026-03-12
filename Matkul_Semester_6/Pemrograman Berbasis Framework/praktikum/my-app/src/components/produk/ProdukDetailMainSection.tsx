import Link from "next/link";
import styles from "./produk-detail-main-section.module.css";

type ProdukDetailMainSectionProps = {
  productNo: string;
};

const ProdukDetailMainSection = ({
  productNo,
}: ProdukDetailMainSectionProps) => {
  return (
    <main className={styles.main}>
      <h2 className={styles.heading}>Main Section</h2>
      <p className={styles.description}>
        Ini adalah area konten utama untuk Produk {productNo}. Kamu bisa
        menambahkan informasi harga, deskripsi, dan stok pada section ini.
      </p>
      <Link href="/views/produk" className={styles.backLink}>
        Kembali ke daftar produk
      </Link>
    </main>
  );
};

export default ProdukDetailMainSection;
