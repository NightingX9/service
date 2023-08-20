const express = require('express')
const mysql = require('mysql2');

const app = express();
app.use(express.json());

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'service',
    port: '4306'
})


connection.connect((err) => {
    if (err) {
        console.log("ERROR")
        return;
    }
    console.log("connect")
})

app.post("/create", async (req,res) =>{
    const { id,name,lastname,jobid} = req.body

    try {
        connection.query(
            "INSERT INTO empoyee(idEmpoyee,name,lastname,jobtitle_ID) VALUES(?,?,?,?)",
            [id,name,lastname,jobid],
            (err,result,fields) => {
                if (err) {
                    console.log ("ERROR");
                    return res.status(400).send();
                }
                return res.status(201).json({message:"Successfully"});
            }
         ) 
    }catch(err) {
        console.log(err);
        return res.status(500).send();
    }
})
// app.get("/read", async (req, res)=>{
//     try{
//         connection.query("SELECT * FROM empoyee", (err,result,fields)=>{
//             if (err) {
//                 console.log(err);
//                 return res.status(400).send();
//             }
//             return res.status(200).json(result);
//         } )
//     } catch(err) {
//         console.log(err);
//         return res.status(500).send();
//     }
// })
app.listen(5000, function () {
    console.log('connect')
  })