import express from "express"
import cors from "cors"
import {config} from "dotenv"
import Todo from "./models/todoModel.js"
import connectDB from "./configs/connectDB.js"

config()

const app = express()

app.use(cors())
app.use(express.json())

connectDB()


app.get("/", async(req, res) => {
    try{
        const todo = await Todo.find({})
        if(todo.length === 0){
            return res.status(200).json({message: "Todo is empty"})
        }
        return res.status(200).json(todo)
    }catch(error){
        console.error(error)
        return res.status(500).json({message: "server error"})
    }
})

app.post("/", async(req, res) => {
    try{
        const todo = await Todo.create(req.body)
        return res.status(200).json(todo)
    }catch(error){
        console.error(error)
        return res.status(500).json({message: "server error"})
    }
})

app.delete('/:id', async(req, res) => {
    try{
        const todo = await Todo.findByIdAndDelete(req.params.id)
        if(!todo){
            return res.status(404).json({message: "Todo not found"})
        }
        return res.status(200).json({message: "Todo deleted", id})
    }catch(error){
        console.error(error)
        return res.status(500).json({message: "server error"})
    }
})

app.patch("/:id", async(req,res) => {
    try{
        const todo = await Todo.findByIdAndUpdate({_id:req.params.id}, {status : req.body},{new: true, runValidators:true})
        if(!todo){
            return res.status(404).json({message: "Todo not found"})
        }
        return res.status(200).json({message: "Todo updated", todo})
    }catch(error){
        console.error(error)
        return res.status(500).json({message: "server error"})
    }
})


app.listen(process.env.PORT, () => console.log(`server is running on port ${process.env.PORT}`))