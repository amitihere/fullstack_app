const {PrismaClient} = require('@prisma/client')
const prisma = new PrismaClient()
const createBookIfNotExists = async (req,res) => {
    const {completeData} = req.body
    const book = await prisma.books.create({
        data: {
            title:completeData.title,
            summary:completeData.summary,
            isbn:completeData.isbn,
            authorId:author,
            genre:genre
        }
    })
    if (!book) return res.status(404).json({message: "Some error has occured"})
    return res.status(200).json({meesage: book})

}

const createGenre = async (req,res) => {
    const {name} = req.body
    const alreadyGenre = await prisma.genre.findFirst({
        where: {
            name:name
        }
    })
    if(alreadyGenre) return res.status(404).json({message:"Genre already exists"})
    
    const createGenre = await prisma.genre.create({
        data: {
            name:name,
        }
    })
    return res.status(201).json({message:"created successfully",createGenre})
}

const findGenre = async (req,res) => {
    const {name} = req.body
    const getDetails = await prisma.genre.findFirst({
        where: {
            name:name
        }
    })
    if(!getDetails) return res.status(404).json({message:"Genre Does not exists"})
    return res.status(200).json({message:"Succesfully completed the et operation",data : getDetails})
}
module.exports = {createBookIfNotExists,createGenre,findGenre}