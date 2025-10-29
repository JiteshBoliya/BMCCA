const Student = require("../models/student.model");
const Faculty = require("../models/faculty.model");
const Course = require("../models/course.model");
const Department = require("../models/department.model");
const Library = require("../models/library.model");

async function performUpdatesAndDeletes() {
  try {
    console.log("Performing Update/Delete operations...\n");

    // 1. Update a student's marks (increase by 5 for a specific student)
    const updatedStudent = await Student.findOneAndUpdate(
      { name: "Ravi" },
      { $inc: { marks: 5 } },
      { new: true }
    );
    console.log("1. Updated Student Marks:\n", updatedStudent, "\n");

    // 2. Update a student’s course enrolment
    const courseUpdate = await Student.findOneAndUpdate(
      { name: "Amit" },
      { courseEnrolled: "MCA" },
      { new: true }
    );
    console.log("2. Updated Student Course Enrollment:\n", courseUpdate, "\n");

    // 3️. Update a faculty member’s email and experience
    const facultyUpdate = await Faculty.findOneAndUpdate(
      { name: "Rita" },
      { email: "rita.cs@bmcca.edu", experienceYears: 7 },
      { new: true }
    );
    console.log("3. Updated Faculty Contact Details:\n", facultyUpdate, "\n");

    // 4️. Delete outdated course records (duration > 36 months)
    const deletedCourses = await Course.deleteMany({ durationMonths: { $gt: 36 } });
    console.log("4. Deleted Outdated Courses:\n", deletedCourses, "\n");

    // 5️. Delete library books that are not available and issued more than 1 year ago
    const oneYearAgo = new Date();
    oneYearAgo.setFullYear(oneYearAgo.getFullYear() - 1);

    const deletedOldBooks = await Library.deleteMany({
      isAvailable: false,
      issueDate: { $lt: oneYearAgo },
    });
    console.log("5. Deleted Old Unavailable Books:\n", deletedOldBooks, "\n");

    // 6️. Optional: Update department totalFaculty (for example, increase by 1 in IT department)
    const deptUpdate = await Department.findOneAndUpdate(
      { deptName: "Information Technology" },
      { $inc: { totalFaculty: 1 } },
      { new: true }
    );
    console.log("6. Updated Department Faculty Count:\n", deptUpdate, "\n");

    console.log("All Update/Delete operations executed successfully.");
  } catch (err) {
    console.error("Error performing updates/deletes:", err.message);
  }
}

module.exports = performUpdatesAndDeletes;
