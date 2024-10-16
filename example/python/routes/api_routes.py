def get(app):
   @app.route("/")
   def home():
         return "Hello"
    