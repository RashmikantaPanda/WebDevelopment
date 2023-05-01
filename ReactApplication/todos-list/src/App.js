import './App.css';
import Header from './MyComponents/Header'
import { Todos } from "./MyComponents/Todos";
import { Footer } from './MyComponents/Footer'
import { AddTodo } from './MyComponents/AddTodo';
import React, { useState } from 'react';

function App() {
  const onDelete = (todo) => {
    console.log("I am onDelete");
    setTodos(todos.filter((e) => {
      return e!==todo;
    }));
  }

  const addTodo = (title, desc) => {
    console.log("I am adding this todo", title, desc);
    let sno = todos[todos.length - 1].sno+1;
    const myTodo = {
      sno: sno,
      title: title,
      desc: desc,
    }
    setTodos([...todos, myTodo]);
    console.log(myTodo);
  }

  const [todos, setTodos] = useState([
    {
      sno: 1,
      title: "Go to the market",
      desc: "You have to go to the market to get this job done"
    },
    {
      sno: 2,
      title: "Go to the college",
      desc: "You have to go to the market to get this job2 done"
    },
    {
      sno: 3,
      title: "Go to the Office",
      desc: "You have to go to the market to get this job3 done"
    },
  ]);
  return (
    <>
      <Header title="My Todos List" searchBar={false} />
      <AddTodo addTodo={addTodo} />
      <Todos todos={todos} onDelete={onDelete} />
      <Footer />
    </>
  );
}

export default App;
