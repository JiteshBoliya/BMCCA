const mongoose = require("mongoose");

const studentSchema = new mongoose.Schema({
  studentId: { type: String, required: true, unique: true },
  name: { type: String, required: true },
  email: { 
    type: String, 
    required: true, 
    unique: true, 
    match: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/ 
  },
  marks: { type: Number, min: 0, max: 100, required: true },
  courseEnrolled: { 
    type: String, 
    required: true, 
    enum: ["BCA", "MCA", "BSc IT", "MBA", "BCom"] 
  },
  admissionDate: { type: Date, required: true },
});

module.exports = mongoose.model("Student", studentSchema);