const mongoose = require("mongoose");

async function performStructuralChanges() {
  try {
    const db = mongoose.connection.db;

    // 1. Rename 'courses' to 'courseList'
    const oldName = "courses";
    const newName = "courseList";

    const collections = await db.listCollections().toArray();
    const exists = collections.some((col) => col.name === oldName);

    if (exists) {
      await db.collection(oldName).rename(newName);
      console.log(`1. Collection renamed: '${oldName}' ➝ '${newName}'`);
    } else {
      console.log(`Collection '${oldName}' does not exist, skipping rename.`);
    }

    // 2️. Drop (delete) 'library' collection
    const libraryExists = collections.some((col) => col.name === "libraries");

    if (libraryExists) {
      await db.dropCollection("libraries");
      console.log("2. Collection 'libraries' dropped successfully.");
    } else {
      console.log("'libraries' collection does not exist, skipping drop.");
    }

    console.log("\nStructural modifications completed successfully.");
  } catch (err) {
    console.error("Error performing structural changes:", err.message);
  }
}

module.exports = performStructuralChanges;
