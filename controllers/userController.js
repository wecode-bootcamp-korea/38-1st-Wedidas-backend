const userService = require('../services/userService');
const { catchAsync } = require('../utils/error');

const signUp = catchAsync(async (req, res) => {
  const { name, email, password, birthday, phoneNumber } = req.body;

  if ( !name || !email || !password || !birthday || !phoneNumber ) {
		const error = new Error('KEY_ERROR');
		error.statusCode = 400

		throw error;
	}

  const insertId = await userService.signUp(name, email, password, birthday, phoneNumber);

  res.status(201).json({ insertId });
});

module.exports = {
  signUp
}