const express = require('express')
const app = express()

const validateBook = (req,res,next) => {
    const {title,summary,isbn} = req.body
    if (!title || typeof(title)!= "string" || !summary || typeof(summary)!= "string" || isbn.length.trim()===0){
        return res.status(404).json({message:"Invalid or Insufficient Data"})
    }
    next()

}
const validateGenre = (req,res,next)=>{
    const {name} = req.body
    if(!name || typeof(name) != "string"){
        return res.status(404).json({message:"Invalid data of the genre"})
    }
    next()
}
module.exports = {validateBook,validateGenre}