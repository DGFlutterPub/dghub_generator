import mongoose from "mongoose";
const schema = mongoose.Schema({
  _id: mongoose.Schema.Types.ObjectId,
  deletedAt: { type: Date, default: null },
  email: {
    type: String,
    required: false,
    default: "example@gmail.com",
  },
  token: {
    type: String,
    required: true,
    default: "null",
  },
});
export default mongoose.model("Auth", schema);
