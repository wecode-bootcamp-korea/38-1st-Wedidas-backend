const dataSource = require('./dataSource')

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

const getUserById = async (id) => {
	const result = await dataSource.query(`
		SELECT 
			id,
			name,
			email,
			birthday,
			phone_number
		FROM users
		WHERE id=?`, [id]
	);

	return result[0];
}

module.exports = { 
	getUserByEmail,
	getUserById
}
