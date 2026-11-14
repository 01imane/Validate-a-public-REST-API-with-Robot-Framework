from fastapi import FastAPI, HTTPException

app=FastAPI()

books = [ 
{"book_id":"Romance", "status": "vailable" },
{"book_id":"action", "status": "vailable" },  
{"book_id":"Romance", "status": "unvailable" } 
]

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
    