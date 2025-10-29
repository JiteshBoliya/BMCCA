// Import all models so Mongoose registers them as collections
require("./models/student.model");
require("./models/faculty.model");
require("./models/course.model");
require("./models/department.model");
require("./models/library.model");
const mongoose = require("mongoose");

async function createCollections() {
    // Explicitly create collections (empty) in the database
    const collections = ["students", "faculties", "courses", "departments", "libraries"];

    for (const name of collections) {
        const exists = await mongoose.connection.db
        .listCollections({ name })
        .hasNext();

        if (!exists) {
        await mongoose.connection.createCollection(name);
        console.log(`Collection created: ${name}`);
        } else {
        console.log(`Collection already exists: ${name}`);
        }
    }

    console.log("Database setup complete — all collections ready.");
}

module.exports = createCollections;