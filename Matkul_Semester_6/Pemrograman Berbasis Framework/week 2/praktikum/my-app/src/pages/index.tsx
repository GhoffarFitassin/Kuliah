import Link from "next/link";

export default function Home() {
  return (
    <div>
      <h1>Praktikum Next.js Pages Router</h1>
      <p>Mahasiswa D4 Teknologi Informasi</p>
      <Link
        href="/about"
      >
        Tentang Saya
      </Link>
    </div>
  );
}
