import mongoose from "mongoose";

const schema = mongoose.Schema({
  _id: mongoose.Schema.Types.ObjectId,
  deletedAt: { type: Date, default: null },
  title: {
    type: String,
    required: false,
    lowercase: true,
    default: null,
  }
});

export default mongoose.model("Product", schema);