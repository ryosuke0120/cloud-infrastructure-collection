# main.py
from fastapi import FastAPI

app = FastAPI()

# Define a route for the root URL
@app.get("/")
def read_root():
    return {"Hello": "World"}
