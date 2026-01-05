import { useState } from "react";
import { createDeck } from "./gameLogic";
import Card from "./card.jsx";
import "./table.css";

export default function Table() {
  // const seats = [
  //   "Player 1",
  //   "Player 2",
  //   "Player 3",
  //   "Player 4",
  //   "Player 5",
  //   "Player 6",
  //   "Player 7",
  //   "Player 8",
  // ];

  const PLAYER_COUNT = 8;
  const CARDS_PER_PLAYER = 5;

  const [players, setPlayers] = useState(() =>
    Array.from({ length: PLAYER_COUNT }, (_, i) => ({
      id: i,
      name: `Player ${i + 1}`,
      hand: [],
    }))
  );

  const [deck, setDeck] = useState(() => createDeck());
  const [discard, setDiscard] = useState([]);

  const startGame = () => {
    const shuffledDeck = createDeck();
    const newPlayers = players.map((p) => ({ ...p, hand: [] }));

    let index = 0;

    // Distribute 5 cards to each player (round-robin)
    for (let c = 0; c < CARDS_PER_PLAYER; c++) {
      for (let p = 0; p < PLAYER_COUNT; p++) {
        newPlayers[p].hand.push(shuffledDeck[index]);
        index++;
      }
    }
    setPlayers(newPlayers);
    setDeck(shuffledDeck.slice(index));
    setDiscard([]);
  };

  const drawCardToDiscard = () => {
    if (deck.length === 0) return;

    const newDeck = [...deck];
    const card = newDeck.pop();

    setDeck(newDeck);
    setDiscard([...discard, card]);
  };

  return (
    <div className="table-wrapper">
      <div className="table">
        {/* Player Seats */}
        {players.map((p, i) => (
          <div>
            <div key={p.id} className={`seat player${i + 1} `}>
              {p.name}
            </div>
            <div className={`player${i + 1} seat-hand  player-hand${i + 1}`}>
              {p.hand.map((card, idx) => (
                <Card key={idx} card={card} />
              ))}
            </div>
          </div>
        ))}

        {/* Center */}
        <div className="center-area">
          <div className="deck-area" onClick={drawCardToDiscard}>
            <div className="deck-back"></div>
            <span>{deck.length}</span>
          </div>

          <div className="discard-area">
            {discard.length > 0 && <Card card={discard[discard.length - 1]} />}
          </div>
        </div>
        <div className="bottom-bar">
          <button className="start-btn" onClick={startGame}>
            Start Game
          </button>
        </div>
      </div>
    </div>
  );
}
