const bcrypt = require('bcrypt');

const userDao = require('../models/userDao');

const hashPassword = async (plaintextPassword) => {
  const saltRounds = 10; 
  const salt = await bcrypt.genSalt(saltRounds);

  return await bcrypt.hash(plaintextPassword, salt);
}

const signUp = async (name, email, password, birthday, phoneNumber) => {
  const EMAILREGEX    =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
  const PASSWORDREGEX =/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
	
  if ( !name || !email || !password || !birthday || !phoneNumber ) {
    const error = new Error('KEY_ERROR');
    error.statusCode = 400;
    throw error;
  }
	
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

module.exports = { 
  signUp, 
}