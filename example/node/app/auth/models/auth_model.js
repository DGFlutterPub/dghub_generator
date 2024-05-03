import mongoose from "mongoose";

const schema = mongoose.Schema(
  {
    _id: mongoose.Schema.Types.ObjectId,
    location: {
        type: {
          type: String,
          enum: ["Point"],
        },
        coordinates: [Number],
      },
  },
  {
    timestamps: true,
    versionKey: false,
    toJSON: {
      transform(doc, ret) {
        ret.id = ret._id;
        delete ret._id;
        /////
        delete ret.password;
        delete ret.identifier;
      },
    },
    toObject: {
      transform(doc, ret) {
        ret.id = ret._id;
        delete ret._id, 
        /////////
        delete ret.password; delete ret.identifier;
      },
    },
  }
);

schema.index({ location: "2dsphere" });
export default mongoose.model("Auth", schema);
