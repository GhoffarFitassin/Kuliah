import { render, screen } from "@testing-library/react";
import TampilanProduk from "@/pages/produk";

// Mock next/router
jest.mock("next/router", () => ({
  useRouter() {
    return {
      route: "/produk",
      pathname: "/produk",
      query: {},
      asPath: "/produk",
      push: jest.fn(),
      replace: jest.fn(),
      events: {
        on: jest.fn(),
        off: jest.fn(),
        emit: jest.fn(),
      },
      isReady: true,
    };
  },
}));

// Mock SWR to control data states
jest.mock("swr", () => ({
  __esModule: true,
  default: jest.fn(),
}));

import useSWR from "swr";
const mockedUseSWR = useSWR as jest.MockedFunction<typeof useSWR>;

describe("Product Page (Halaman Produk)", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  // 1. Snapshot test
  it("renders product page and matches snapshot", () => {
    mockedUseSWR.mockReturnValue({
      data: undefined,
      error: undefined,
      isLoading: true,
    });
    const page = render(<TampilanProduk />);
    expect(page).toMatchSnapshot();
  });

  // 2. getByTestId + toBe test
  it("renders the product title using getByTestId and toBe", () => {
    mockedUseSWR.mockReturnValue({
      data: {
        data: [
          {
            id: "1",
            name: "Sepatu Nike",
            price: 1500000,
            size: "42",
            category: "Sepatu",
            image: "https://example.com/shoe.jpg",
          },
        ],
      },
      error: undefined,
      isLoading: false,
    });
    render(<TampilanProduk />);
    // getByTestId + toBe()
    expect(screen.getByTestId("product-page")).toBeTruthy();
    expect(screen.getByTestId("product-title").textContent).toBe(
      "Daftar Produk",
    );
  });

  // 3. Test product list renders with data
  it("renders product items when data is loaded", () => {
    mockedUseSWR.mockReturnValue({
      data: {
        data: [
          {
            id: "1",
            name: "Sepatu Nike",
            price: 1500000,
            size: "42",
            category: "Sepatu",
            image: "https://example.com/shoe.jpg",
          },
          {
            id: "2",
            name: "Tas Ransel",
            price: 350000,
            size: "Large",
            category: "Tas",
            image: "https://example.com/bag.jpg",
          },
        ],
      },
      error: undefined,
      isLoading: false,
    });
    render(<TampilanProduk />);
    expect(screen.getByText("Sepatu Nike")).toBeInTheDocument();
    expect(screen.getByText("Tas Ransel")).toBeInTheDocument();
    expect(screen.getAllByText(/Rp/).length).toBe(2);
  });
});
