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

module.exports = {
  createUser,
}