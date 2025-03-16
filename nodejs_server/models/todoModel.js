import {model, Schema} from "mongoose"

const todoSchema = new Schema({
    title:{
        type:String,
        required:true
    },
    description:{
        type:String,
        required:true
    },
    isCompleted:{
        type:Boolean,
        default:false
    }
},{ timestamps: true })

const Todo = model("todo",todoSchema)

export default Todo