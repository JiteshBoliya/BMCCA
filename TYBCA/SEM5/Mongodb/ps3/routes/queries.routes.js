const Student = require("../models/studentModel");
const Faculty = require("../models/facultyModel");
const Course = require("../models/courseModel");
const Department = require("../models/departmentModel");
const Library = require("../models/libraryModel");

async function queryHandler(req, res, pathname) {
  let result;

  switch (pathname) {
    case "/query/highmarks":
      result = await Student.find({ marks: { $gt: 75 } });
      break;
    case "/query/bcaStudents":
      result = await Student.find({ courseEnrolled: "BCA" }, { name: 1, marks: 1 });
      break;
    case "/query/expFaculty":
      result = await Faculty.find({ experienceYears: { $gt: 5 }, department: "Computer Science" });
      break;
    case "/query/facultyNameR":
      result = await Faculty.find({ name: /^R/i });
      break;
    case "/query/highCreditCourses":
      result = await Course.find({ credits: { $gt: 4 } });
      break;
    case "/query/activeCourses":
      result = await Course.find().sort({ durationMonths: 1 });
      break;
    case "/query/departments":
      result = await Department.find({ $or: [{ totalFaculty: { $lt: 10 } }, { location: "Block A" }] });
      break;
    case "/query/deptNames":
      result = await Department.find({}, { deptName: 1, coursesOffered: 1 });
      break;
    case "/query/availableBooks":
      result = await Library.find({ category: "Computer Science", isAvailable: true });
      break;
    case "/query/latestBooks":
      result = await Library.find().sort({ issueDate: -1 }).limit(3);
      break;
    default:
      res.statusCode = 404;
      return res.end(JSON.stringify({ message: "Invalid query route" }));
  }

  res.end(JSON.stringify(result));
}

module.exports = queryHandler;
