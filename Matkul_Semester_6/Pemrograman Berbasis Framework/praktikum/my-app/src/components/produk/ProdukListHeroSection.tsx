import styles from "./produk-list-hero-section.module.css";

const ProdukListHeroSection = () => {
  return (
    <section
      className={`${styles.hero} rounded-2xl bg-gradient-to-br from-sky-100 via-cyan-100 to-emerald-100 p-6 shadow-sm sm:p-8`}
    >
      <p
        className={`${styles.kicker} inline-block rounded-full bg-white/80 px-3 py-1 text-xs font-semibold tracking-[0.2em] text-cyan-800`}
      >
        Katalog
      </p>
      <h1
        className={`${styles.title} mt-3 text-3xl font-bold leading-tight text-slate-900 sm:text-4xl`}
      >
        Halaman Produk
      </h1>
      <p
        className={`${styles.subtitle} mt-3 max-w-2xl text-sm leading-relaxed text-slate-700 sm:text-base`}
      >
        Temukan produk favoritmu dan lanjutkan ke detail produk untuk informasi
        lebih lanjut.
      </p>
    </section>
  );
};

export default ProdukListHeroSection;
