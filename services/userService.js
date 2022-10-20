const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const userDao = require('../models/userDao');
const emailRegex = require('../utils/emailRegex');
const passwordRegex = require('../utils/passwordRegex');

const hashPassword = async (plaintextPassword) => {
  const saltRounds = 10; 
  const salt = await bcrypt.genSalt(saltRounds);

  return await bcrypt.hash(plaintextPassword, salt);
}

const signUp = async (name, email, password, birthday, phoneNumber) => {
  emailRegex(email);
  passwordRegex(password);

  const hashedPassword = await hashPassword(password);

  return await userDao.createUser(name, email, hashedPassword, birthday, phoneNumber);
}

const signIn = async (email, password) => {
  emailRegex(email);
  passwordRegex(password);

  const user = await userDao.getUserByEmail(email);

  const match = await bcrypt.compare(password, user.password);

  if (!match) {
    const error = new Error('WRONG_PASSWORD');
    error.statusCode = 400;
    throw error;
  }

  const accessToken = jwt.sign({ id: user.id }, process.env.JWT_SECRET, 
    { 
      algorithm: process.env.ALGORITHM, 
      expiresIn: process.env.JWT_EXPIRES_IN 
    }
  );

  return accessToken;

}

module.exports = {  
  signUp,
  signIn
}