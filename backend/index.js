const express = require('express')
const app = express()
require('dotenv').config()
const cors = require('cors')
const PORT = process.env.PORT

app.use(cors())
app.use(express.json())

const catalogRoutes = require('./routes/catalog')
app.use('/',catalogRoutes)


app.listen(PORT,()=>{
    console.log(`Server is lisening on ${PORT}`)
})