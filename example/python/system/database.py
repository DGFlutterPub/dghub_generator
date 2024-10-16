from  pymongo import MongoClient
from config import global_config

def get():
   db = MongoClient('mongodb://localhost:27017/'+global_config.DB_NAME)
   return db[global_config.DB_NAME]