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

// REGISTRATION API

app.post("/api/auth/register", async (req,res) => {

console.log("registration Request received");

try{

const name = req.body.name;
const employee_id = req.body.employee_id;
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

"INSERT INTO users(name , employee_id , company_name , number , email , password )VALUES($1, $2, $3, $4, $5, $6) RETURNING id, name , company_name , number, email, employee_id",
[ name , employee_id , company_name , number , email , hashedPassword ]

);

res.status(201).json({

message: "Registration Successfull",
user: result.rows[0]

})

} catch(error){

 console.log(error);

  res.status(500).send("something went wrong.");

}

});

// LOGIN API 

app.post("/api/auth/login" , async (req , res ) => {

   const email = req.body.email;
   const password = req.body.password;

   if(!email || !password ){

    return res.status(400).json({

       success: false,
       message: "Email and password are required"

    });

   }

   const result = await pool.query(

    "SELECT id , name, employee_id , company_name, number, email , password FROM users WHERE email = $1",
    [email]

   );

   if(result.rows.length === 0){

    return res.status(401).json({

      success: false,
      message: "Invalid Email or Password",

    });

   }

   const user = result.rows[0];

   const matchedPassword = await bcrypt.compare(password , user.password);

   if(!matchedPassword){

    return res.status(401).json({
 
      success: false,
      message: "Invalid Email or Password"

    });

   }

   return res.status(200).json({

     success: true,
     message: "Login Successful",

     user:{

     id: user.id,
     name: user.name,
     employee_id: user.employee_id,
     company_name: user.company_name,
     number: user.number,
     email: user.email

     }

   });

});

// RECENT ACTIVITIES API

app.post("/api/activities", async (req, res) => {

try{
 
const {

  user_id,
  type,
  title,
  description,
} = req.body;

const result = await pool.query(

'INSERT INTO activities (user_id, type, title, description) VALUES($1, $2, $3, $4) RETURNING *',[user_id, type, title, description] 

);

res.status(201).json({

success: true,
message: "Activity Created Successfully",
activity: result.rows[0]

});

} catch(error){

console.error("Activity Error :",error);

res.status(500).json({

  success: false,
  message: "Failed to create Activity"

});

}


});

// FETCH RECENT ACTIVITIES FROM THE DATABASE AND DISPLAY

app.get("/api/activities/:user_id", async (req, res) =>{

try{

const {user_id} = req.params;

const result = await pool.query(

'SELECT activities.id, activities.type, activities.title, activities.description, activities.create_at, users.name, users.employee_id FROM activities JOIN users ON activities.user_id = users.id WHERE activities.user_id = $1 ORDER BY activities.create_at DESC',

[user_id]

);

res.status(200).json({

 success:true,
 activities: result.rows

});

} catch(error){

console.log("Fetch activity error:",error);

res.status(500).json({

success: false,
message:"Failed to Fetch Activities"

});

}

});

app.listen(3000, () => {

console.log("DealBridge backend server is running on port 3000");

});