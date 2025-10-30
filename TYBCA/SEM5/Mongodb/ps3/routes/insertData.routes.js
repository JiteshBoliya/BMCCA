const Student = require("../models/studentModel");
const Faculty = require("../models/facultyModel");
const Course = require("../models/courseModel");
const Department = require("../models/departmentModel");
const Library = require("../models/libraryModel");

async function insertHandler(req, res, pathname, body) {
  const data = JSON.parse(body);
  let result;

  if (pathname === "/insert/student") result = await Student.create(data);
  else if (pathname === "/insert/faculty") result = await Faculty.create(data);
  else if (pathname === "/insert/course") result = await Course.create(data);
  else if (pathname === "/insert/department") result = await Department.create(data);
  else if (pathname === "/insert/library") result = await Library.create(data);
  else {
    res.statusCode = 404;
    return res.end(JSON.stringify({ message: "Invalid insert route" }));
  }

  res.end(JSON.stringify({ message: "Inserted Successfully", result }));
}

module.exports = insertHandler;
