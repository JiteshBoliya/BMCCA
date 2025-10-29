const mongoose = require("mongoose");

const courseSchema = new mongoose.Schema({
  courseId: { type: String, required: true, unique: true },
  courseName: { type: String, required: true },
  credits: { type: Number, min: 1, max: 10 },
  durationMonths: { type: Number, min: 1, max: 48 },
  department: { type: String, enum: ["Computer Science", "Business", "Commerce", "Management"] },
});

module.exports = mongoose.model("Course", courseSchema);