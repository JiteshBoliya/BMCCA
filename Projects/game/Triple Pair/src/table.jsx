import { useState } from "react";
import { createDeck } from "./gameLogic";
import Card from "./card.jsx";
import "./table.css";

export default function Table() {
     const seats = [
    "Player 1",
    "Player 2",
    "Player 3",
    "Player 4",
    "Player 5",
    "Player 6",
    "Player 7",
    "Player 8",
  ];

  const [deck, setDeck] = useState(()=> createDeck());
  const [discard, setDiscard] = useState([]);

  const drawCard = () => {
    if (deck.length === 0) return;

    const newDeck = [...deck];
    const card = newDeck.pop();

    setDeck(newDeck);
    setDiscard([...discard, card]);
  };

  return (
    <div className="table-wrapper">
      <div className="table">

        {/* Top */}
        <div className="seat top">{seats[0]}</div>

        {/* Top Right */}
        <div className="seat top-right">{seats[1]}</div>

        {/* Right */}
        <div className="seat right">{seats[2]}</div>

        {/* Bottom Right */}
        <div className="seat bottom-right">{seats[3]}</div>

        {/* Bottom */}
        <div className="seat bottom">{seats[4]}</div>

        {/* Bottom Left */}
        <div className="seat bottom-left">{seats[5]}</div>

        {/* Left */}
        <div className="seat left">{seats[6]}</div>

        {/* Top Left */}
        <div className="seat top-left">{seats[7]}</div>

        {/* Center */}
        <div className="center-area">

          {/* Deck */}
          <div className="deck-area" onClick={drawCard}>
            <div className="deck-back"></div>
            <span>Deck</span>
          </div>

          {/* Discard */}
          <div className="discard-area">
            {discard.length > 0 && (
              <Card card={discard[discard.length - 1]} />
            )}
            <span>Discard</span>
          </div>
        

        </div>

      </div>
    </div>
  );
}
