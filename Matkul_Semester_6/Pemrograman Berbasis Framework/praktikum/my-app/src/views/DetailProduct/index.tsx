import { ProductType } from "../../types/Product.type";
import styles from "./detailProduct.module.scss";

const DetailProduk = ({
  products,
  isLoading,
}: {
  products?: ProductType;
  isLoading?: boolean;
}) => {
  if (isLoading || !products) {
    return (
      <section className={styles.produkdetail}>
        <div className={styles.produkdetail__loadingCard}>
          <div className={styles.produkdetail__loadingImage} />
          <div className={styles.produkdetail__loadingLineLarge} />
          <div className={styles.produkdetail__loadingLineMedium} />
          <div className={styles.produkdetail__loadingLineSmall} />
        </div>
      </section>
    );
  }

  const formattedPrice = products.price.toLocaleString("id-ID");

  return (
    <section className={styles.produkdetail}>
      <h1 className={styles.title}>Detail Produk</h1>

      <div className={styles.produkdetail__card}>
        <div className={styles.produkdetail__media}>
          <div className={styles.produkdetail__imageFrame}>
            <img src={products.image} alt={products.name} />
          </div>

          <div className={styles.produkdetail__chips}>
            <span className={styles.produkdetail__chip}>
              {products.category}
            </span>
            <span className={styles.produkdetail__chip}>
              Ukuran {products.size}
            </span>
            <span className={styles.produkdetail__chip}>ID {products.id}</span>
          </div>
        </div>

        <div className={styles.produkdetail__info}>
          <p className={styles.produkdetail__eyebrow}>Katalog produk</p>
          <h2 className={styles.produkdetail__name}>{products.name}</h2>
          <p className={styles.produkdetail__subtitle}>
            Tampilan produk yang bersih dengan fokus pada gambar, kategori, dan
            informasi harga.
          </p>

          <div className={styles.produkdetail__priceCard}>
            <div>
              <p className={styles.produkdetail__priceLabel}>Harga</p>
              <p className={styles.produkdetail__price}>Rp {formattedPrice}</p>
            </div>
            <span className={styles.produkdetail__priceNote}>Ready stock</span>
          </div>

          <div className={styles.produkdetail__metaGrid}>
            <div className={styles.produkdetail__metaItem}>
              <p className={styles.produkdetail__metaLabel}>Kategori</p>
              <p className={styles.produkdetail__metaValue}>
                {products.category}
              </p>
            </div>
            <div className={styles.produkdetail__metaItem}>
              <p className={styles.produkdetail__metaLabel}>Ukuran</p>
              <p className={styles.produkdetail__metaValue}>{products.size}</p>
            </div>
          </div>

          <p className={styles.produkdetail__description}>
            Produk ini ditampilkan dengan layout yang lebih rapi agar gambar
            tidak terlalu besar dan informasi utama mudah dibaca.
          </p>
        </div>
      </div>
    </section>
  );
};

export default DetailProduk;
