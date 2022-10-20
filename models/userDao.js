const appDataSource = require('./dataSource');

const createUser = async (name, email, password, birthday, phoneNumber) => {
  const result = await appDataSource.query(`
    INSERT INTO users (
      name,
      email,
      password,
      birthday,
      phone_number
    ) VALUES (?, ?, ?, ?, ?)`,
    [name, email, password, birthday, phoneNumber]
  );
  return result.insertId;
}

const getUserByEmail = async (email) => {
	const result = await dataSource.query(`
		SELECT 
			id,
			name,
			email,
			password,
			birthday,
			phone_number
		FROM users
		WHERE email=?`, [email]
	);

	return result[0];
}

module.exports = {
  createUser,
	getUserByEmail
}