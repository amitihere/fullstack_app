const express = require('express')
const app = express()
const cors = require('cors')
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
const PORT = process.env.PORT

app.use(cors())
app.use(express.json())

app.post('/',async (req,res)=>{
    const {title,author,summary,ISBN,genre} = req.body

    const users = await prisma.books.create({
        data: {
            title: title,
            author: author,
            summary:summary,
            ISBN:ISBN,
            genre:genre
        }
    })
    console.log(genre)

    return res.status(200).json(users)
})


app.listen(PORT,()=>{
    console.log("Server is lisening")
})