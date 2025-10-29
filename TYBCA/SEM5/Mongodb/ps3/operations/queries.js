const Student = require("../models/student.model");
const Faculty = require("../models/faculty.model");
const Course = require("../models/course.model");
const Department = require("../models/department.model");
const Library = require("../models/library.model");

async function performQueries() {
  try {
    // 1. Find all students who scored more than 75 marks
    const highScoringStudents = await Student.find({ marks: { $gt: 75 } });
    console.log("1. Students with marks > 75:\n", highScoringStudents, "\n");

    // 2️. Find students enrolled in "BCA" course and show only their name and marks
    const bcaStudents = await Student.find({ courseEnrolled: "BCA" }, { name: 1, marks: 1, _id: 0 });
    console.log("2. BCA Students (Name & Marks):\n", bcaStudents, "\n");

    // 3️. Faculty members with >5 years experience in "Computer Science"
    const experiencedFaculty = await Faculty.find({ experienceYears: { $gt: 5 }, department: "Computer Science" });
    console.log("3. Faculty with >5 years in CS:\n", experiencedFaculty, "\n");

    // 4️. Faculty whose names start with "R" (regex)
    const facultyStartingWithR = await Faculty.find({ name: { $regex: /^R/i } });
    console.log(" 4. Faculty names starting with 'R':\n", facultyStartingWithR, "\n");

    // 5️. Courses that have more than 4 credits
    const highCreditCourses = await Course.find({ credits: { $gt: 4 } });
    console.log("5. Courses with credits > 4:\n", highCreditCourses, "\n");

    // 6️. Active courses sorted by duration ascending
    const activeCourses = await Course.find({ isActive: true }).sort({ durationMonths: 1 });
    console.log("6. Active courses sorted by duration (asc):\n", activeCourses, "\n");

    // 7️. Departments where totalFaculty < 10 or located in "Block A"
    const smallOrBlockADepts = await Department.find({
      $or: [{ totalFaculty: { $lt: 10 } }, { location: "Block A" }],
    });
    console.log("7. Departments with <10 faculty OR in Block A:\n", smallOrBlockADepts, "\n");

    // 8️. Show only deptName and coursesOffered
    const deptDetails = await Department.find({}, { deptName: 1, coursesOffered: 1, _id: 0 });
    console.log("8. Department names & courses offered:\n", deptDetails, "\n");

    // 9️. Available books in "Computer Science" category
    const availableBooks = await Library.find({ category: "Computer Science", isAvailable: true });
    console.log("9. Available CS books:\n", availableBooks, "\n");

    // 10. Latest 3 books issued (sorted by issueDate desc)
    const latestIssuedBooks = await Library.find({ issueDate: { $ne: null } })
      .sort({ issueDate: -1 })
      .limit(3);
    console.log("10. Latest 3 books issued:\n", latestIssuedBooks, "\n");

    console.log("All queries executed successfully.");
  } catch (err) {
    console.error("Error running queries:", err.message);
  }
}

module.exports = performQueries;
