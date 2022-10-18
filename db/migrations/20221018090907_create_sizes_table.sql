-- migrate:up
CREATE TABLE sizes (
  id INT NOT NULL AUTO_INCREMENT,
  foot_size INT NOT NULL,
  PRIMARY KEY (id)
);

-- migrate:down
DROP TABLE sizes;