import { render, screen } from "@testing-library/react";
import Footer from "@/components/layouts/Footer";

describe("Footer Component", () => {
  // Snapshot test
  it("renders footer and matches snapshot", () => {
    const footer = render(<Footer />);
    expect(footer).toMatchSnapshot();
  });

  // getByTestId + toBe test
  it("renders footer using getByTestId and verifies text with toBe", () => {
    render(<Footer />);
    const footerEl = screen.getByTestId("footer");
    expect(footerEl).toBeInTheDocument();
    expect(footerEl.textContent).toBe("Footer component");
  });

  it("renders inside a div with class 'footer'", () => {
    const { container } = render(<Footer />);
    const footerDiv = container.querySelector(".footer");
    expect(footerDiv).toBeInTheDocument();
  });
});
