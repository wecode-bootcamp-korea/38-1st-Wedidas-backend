-- migrate:up
CREATE TABLE reviews (
  id INT NOT NULL AUTO_INCREMENT,
  commets VARCHAR(100) NULL,
  ratings FLOAT NULL,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (product_id) REFERENCES products (id)
);

-- migrate:down
DROP TABLE reviews;