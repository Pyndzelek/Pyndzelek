import { useState } from "react";
import Warning from "./Warning";

export default function Textarea({ text, setText }) {
  const [warningText, setShowWarning] = useState("");

  //The basic validation
  const handleChange = (e) => {
    let newText = e.target.value;
    if (newText.includes("<script>")) {
      setShowWarning("No script tag allowed.");
      newText = newText.replace("<script>", "");
    } else if (newText.includes("@")) {
      setShowWarning("No @ symbol allowed");
      newText = newText.replace("@", "");
    } else {
      setShowWarning("");
    }
    setText(newText);
  };

  return (
    <div className="textarea">
      <textarea
        value={text}
        onChange={handleChange}
        placeholder="Enter your text"
        spellCheck="false"
      />
      <Warning warningText={warningText} />
    </div>
  );
}
