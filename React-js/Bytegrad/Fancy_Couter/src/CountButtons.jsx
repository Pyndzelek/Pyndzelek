import { MinusIcon, PlusIcon } from "@radix-ui/react-icons";

export function CountButtons({ children }) {
  return <div className="button-container">{children}</div>;
}

export const CountButton = ({ setNumber, update, locked }) => {
  return (
    <button
      disabled={locked}
      className="count-btn"
      onClick={(e) => {
        setNumber((prev) => {
          if (update == -1 && prev == 0) {
            return 0;
          } else if (update == 1 && prev == 5) {
            return 5;
          } else {
            return prev + update;
          }
        });
        e.currentTarget.blur(); //so this unfocuses the button - after clicking the button it stays 'selected' so that spacebar can access it and we dont want that so we have to unfocus it :)
      }}
    >
      {update == 1 ? (
        <PlusIcon className="count-btn-icon" />
      ) : (
        <MinusIcon className="count-btn-icon" />
      )}
    </button>
  );
};
