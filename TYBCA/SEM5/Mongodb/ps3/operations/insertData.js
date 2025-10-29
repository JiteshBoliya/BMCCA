const Student = require("../models/student.model");
const Faculty = require("../models/faculty.model");
const Course = require("../models/course.model");
const Department = require("../models/department.model");
const Library = require("../models/library.model");

async function createSampleData() {
  try {
    // Students
    await Student.insertMany([
      { studentId: "S101", name: "Rahul Sharma", email: "rahul@bca.com", marks: 85, courseEnrolled: "BCA", admissionDate: new Date("2023-07-01") },
      { studentId: "S102", name: "Priya Verma", email: "priya@mca.com", marks: 90, courseEnrolled: "MCA", admissionDate: new Date("2023-06-15") },
      { studentId: "S103", name: "Vikas Singh", email: "vikas@bba.com", marks: 75, courseEnrolled: "BBA", admissionDate: new Date("2022-08-20") },
      { studentId: "S104", name: "Aditi Patel", email: "aditi@mba.com", marks: 95, courseEnrolled: "MBA", admissionDate: new Date("2024-01-10") },
      { studentId: "S105", name: "Rohit Mehta", email: "rohit@bca.com", marks: 60, courseEnrolled: "BCA", admissionDate: new Date("2023-03-05") },
    ]);

    // Faculty
    await Faculty.insertMany([
      { facultyId: "F201", name: "Dr. Neha Patel", department: "Computer Science", email: "neha@bmcca.edu", experienceYears: 10, subjects: ["Web Development", "Database Systems"] },
      { facultyId: "F202", name: "Dr. Kiran Rao", department: "Management", email: "kiran@bmcca.edu", experienceYears: 15, subjects: ["Marketing", "HRM"] },
      { facultyId: "F203", name: "Dr. Rakesh Kumar", department: "Business", email: "rakesh@bmcca.edu", experienceYears: 8, subjects: ["Finance", "Economics"] },
      { facultyId: "F204", name: "Dr. Smita Jain", department: "Commerce", email: "smita@bmcca.edu", experienceYears: 5, subjects: ["Accounting", "Taxation"] },
      { facultyId: "F205", name: "Dr. Sanjay Desai", department: "Computer Science", email: "sanjay@bmcca.edu", experienceYears: 12, subjects: ["AI", "ML"] },
    ]);

    // Courses
    await Course.insertMany([
      { courseId: "C301", courseName: "Full Stack Development", credits: 5, durationMonths: 6, department: "Computer Science" },
      { courseId: "C302", courseName: "Business Analytics", credits: 4, durationMonths: 8, department: "Business" },
      { courseId: "C303", courseName: "Financial Management", credits: 3, durationMonths: 4, department: "Commerce" },
      { courseId: "C304", courseName: "Marketing Strategy", credits: 4, durationMonths: 5, department: "Management" },
      { courseId: "C305", courseName: "Database Systems", credits: 6, durationMonths: 6, department: "Computer Science" },
    ]);

    // Departments
    await Department.insertMany([
      { deptId: "D401", deptName: "Computer Science", totalFaculty: 12, coursesOffered: ["BCA", "MCA"], location: "Building A" },
      { deptId: "D402", deptName: "Business", totalFaculty: 10, coursesOffered: ["BBA"], location: "Building B" },
      { deptId: "D403", deptName: "Commerce", totalFaculty: 8, coursesOffered: ["BCom"], location: "Building C" },
      { deptId: "D404", deptName: "Management", totalFaculty: 9, coursesOffered: ["MBA"], location: "Building B" },
      { deptId: "D405", deptName: "Information Systems", totalFaculty: 7, coursesOffered: ["MCA"], location: "Building A" },
    ]);

    // Library
    await Library.insertMany([
      { bookId: "B501", title: "Learning MongoDB", author: "John Doe", category: "Database", isAvailable: true },
      { bookId: "B502", title: "Mastering JavaScript", author: "Kyle Simpson", category: "Programming", isAvailable: true },
      { bookId: "B503", title: "Network Fundamentals", author: "Andrew Tanenbaum", category: "Networking", isAvailable: false, issuedTo: "Rahul Sharma", issueDate: new Date("2025-10-01") },
      { bookId: "B504", title: "Business Finance", author: "Peter Atrill", category: "Finance", isAvailable: true },
      { bookId: "B505", title: "Management Principles", author: "Koontz", category: "Management", isAvailable: false, issuedTo: "Aditi Patel", issueDate: new Date("2025-09-20") },
    ]);

    console.log("Inserted 5 documents into each collection successfully!");
  } catch (err) {
    console.error("Error inserting documents:", err.message);
  }
}

module.exports = createSampleData;