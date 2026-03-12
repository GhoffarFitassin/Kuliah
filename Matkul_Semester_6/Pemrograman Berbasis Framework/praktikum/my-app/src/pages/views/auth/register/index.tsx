import Link from "next/link";
import styles from './register.module.css';

const HalamanRegister = () => {
  return (
    <div className={styles.register}>
      <h1 className="text-3xl font-bold text-blue-600 ">Halaman Register</h1>
      <Link href="/views/auth/login">Ke Halaman Login</Link>
    </div>
  );
};

export default HalamanRegister;
