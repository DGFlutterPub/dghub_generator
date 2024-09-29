import mongoose from "mongoose";
import populate from "mongoose-autopopulate";
//import mongooseSequence from "mongoose-sequence";

const schema = mongoose.Schema(
  {
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
          type: String, ref: 'AuthToken'
        , default: null, required: false, trim: true
      },
   
  },
  {
    timestamps:  { createdAt: true, updatedAt: false },
    versionKey: false,
    toJSON: {
      transform(doc, ret) {
        ret.id = ret._id;
        delete ret._id;
      },
    },
    toObject: {
      transform(doc, ret) {
        ret.id = ret._id;
        delete ret._id;
      },
    },
  }
);

//schema.index({ location: "2dsphere" });
//schema.plugin(mongooseSequence(mongoose),{inc_field: 'no'});
export default mongoose.model("Auth", schema);
