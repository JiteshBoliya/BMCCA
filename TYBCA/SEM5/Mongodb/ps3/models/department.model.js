const mongoose = require("mongoose");

const departmentSchema = new mongoose.Schema({
  deptId: { type: String, required: true, unique: true },
  deptName: { type: String, required: true },
  totalFaculty: { type: Number, min: 1 },
  coursesOffered: { type: [String], required: true },
  location: { type: String, enum: ["Building A", "Building B", "Building C"] },
});

module.exports = mongoose.model("Department", departmentSchema);