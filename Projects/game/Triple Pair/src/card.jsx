export default function Card({ card, onClick }) {
  if (!card) return null;

  const isRed = card.suit === "♥" || card.suit === "♦";

  return (
    <div className={`card ${isRed ? "red" : "black"}`} onClick={onClick}>
      <div className="corner top">
        <div>{card.value}</div>
        <div>{card.suit}</div>
      </div>

      <div className="center-suit">{card.suit}</div>

      <div className="corner bottom">
        <div>{card.value}</div>
        <div>{card.suit}</div>
      </div>
    </div>
  );
}
