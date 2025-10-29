const mongoose = require("mongoose");

const facultySchema = new mongoose.Schema({
  facultyId: { type: String, required: true, unique: true },
  name: { type: String, required: true },
  department: { type: String, required: true },
  email: { type: String, required: true, match: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/ },
  experienceYears: { type: Number, min: 0, max: 40 },
  subjects: { type: [String], required: true },
});

module.exports = mongoose.model("Faculty", facultySchema);