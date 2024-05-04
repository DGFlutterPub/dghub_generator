import mongoose from "mongoose";

const schema = mongoose.Schema(
  {
    _id: mongoose.Schema.Types.ObjectId,
  
    name: {type: String,
      default: 'mg',
      required: false,
      trim: true
      },
   
   
  },
  {
    timestamps: { createdAt: true, updatedAt: false },
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

export default mongoose.model("Auth", schema);
