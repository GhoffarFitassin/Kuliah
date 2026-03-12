import styles from "./produk-detail-hero-section.module.css";

type ProdukDetailHeroSectionProps = {
  productNo: string;
};

const ProdukDetailHeroSection = ({
  productNo,
}: ProdukDetailHeroSectionProps) => {
  return (
    <section className={styles.hero}>
      <p className={styles.kicker}>Detail</p>
      <h1 className={styles.title}>Halaman Detail Produk</h1>
      <p className={styles.subtitle}>Produk yang sedang dibuka: {productNo}</p>
    </section>
  );
};

export default ProdukDetailHeroSection;
