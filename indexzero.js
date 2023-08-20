const http = require('http')

const server = http.createServer((req,res)=>{
    const pathName = req.url
    console.log("url = ",pathName)
    if(pathName==="/"|| pathName==="home"){
        res.end("<h1>Night</h1>")
    }else if (pathName==="/product"){
    res.end("<h1>Nightkan</h1>")
}})
server.listen(8080,'localhost',()=>{
    console.log("start")
})