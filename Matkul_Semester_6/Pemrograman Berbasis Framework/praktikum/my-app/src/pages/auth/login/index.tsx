import Link from "next/link";
import { useRouter } from "next/router";
import styles from "./login.module.scss";

const HalamanLogin = () => {
  const { push } = useRouter();

  const handlerLogin = () => {
    push("/produk");
  };

  return (
    <div className={styles.loginPage}>
      <section className={styles.loginCard}>
        <p className={styles.kicker}>Welcome Back</p>
        <h1 className={styles.title}>Halaman Login</h1>
        <p className={styles.subtitle}>
          Masuk untuk melanjutkan ke katalog produk dengan tampilan yang lebih
          rapi.
        </p>

        <button
          type="button"
          onClick={handlerLogin}
          className={styles.loginButton}
        >
          Login
        </button>

        <p className={styles.helperText}>Belum punya akun?</p>
        <Link href="/auth/register" className={styles.registerLink}>
          Ke Halaman Register
        </Link>
      </section>
    </div>
  );
};

export default HalamanLogin;
