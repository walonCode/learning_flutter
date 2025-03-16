import mongoose from "mongoose";

export default async function connectDB(){
    console.log("MongoDB connection with retry");
    try{
        await mongoose.connect(process.env.DATABASE_URI,{})
        console.log("MongoDB connected")
    }catch(error){
        console.error(error)
        setTimeout(()=>{
            connectDB()
        },5000)
    }
}