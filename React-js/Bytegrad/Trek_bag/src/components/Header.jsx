import Logo from "./Logo";

export default function Header({ children }) {
  return (
    <header>
      <Logo />
      {children}
    </header>
  );
}
