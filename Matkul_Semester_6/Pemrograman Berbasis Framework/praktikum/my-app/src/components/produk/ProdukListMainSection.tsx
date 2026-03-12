import Link from "next/link";
import styles from "./produk-list-main-section.module.css";

const ProdukListMainSection = () => {
  return (
    <main
      className={`${styles.main} rounded-2xl border border-slate-200 bg-white p-6 shadow-sm sm:p-8`}
    >
      <h2 className={`${styles.heading} text-2xl font-semibold text-slate-900`}>
        Main Section
      </h2>
      <p
        className={`${styles.description} mt-2 text-sm leading-relaxed text-slate-600 sm:text-base`}
      >
        Pilih salah satu nomor produk di bawah ini untuk membuka halaman detail.
      </p>
      <ul className={`${styles.list} mt-5 grid gap-3 sm:grid-cols-3`}>
        <li className="list-none">
          <Link
            href="/views/produk/101"
            className="block rounded-lg border border-cyan-200 bg-cyan-50 px-4 py-3 font-medium text-cyan-900 transition hover:-translate-y-0.5 hover:bg-cyan-100"
          >
            Produk 101
          </Link>
        </li>
        <li className="list-none">
          <Link
            href="/views/produk/202"
            className="block rounded-lg border border-cyan-200 bg-cyan-50 px-4 py-3 font-medium text-cyan-900 transition hover:-translate-y-0.5 hover:bg-cyan-100"
          >
            Produk 202
          </Link>
        </li>
        <li className="list-none">
          <Link
            href="/views/produk/303"
            className="block rounded-lg border border-cyan-200 bg-cyan-50 px-4 py-3 font-medium text-cyan-900 transition hover:-translate-y-0.5 hover:bg-cyan-100"
          >
            Produk 303
          </Link>
        </li>
      </ul>
    </main>
  );
};

export default ProdukListMainSection;
