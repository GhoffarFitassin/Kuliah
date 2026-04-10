import fetcher from "@/utils/swr/fetcher";
import { ProductType } from "@/types/Product.type";
import DetailProduk from "../../views/DetailProduct";
import { useRouter } from "next/router";
import useSWR from "swr";

const HalamanProduk = () => {
  const { query } = useRouter();
  const productId = query.product;
  const { data, isLoading } = useSWR(
    productId ? `/api/produk/${productId}` : null,
    fetcher,
  );

  return (
    <div>
      <DetailProduk
        products={data?.data as ProductType | undefined}
        isLoading={isLoading}
      />
    </div>
  );
};

export default HalamanProduk;
