import Link from "next/link";
import { useRouter } from "next/router";

const HalamanLogin = () => {
    const{ push } = useRouter();
    const handlerLogin = () => {
      push('/produk');
    }
  return (
    <div>
      <h1>Halaman Login</h1>
      {/* Navigasi Imperatif */}
      <button onClick={handlerLogin}>Login</button> <br /> 
      {/* Navigasi Link */}
      <Link href="/auth/register">Ke Halaman Register</Link>
    </div>
  );
};

export default HalamanLogin;
