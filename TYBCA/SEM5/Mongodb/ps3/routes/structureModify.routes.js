const Course = require("../models/courseModel");
const Library = require("../models/libraryModel");

async function structureHandler(req, res, pathname) {
  if (pathname === "/rename/courses") {
    await Course.collection.rename("courseList");
    res.end(JSON.stringify({ message: "Courses renamed to courseList" }));
  } 
  else if (pathname === "/drop/library") {
    await Library.collection.drop();
    res.end(JSON.stringify({ message: "Library collection dropped" }));
  } 
  else {
    res.statusCode = 404;
    res.end(JSON.stringify({ message: "Invalid structure route" }));
  }
}

module.exports = structureHandler;
