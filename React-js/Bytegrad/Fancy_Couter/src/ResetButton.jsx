import { ResetIcon } from "@radix-ui/react-icons";

export default function ResetButton({ setNumber }) {
  const hadleClick = (e) => {
    setNumber(0);
    e.currentTarget.blur();
  };

  return (
    <button className="reset-btn" onClick={hadleClick}>
      <ResetIcon className="reset-btn-icon" />
    </button>
  );
}
