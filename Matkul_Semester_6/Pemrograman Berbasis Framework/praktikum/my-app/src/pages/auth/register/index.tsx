import Link from "next/link";
import styles from "./register.module.scss";

const HalamanRegister = () => {
  return (
    <div className={styles.registerPage}>
      <section className={styles.registerCard}>
        <p className={styles.kicker}>Create Account</p>
        <h1 className={styles.title}>Halaman Register</h1>
        <p className={styles.subtitle}>
          Siapkan akun baru lalu lanjutkan proses login untuk mengakses halaman
          produk.
        </p>

        <p className={styles.helperText}>Sudah punya akun?</p>
        <Link href="/auth/login" className={styles.loginLinkButton}>
          Ke Halaman Login
        </Link>
      </section>
    </div>
  );
};

export default HalamanRegister;
