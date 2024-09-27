import mongoose from "mongoose";
import mongooseSequence from "mongoose-sequence";

const schema = mongoose.Schema(
  {
    _id: mongoose.Schema.Types.ObjectId,
  
    name: {type: String,
      default: 'mg',
      required: false,
      trim: true
      }
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


schema.plugin(mongooseSequence(mongoose),{inc_field: 'autoIncrement'});
export default mongoose.model("Auth", schema);
