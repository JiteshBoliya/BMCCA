const mongoose = require("mongoose");

const connectDB = async () => {
  const MONGO_URI = "mongodb://127.0.0.1:27017/bmccaDb";
  try {
    await mongoose.connect(MONGO_URI);
    console.log("MongoDB connected: bmccaDb");
  } catch (err) {
    console.error("Database connection failed:", err.message);
    process.exit(1);
  }
};

connectDB();
// module.exports = connectDB;