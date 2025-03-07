// imports
const express = require("express");
const fs = require("fs");
const { v4: uuidv4 } = require("uuid");

const app = express();
app.use(express.json());

const BOOKS_FILE = "books.txt"; // store book data

// route to add a book
app.post("/add-book", (req, res) => {
    let { bookName, author, yearPublished } = req.body;

    if (!bookName || !author || !yearPublished) {
        return res.json({ success: false });
    }

    const isbn = uuidv4();

    const bookEntry = `${bookName},${isbn},${author},${yearPublished}\n`;
    fs.appendFileSync(BOOKS_FILE, bookEntry, "utf8");

    res.json({ success: true, isbn }); // return UUID
});

app.get("/find-by-isbn-author", (req, res) => {
    const { isbn, author } = req.query;

    if (!isbn || !author) {
        return res.json({ success: false });
    }

    try {   //read books.txt and filter non-empty lines
        const books = fs.readFileSync(BOOKS_FILE, "utf8").split("\n").filter(line => line.trim());
        const foundBooks = books.some(book => {
            const [, bookIsbn, bookAuthor] = book.split(",");
            return bookIsbn === isbn && bookAuthor === author;
        });

        res.json({ success: foundBooks });
    } catch (error) {
        res.json({ success: false });
    }
});


// route to find all books by a specific Author
app.get("/find-by-author", (req, res) => {
    const { author } = req.query;

    if (!author) {
        return res.json([]);
    }
    // ead books.txt and find books by the given author 
    const books = fs.readFileSync(BOOKS_FILE, "utf8").split("\n");
    const foundBooks = books.filter((book) => book.includes(author));

    res.json(foundBooks);
});

const PORT = 3001;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

