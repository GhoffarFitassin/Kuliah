import { useRouter } from "next/router";

const CategoryPage = () => {
  const { query } = useRouter();
  const slugList = Array.isArray(query.slug) ? query.slug : [];

  return (
    <div>
      <h1>Halaman Category</h1>
      {slugList.length > 0 ? (
        <ul>
          {slugList.map((segment, index) => (
            <li key={`${segment}-${index}`}>{segment}</li>
          ))}
        </ul>
      ) : (
        <p>Parameter category belum tersedia.</p>
      )}
    </div>
  );
};

export default CategoryPage;
