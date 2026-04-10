import { useEffect, useState } from "react";
import TampilanProduk from "../../views/produk";
import useSWR from "swr";
import fetcher from "../../utils/swr/fetcher";

// const fetcher = (url: string) => fetch(url).then((res) => res.json());

const ProdukPage = () => {
  // const [isLogin, setIsLogin] = useState(false);
  // const { push } = useRouter();
  const [products, setProducts] = useState([]);
  // console.log("products:", products);
  // useEffect(() => {
  //   if (!isLogin) {
  //     push("/auth/login");
  //   }
  // }, []);
  const [isRefreshing, setIsRefreshing] = useState(false);

  // const fetchProducts = async () => {
  //   setIsRefreshing(true);
  //   try {
  //     const response = await fetch("/api/produk");

  //     if (!response.ok) {
  //       throw new Error(`HTTP error! status: ${response.status}`);
  //     }

  //     const responseData = await response.json();
  //     setProducts(responseData.data ?? []);
  //   } catch (error) {
  //     console.error("Error fetching produk:", error);
  //   } finally {
  //     setIsRefreshing(false);
  //   }
  // };

  // useEffect(() => {
  //   fetchProducts();
  // }, []);

  const { data, error, isLoading } = useSWR("/api/produk", fetcher);
  //cek apakah data, error, dan isLoading sudah benar
  // console.log("data:", data);
  // console.log("error:", error);
  // console.log("isLoading:", isLoading);

  return (
    <div>
      {/* <button
        type="button"
        onClick={fetchProducts}
        disabled={isRefreshing}
        style={{
          marginBottom: "16px",
          padding: "10px 16px",
          backgroundColor: isRefreshing ? "#9CA3AF" : "#2563EB",
          color: "#FFFFFF",
          border: "none",
          borderRadius: "8px",
          fontSize: "14px",
          fontWeight: 600,
          cursor: isRefreshing ? "not-allowed" : "pointer",
        }}
      >
        {isRefreshing ? "Memuat data..." : "Refresh Data"}
      </button> */}
      <TampilanProduk products={isLoading ? [] : data.data} />
    </div>
  );
};

export default ProdukPage;
