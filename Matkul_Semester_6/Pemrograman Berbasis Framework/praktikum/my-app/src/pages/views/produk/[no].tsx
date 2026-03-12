import { useRouter } from "next/router";
import ProdukDetailHeroSection from "@/components/produk/ProdukDetailHeroSection";
import ProdukDetailMainSection from "@/components/produk/ProdukDetailMainSection";

const HalamanProduk = () => {
  const { query } = useRouter();
  const routeParam = query.no;
  const productNo = Array.isArray(routeParam)
    ? routeParam.join("/")
    : (routeParam ?? "-");

  return (
    <div>
      <ProdukDetailHeroSection productNo={productNo} />
      <ProdukDetailMainSection productNo={productNo} />
    </div>
  );
};

export default HalamanProduk;
