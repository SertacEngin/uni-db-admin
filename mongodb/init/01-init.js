db = db.getSiblingDB('uni_content');

db.students_feedback.insertMany([
{
student: "Max Mustermann",
course: "Linux Administration",
rating: 5,
comment: "Very practical and clear"
},
{
student: "Anna Schmidt",
course: "Database Systems",
rating: 4,
comment: "Good but challenging"
},
{
student: "Leon Fischer",
course: "Cloud Computing",
rating: 5,
comment: "Excellent hands-on labs"
}
]);

db.course_materials.insertMany([
{
course: "Linux Administration",
type: "pdf",
title: "Linux Basics Guide",
tags: ["linux", "shell", "admin"]
},
{
course: "Database Systems",
type: "video",
title: "SQL Joins Explained",
tags: ["sql", "joins", "database"]
}
]);
