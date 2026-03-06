import Navbar from "../Navbar/index";
import Footer from "../Footer/index";

type AppShellProps = {
  children: React.ReactNode;
};

const AppShell = (props: AppShellProps) => {
  const { children } = props;
  return (
    <main>
      <Navbar />
      {children}
      <Footer />
    </main>
  );
};

export default AppShell;
