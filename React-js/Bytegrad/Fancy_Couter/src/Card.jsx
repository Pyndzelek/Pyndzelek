import Title from "./Title";
import Count from "./Count.jsx";
import ResetButton from "./ResetButton.jsx";
import { CountButtons, CountButton } from "./CountButtons.jsx";
import { useEffect, useState } from "react";

export default function Card() {
  const [number, setNumber] = useState(0);
  const locked = number === 5 ? true : false;

  useEffect(() => {
    const handleKeydown = (e) => {
      if (e.code === "Space" && number < 5) {
        setNumber(number + 1);
      }
    };

    window.addEventListener("keydown", handleKeydown);

    return () => {
      window.removeEventListener("keydown", handleKeydown);
    };
  }, [number]);

  return (
    <div className={`card ${locked ? `card--limit` : ""}`}>
      <Title title={locked ? "PAY ME MONEY!!!" : "Fancy Counter"} />
      <Count number={number} />
      <ResetButton setNumber={setNumber} />
      <CountButtons>
        <CountButton setNumber={setNumber} update={-1} locked={locked} />
        <CountButton setNumber={setNumber} update={1} locked={locked} />
      </CountButtons>
    </div>
  );
}
