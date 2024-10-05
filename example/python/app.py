from flask import Flask
from routes import api_routes
from system import database


app = Flask(__name__)
db = database.get()

print(db.products.count_documents({}))

api_routes.get(app)


if __name__ == "__main__":
        
        app.run()