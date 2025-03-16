import express from "express"
import cors from "cors"
import {config} from "dotenv"
import Todo from "./models/todoModel.js"

config()

const app = express()

app.use(cors())
app.use(express.json())

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