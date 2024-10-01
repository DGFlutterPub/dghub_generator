import mongoose from "mongoose";const schema = mongoose.Schema({
  _id: mongoose.Schema.Types.ObjectId,
  deletedAt: { type: Date, default: null },
  email: {
    type: String,
    required: false,
    lowercase: true,
    index: {
      unique: true,
      partialFilterExpression: { email: { $type: "string" } },
    },
    default: null,
  },
  token: {
    autopopulate: true,
    type: String, 
    ref: 'AuthToken',
    default: null, 
    required: false, 
    trim: true
  },
})
  ;export default mongoose.model("Auth", schema);