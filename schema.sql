CREATE TABLE Items (
    id INT GENERATED ALWAYS AS IDENTITY
    published_date DATE,
    archived BOOLEAN
    PRIMARY KEY(id)
);

CREATE TABLE Authors (
    id INT GENERATED ALWAYS AS IDENTITY
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES items(id)
    PRIMARY KEY(id)
);

CREATE TABLE Genres (
    id INT GENERATED ALWAYS AS IDENTITY
    name VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES items(id)
    PRIMARY KEY(id)
);

CREATE TABLE Labels ( 
    id INT GENERATED ALWAYS AS IDENTITY
    title VARCHAR(255),
    color VARCHAR(255),
    published_date DATE,
    item_id INT,
    items text[],
    FOREIGN KEY (item_id) REFERENCES items(id)
    PRIMARY KEY(id)
);

CREATE TABLE Books (
    id INT GENERATED ALWAYS AS IDENTITY
    item_id INT,
    title VARCHAR(255),
    author_id INT,
    label_id Int,
    cover_state VARCHAR(255),
    publisher VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (label_id) REFERENCES labels(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
    PRIMARY KEY(id)
);
CREATE TABLE Games (
    id INT GENERATED ALWAYS AS IDENTITY
    item_id INT,
    multiplayer BOOLEAN,
    last_played_at DATE,
    published_date DATE,
    author_id INT,
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (label_id) REFERENCES labels(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
    PRIMARY KEY(id)
);

CREATE TABLE Albums (
    id INT GENERATED ALWAYS AS IDENTITY
    item_id INT,
    genre_id INT,
    title VARCHAR(255),
    on_spotify BOOLEAN,
    published_date DATE,
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (label_id) REFERENCES labels(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
    PRIMARY KEY(id)
);