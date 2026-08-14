require("dotenv").config();

const express = require("express");
const bcrypt = require("bcrypt");
const {Pool} = require("pg");
const validator = require("validator");

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

const name = req.body.name;
const company_name = req.body.company_name;
const number = req.body.number;
const email = req.body.email;
const password = req.body.password;
const confirm_password = req.body.confirm_password;

if(!name || !company_name || !number || !email || !password || !confirm_password){

return res.status(400).json({

   success: false,
   message: "All fields are required "

});

}

if(password !== confirm_password){

 return res.status(400).json({

  success: false,
  message:"password do not match"


 });

}

if(!validator.isEmail(email)){

return res.status(400).json({

 success:false,
 message:"please enter a valid Email"

});

}

const phoneRegex = /^[0-9]{10}$/;

if(!phoneRegex.test(number)){

return res.status(400).json({

success: false,
message:"phone number must be exacly 10 digits"

});

} 

if(password.length < 8){

 return res.status(400).json({

  success: false,
  message:"password must be atleast 8 Characters"

 });

}

const ExistingUser = await pool.query(

"SELECT id FROM users WHERE email = $1 ",
[email]

);

if(ExistingUser.rows.length > 0){

return res.status(409).json({

 success:false,
 message:"Email Already Registered"

});

}

const Existingnumber = await pool.query(

 "SELECT id FROM users WHERE number = $1",
 [number]

);

if(Existingnumber.rows.length > 0){

return res.status(409).json({

 success: false,
 message: "phone number is Already Registered"

});

}

const hashedPassword = await bcrypt.hash(password,10);

const result = await pool.query(

"INSERT INTO users(name , company_name , number , email , password)VALUES($1, $2, $3, $4, $5) RETURNING id, name , company_name , number, email, password",
[name , company_name , number , email , hashedPassword]

);

console.log(name); 
console.log(email);
console.log(hashedPassword);

res.status(201).json({

message: "Registration Successfull",
user: result.rows[0]

})

} catch(error){

 console.log(error);

  res.status(500).send("something went wrong.");

}

});


app.listen(3000, () => {

console.log("DealBridge backend server is running on port 3000");

});