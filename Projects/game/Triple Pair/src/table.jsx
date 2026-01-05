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
          <div className="deck">Deck</div>
          <div className="discard">Discard</div>
        </div>

      </div>
    </div>
  );
}
