const express = require('express')
const router = express.Router()
const {validateBook, validateGenre} = require('../middlewares/booksValidate')
const {createBookIfNotExists, createGenre,findGenre} = require('../controllers/booksControllers')

router.post('/book/create',validateBook,createBookIfNotExists)

router.post('/genre/create', validateGenre,createGenre)
router.get('/genre/find',validateGenre,findGenre)
// router.update('/genre/update/:id',validateGenre,updateGenre)

module.exports = router