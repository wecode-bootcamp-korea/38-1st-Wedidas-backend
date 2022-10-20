<<<<<<< HEAD
const express = require('express');
=======
const express = require('express')
>>>>>>> main
const router = express.Router();

const userRouter = require('./userRouter');

router.use('/users', userRouter);

module.exports = router;
