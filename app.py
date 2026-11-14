from fastapi import FastAPI, HTTPException
from pydantic import BaseModel


app=FastAPI()

books = [ 
{"book_id":"Romance", "status": "vailable" },
{"book_id":"Action", "status": "vailable" },  
{"book_id":"Horror", "status": "unvailable" } 
]

class BookCreate(BaseModel):
    book_id: str
    status: str

@app.get("/books")
async def get_books():
    return books

@app.get("/books/{book_id}")
async def get_book(book_id: str):
 for book in books:
  if book["book_id"]== book_id:
   return book
 raise HTTPException (
   status_code=404,
   detail="book not found"
 )

@app.post("/books", status_code=201)
async def create_book(book: BookCreate):
    new_book = {"book_id": book.book_id, "status": book.status}
    books.append(new_book)
    return new_book   