import Link from "next/link";
import { Inter } from "next/font/google";

const inter = Inter({ subsets: ["latin"] });

export default function Home() {
  return (
    <div>
      <head>
        <title>Praktikum Next.js Pages Router</title>
      </head>
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
