import { useEffect, useState } from "react";

type ProductType = {
  id: string;
  name: string;
  price: number;
  size: string;
  category: string;
};

const ProdukPage = () => {
  //   const [isLogin] = useState(false);
  //   const { push } = useRouter();

  const [product, setProducts] = useState<ProductType[]>([]);
  const [isRefreshing, setIsRefreshing] = useState(false);

  const fetchProducts = async () => {
    setIsRefreshing(true);
    try {
      const response = await fetch("/api/produk");

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const responseData = await response.json();
      setProducts(responseData.data ?? []);
    } catch (error) {
      console.error("Error fetching produk:", error);
    } finally {
      setIsRefreshing(false);
    }
  };

  //   useEffect(() => {
  //     if (!isLogin) {
  //       push("/views/auth/login");
  //     }
  //   }, [isLogin, push]);

  useEffect(() => {
    fetchProducts();
  }, []);

  return (
    <div>
      <h1>Daftar Produk</h1>
      <button
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
      </button>
      {product.map((product: ProductType) => (
        <div key={product.id}>
          <h2>Nama: {product.name}</h2>
          <p>Harga: {product.price}</p>
          <p>Ukuran: {product.size}</p>
          <p>Kategori: {product.category}</p>
        </div>
      ))}
    </div>
  );
};

export default ProdukPage;
