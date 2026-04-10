import { useRouter } from "next/router";
import Navbar from "../Navbar/index";
import Footer from "../Footer/index";

const disableNavbar = new Set([
  "/auth/login",
  "/auth/register",
  "/views/auth/login",
  "/views/auth/register",
  "/404",
]);

type AppShellProps = {
  children: React.ReactNode;
};

const AppShell = (props: AppShellProps) => {
  const { children } = props;
  const { pathname } = useRouter();
  return (
    <main>
      {!disableNavbar.has(pathname) && <Navbar />}
      {children}
      {!disableNavbar.has(pathname) && <Footer />}
    </main>
  );
};

export default AppShell;
