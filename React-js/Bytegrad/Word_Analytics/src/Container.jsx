import { FACEBOOK_MAX_CHARACTERS, INSTAGRAM_MAX_CHARACTERS } from "./constants";
import Stats from "./Stats";
import Textarea from "./Textarea";
import { useState } from "react";

export default function Container() {
  const [text, setText] = useState("");

  const stats = {
    numberOfWords: text.split(/\s/).filter((word) => word !== "").length,
    facebookCharactersLength: FACEBOOK_MAX_CHARACTERS - text.length,
    instagramCharactersLength: INSTAGRAM_MAX_CHARACTERS - text.length,
    numberOfCharacters: text.length,
  };

  return (
    <main className="container">
      <Textarea text={text} setText={setText} />
      <Stats stats={stats} />
    </main>
  );
}
