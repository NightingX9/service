const express = require('express')
const app = express()
const ejs = require('ejs')
const flash = require('connect-flash')
const mysql = require('mysql2')
const expressSession = require('express-session')
const cors = require('cors')
const bodyParser = require('body-parser')
const jsonParser = bodyParser.json()
const bcrypt = require('bcrypt')
const saltRounds = 20
var jwt = require('jsonwebtoken')
const secret = 'Test-login'

const testcontrollers = require('./controllers/testcontrollers')
const logincontrollers = require('./controllers/logincontrollers')
const registercontrollers = require('./controllers/registercontrollers')
const { error } = require('jquery')

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'service',
    port: '4306'
})
app.use(cors())
app.use(express.static('public'))
app.use(express.json())
app.use(express.urlencoded())
app.use(flash())
app.set('view engine', 'ejs')

app.post('/register', jsonParser, function (req, res, next) {
    bcrypt.hash(req.body.password, saltRounds, function (err, hash) {
        connection.execute(
            'INSERT INTO empoyee (email, name, lastname, jobtitle_ID, password) VALUES (?, ?, ?, ?, ?)',
            [req.body.email, req.body.name, req.body.lastname, req.body.jobtitle_ID, hash],
            function (err, result, fields) {
                if (err) {
                    res.json({ status: 'error', message: err })
                    console.log("ERROR");
                    return res.status(400).send();
                }
                console.log("success")
                return res.status(201).json({ message: "Successfully" });

            }
        )
    })
});

app.post('/login', jsonParser, function (req, res, next) {
    connection.execute(
        'SELECT * FROM empoyee WHERE email=?',
        [req.body.email],
        function (err, empoyee, fields) {
            if (err) { res.json({status: 'error', message: err}); return }
            if (empoyee.length == 0) { res.json({ status: 'error', message: 'on user found' }); return }
            bcrypt.compare(req.body.password, empoyee[0].hash, function(err, islogin) {
                if (islogin) {
                    res.json({status: 'ok', message: 'login success'})
                } else {
                    res.json({status: 'lol', message: 'login failed'})
                }
            });


        }
    )
})


app.get('/', testcontrollers)
app.get('/login', logincontrollers)
app.get('/register', registercontrollers)

app.listen(4000, () => {
    console.log("port4000")
})