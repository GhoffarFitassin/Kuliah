import { useRouter } from "next/router";
import { useEffect, useState } from "react";
import ProdukListHeroSection from "@/components/produk/ProdukListHeroSection";
import ProdukListMainSection from "@/components/produk/ProdukListMainSection";

const ProdukPage = () => {
//   const [isLogin] = useState(false);
//   const { push } = useRouter();

//   useEffect(() => {
//     if (!isLogin) {
//       push("/views/auth/login");
//     }
//   }, [isLogin, push]);

  return (
    <div className="mx-auto flex w-full max-w-5xl flex-col gap-6 px-4 py-8 sm:px-6 lg:px-8">
      <ProdukListHeroSection />
      <ProdukListMainSection />
    </div>
  );
};

export default ProdukPage;
