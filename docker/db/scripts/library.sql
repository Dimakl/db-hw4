CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS library.publisher (
    id VARCHAR(100) PRIMARY KEY,
    adress TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS library.book (
    isbn VARCHAR(100) PRIMARY KEY,
    year_of_publication INTEGER NOT NULL,
    book_name TEXT NOT NULL,
    author TEXT NOT NULL,
    page_count INTEGER NOT NULL,
    publisher_id VARCHAR(100) NOT NULL REFERENCES library.publisher(id)
);

CREATE TABLE IF NOT EXISTS library.book_copy (
    id VARCHAR(100) PRIMARY KEY,
    copy_number INTEGER NOT NULL,
    shelf_location INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS library.category (
    id VARCHAR(100) PRIMARY KEY,
    category_name TEXT NOT NULL,
    parent_category_id VARCHAR(100) REFERENCES library.category(id)
);

CREATE TABLE library.book_category (
    book_isbn VARCHAR(100) REFERENCES library.book(isbn),
    category_id VARCHAR(100) REFERENCES library.category(id),
    PRIMARY KEY(book_isbn, category_id)
);

CREATE TABLE IF NOT EXISTS library.reader (
    id VARCHAR(100) PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    adress TEXT NOT NULL,
    birthdate_timestamp INT NOT NULL
);

CREATE TABLE IF NOT EXISTS library.taken_book_application (
    id VARCHAR(100) PRIMARY KEY,
    book_isbn VARCHAR(100) NOT NULL REFERENCES library.book(isbn),
    copy_id VARCHAR(100) NOT NULL REFERENCES library.book_copy(id),
    reader_id VARCHAR(100) NOT NULL REFERENCES library.reader(id),
    return_date INT NOT NULL,
    is_returned BOOLEAN DEFAULT FALSE
);