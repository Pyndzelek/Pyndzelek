import { useRef, useState } from "react";
import Button from "./Button";

export default function AddItemForm({ onAddItem }) {
  const [itemText, setItemText] = useState("");
  const inputRef = useRef(); // dzieki temu mozemy znowu ustawić textfield zeby byo aktywne, tzn, zebysmy nie musieli klikac myszką

  const handleChange = (event) => {
    setItemText(event.target.value);
  };

  const handleSubmit = (event) => {
    event.preventDefault(); //after the form is submitted, the browser instantly reloads itself and tries to go to other adress. This function prevents it.
    if (!itemText) {
      inputRef.current.focus();
      return;
    }
    onAddItem(itemText); //this function executes in App.jsx
    setItemText("");
    inputRef.current.focus();
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>Add an item</h2>
      <input
        ref={inputRef}
        value={itemText}
        onChange={handleChange}
        autoFocus
      />
      <Button>Add to list</Button>
    </form>
  );
}
