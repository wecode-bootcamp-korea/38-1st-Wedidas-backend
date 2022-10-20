const passwordRegex = (password) => {
  const PASSWORDREGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
	
  if (!PASSWORDREGEX.test(password)) {
    const error = new Error('INVALID_PASSWORD');
    error.statusCode = 400;
    throw error;
  }
}

module.exports = passwordRegex;