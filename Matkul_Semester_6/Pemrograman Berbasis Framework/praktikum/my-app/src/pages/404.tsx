import Head from "next/head";
import Link from "next/link";
import { Merriweather } from "next/font/google";
import styles from "@/styles/404.module.scss";

const merriweather = Merriweather({
  subsets: ["latin"],
  weight: ["300", "400", "700", "900"],
});

const Custom404 = () => {
  return (
    <>
      <Head>
        <title>404 | Halaman Tidak Ditemukan</title>
        <meta
          name="description"
          content="Halaman yang Anda cari tidak tersedia atau sudah dipindahkan."
        />
      </Head>

      <section
        className={`${styles.error} ${merriweather.className}`}
        aria-labelledby="not-found-title"
      >
        <span className={styles.glow} aria-hidden="true" />
        <div className={styles.card}>
          <p className={styles.kicker}>Oops!</p>
          <img
            src="/page-not-found.svg"
            alt="Ilustrasi halaman tidak ditemukan"
            className={styles.error_image}
          />
          <h1 id="not-found-title" className={styles.title}>
            404 - Halaman Tidak Ditemukan
          </h1>
          <p className={styles.description}>
            Maaf, halaman yang Anda cari tidak ditemukan atau sudah dipindahkan.
          </p>
          <Link href="/" className={styles.homeLink}>
            Kembali ke Home
          </Link>
        </div>
      </section>
    </>
  );
};
export default Custom404;
