const Student = require("../models/studentModel");
const Faculty = require("../models/facultyModel");
const Library = require("../models/libraryModel");

async function updateDeleteHandler(req, res, pathname, body) {
  const data = JSON.parse(body);
  let result;

  // Update Student Marks
  if (pathname === "/update/student") {
    result = await Student.updateOne({ studentId: data.id }, { marks: data.marks });
  }

  // Update Faculty Email
  else if (pathname === "/update/faculty") {
    result = await Faculty.updateOne({ facultyId: data.id }, { email: data.email });
  }

  // Delete Faculty
  else if (pathname === "/delete/faculty") {
    result = await Faculty.deleteOne({ facultyId: data.id });
  }

  // Delete Library Book
  else if (pathname === "/delete/librarybook") {
    result = await Library.deleteOne({ bookId: data.id });
  }

  else {
    res.statusCode = 404;
    return res.end(JSON.stringify({ message: "Invalid update/delete route" }));
  }

  res.end(JSON.stringify({ message: "Operation successful", result }));
}

module.exports = updateDeleteHandler;
