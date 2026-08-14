require("dotenv").config();

const express = require("express");
const bcrypt = require("bcrypt");
const {Pool} = require("pg");

const pool = new Pool({

host: process.env.DB_HOST,
port: process.env.DB_PORT,
database: process.env.DB_NAME,
user: process.env.DB_USER,
password: process.env.DB_PASSWORD


});

pool.query("SELECT NOW()", (error,result) =>{

if(error){

  console.log("Database connection failed");
  console.log(error);

}
else{

 console.log("Database connected Succesfully");
 console.log(result.rows);

}


});

const app = express();

app.use(express.json());

app.get("/", (req,res) =>{

res.send("DealBridge Backend is working!");

});

app.post("/api/auth/register", async (req,res) => {

try{

const name =  req.body.name;
const email = req.body.email;
const password = req.body.password;

if(!name || !email || !password){

    return res.status(400).send("All fields are required");

}

if(!email.includes("@")){

return res.status(400).send("please enter a valid email");

}

if(password.length < 8){

  return res.status(400).send("password must be atleast 8 characters");

}

const hashedPassword = await bcrypt.hash(password,10);

console.log(name);
console.log(email);
console.log(hashedPassword);

res.send("Registration API is working!");

} catch(error){

 console.log(error);

  res.status(500).send("something went wrong.");

}

});



app.listen(3000, () => {

console.log("DealBridge backend server is running on port 3000");

});