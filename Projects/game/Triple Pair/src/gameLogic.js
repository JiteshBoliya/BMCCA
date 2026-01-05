export const createDeck = () => {
  const suits = ["♠", "♥", "♦", "♣"];
  const values = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"];
  let deck = [];

  suits.forEach(suit => {
    values.forEach(value => {
      deck.push({ value, suit });
    });
  });

  return shuffle(deck);
};

const shuffle = (cards) => {
  return [...cards].sort(() => Math.random() - 0.5);
};

export const checkThreePairs = (hand) => {
  const count = {};

  hand.forEach(card => {
    count[card.value] = (count[card.value] || 0) + 1;
  });

  let pairs = 0;
  Object.values(count).forEach(v => {
    if (v >= 2) pairs++;
  });

  return pairs >= 3;
};
