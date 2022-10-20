const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const userDao = require('../models/userDao');

const hashPassword = async (plaintextPassword) => {
  const saltRounds = 10; 
  const salt = await bcrypt.genSalt(saltRounds);

  return await bcrypt.hash(plaintextPassword, salt);
}

const signUp = async (name, email, password, birthday, phoneNumber) => {
  const EMAILREGEX    =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
  const PASSWORDREGEX =/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
	
  if (!EMAILREGEX.test(email)) {
    const error = new Error('INVALID_EMAIL');
    error.statusCode = 400;
    throw error;
  }

  if (!PASSWORDREGEX.test(password)) {
    const error = new Error('INVALID_PASSWORD');
    error.statusCode = 400;
    throw error;
  }

  const hashedPassword = await hashPassword(password);

  return await userDao.createUser(name, email, hashedPassword, birthday, phoneNumber);
}

const signIn = async (email, password) => {
  const EMAILREGEX    =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/
  const PASSWORDREGEX =/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/
		
  if (!EMAILREGEX.test(email)) {
    const error = new Error('INVALID_EMAIL');
    error.statusCode = 400;
    throw error;
  }

  if (!PASSWORDREGEX.test(password)) {
    const error = new Error('INVALID_PASSWORD');
    error.statusCode = 400;
    throw error;
  }

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