const userService = require('../services/userService')

const signIn = async (req, res) => {
  const { email, password } = req.body

  try {
    const accessToken = await userService.signIn(email, password);
    res.status(200).json({ accessToken });
  } catch (error) {
    res.status(error.statusCode).json({ message: error.message });
  }
}

module.exports = {
  signIn
}