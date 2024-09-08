CREATE TABLE author (
                        id SERIAL PRIMARY KEY,
                        name VARCHAR(255) NOT NULL
);

CREATE TABLE book (
                      id SERIAL PRIMARY KEY,
                      title VARCHAR(255) NOT NULL,
                      author_id INT,
                      FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE SET NULL
);

CREATE TABLE book_authors (
                             book_id BIGINT NOT NULL,
                             author_id BIGINT NOT NULL,
                             PRIMARY KEY (book_id, author_id),
                             FOREIGN KEY (book_id) REFERENCES book(id),
                             FOREIGN KEY (author_id) REFERENCES author(id)
);