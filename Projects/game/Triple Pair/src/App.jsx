// import { useState } from "react";
// import Card from "./card.jsx";
// import { createDeck, checkThreePairs } from "./gameLogic";
import Table from "./table.jsx";

export default function App() {
  // const [deck, setDeck] = useState([]);
  // const [discard, setDiscard] = useState([]);
  // const [players, setPlayers] = useState([]);
  // const [turn, setTurn] = useState(0);
  // const [started, setStarted] = useState(false);
  // const [winner, setWinner] = useState(null);
  // const [picked, setPicked] = useState(false);

  // const startGame = () => {
  //   const d = createDeck();
  //   const p = [
  //     { name: "Player 1", hand: d.splice(0, 5) },
  //     { name: "Player 2", hand: d.splice(0, 5) }
  //   ];
  //   setDeck(d);
  //   setPlayers(p);
  //   setDiscard([]);
  //   setTurn(0);
  //   setStarted(true);
  //   setWinner(null);
  //   setPicked(false);
  // };

  // const drawFromDeck = () => {
  //   if (picked) return;
  //   const card = deck.pop();
  //   const p = [...players];
  //   p[turn].hand.push(card);

  //   setDeck([...deck]);
  //   setPlayers(p);
  //   setPicked(true);

  //   if (checkThreePairs(p[turn].hand)) {
  //     setWinner(p[turn].name);
  //   }
  // };

  // const drawFromDiscard = () => {
  //   if (picked || discard.length === 0) return;
  //   const card = discard.pop();
  //   const p = [...players];
  //   p[turn].hand.push(card);

  //   setDiscard([...discard]);
  //   setPlayers(p);
  //   setPicked(true);

  //   if (checkThreePairs(p[turn].hand)) {
  //     setWinner(p[turn].name);
  //   }
  // };

  // const discardCard = (index) => {
  //   if (!picked) return;

  //   const p = [...players];
  //   const [card] = p[turn].hand.splice(index, 1);
  //   setDiscard([...discard, card]);
  //   setPlayers(p);
  //   setPicked(false);
  //   setTurn((turn + 1) % players.length);
  // };

  // if (!started) {
  //   return (
  //     <div className="center">
  //       <h1>🎴 Triple Pair</h1>
  //       <button onClick={startGame}>Create Room</button>
  //     </div>
  //   );
  // }

  // if (winner) {
  //   return (
  //     <div className="center">
  //       <h1>🏆 {winner} Wins!</h1>
  //       <button onClick={startGame}>Restart</button>
  //     </div>
  //   );
  // }

  return (
    // <div className="game">
    //   <h2>Turn: {players[turn].name}</h2>

    //   <div className="table">
    //     <div>
    //       <h4>Deck ({deck.length})</h4>
    //       <div className="stack" onClick={drawFromDeck}></div>
    //     </div>

    //     <div>
    //       <h4>Discard</h4>
    //       {discard.length > 0 && <Card card={discard[discard.length - 1]} />}
    //     </div>
    //   </div>

    //   <button onClick={drawFromDiscard}>Pick Discard</button>

    //   <h3>Your Cards (click to discard)</h3>
    //   <div className="hand">
    //     {players[turn].hand.map((c, i) => (
    //       <Card key={i} card={c} onClick={() => discardCard(i)} />
    //     ))}
    //   </div>
    // </div>
    <Table />
  );
}
