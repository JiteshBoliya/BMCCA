const mongoose = require("mongoose");

const librarySchema = new mongoose.Schema({
  bookId: { type: String, required: true, unique: true },
  title: { type: String, required: true },
  author: { type: String, required: true },
  category: { type: String, enum: ["Database", "Programming", "Networking", "Management", "Finance"] },
  isAvailable: { type: Boolean, default: true },
  issuedTo: { type: String, match: /^[A-Za-z\s]*$/ },
  issueDate: Date,
});

module.exports = mongoose.model("Library", librarySchema);