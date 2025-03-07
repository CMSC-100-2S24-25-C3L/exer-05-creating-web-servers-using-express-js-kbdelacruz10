const needle = require("needle");

// add a book
needle.post("http://localhost:3001/add-book", {
    bookName: "Harry Potter",
    author: "J.K Rowling",
    yearPublished: "1997"
}, { json: true }, (err, res) => {
    if (!err) {
        const uuidIsbn = res.body.isbn; // get UUID

        console.log("✅ Added Book:", res.body);

        // find by UUID & Author
        needle.get(`http://localhost:3001/find-by-isbn-author?isbn=${uuidIsbn}&author=J.K+Rowling`,(err, res) => console.log(res.body));
        
    }
});
