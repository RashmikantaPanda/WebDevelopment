import React, { useState, useEffect } from 'react';

import AddTaskForm from './components/AddTaskForm.jsx'
// import UpdateForm from './components/UpdateForm.jsx'
import ToDo from './components/ToDo.jsx'
import DeleteToDo from './components/DeleteToDo.jsx';

// import 'bootstrap/dist/css/bootstrap.min.css';
// import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
// import {
//     faSquareCheck, faPen, faTrashCan
// } from '@fortawesome/free-solid-svg-icons'

// // import '../App.css';


import './App.css';

function App() {
  const [toDo, setToDo] = useState([]);
  const [dataLoaded, setDataLoaded] = useState(false);
  const [taskCounter, setTaskCounter] = useState(1); // UID


  const [newTask, setNewTask] = useState('');
  const [updateData, setUpdateData] = useState('');

  const [viewMode, setViewMode] = useState("all");

  // useEffect(() => {
  //   const savedToDo = localStorage.getItem('toDo');
  //   if (savedToDo) {
  //     setToDo(JSON.parse(savedToDo));
  //   }
  // }, []);

  // // Save the to-do list to local storage whenever it changes
  // useEffect(() => {
  //   localStorage.setItem('toDo', JSON.stringify(toDo));
  // }, [toDo]);

  useEffect(() => {
    const savedToDo = localStorage.getItem('toDo');
    if (savedToDo) {
      setToDo(JSON.parse(savedToDo));
    }
    setDataLoaded(true); // Mark the data as loaded
  }, []);

  useEffect(() => {
    if (dataLoaded) {
      localStorage.setItem('toDo', JSON.stringify(toDo));
    }
  }, [toDo, dataLoaded]);

  //Add Task
  // const addTask = () => {
  //   if (newTask.trim() !== "") {
  //     let num = toDo.length + 1;
  //     let newEntry = { id: num, title: newTask, status: false }
  //     setToDo([...toDo, newEntry]);
  //     setNewTask('');
  //   }
  // }

  // Restrict the user to write white space
  // Add Task
  // const addTask = () => {
  //   if (newTask.trim() !== "") {
  //     let num = toDo.length + 1;
  //     let newEntry = { id: num, title: newTask.trim(), status: false };
  //     setToDo([...toDo, newEntry]);
  //     setNewTask('');
  //   }
  // };
  const addTask = () => {
    if (newTask.trim() !== '') {
      const newEntry = { id: taskCounter, title: newTask.trim(), status: false };
      setToDo([...toDo, newEntry]);
      setNewTask('');
      setTaskCounter(taskCounter + 1); // Increment the task counter
    }
  };


  //Delete Task
  const deleteTask = (id) => {
    let newTasks = toDo.filter(task => task.id !== id)
    setToDo(newTasks);
    setNewTask('');
  }





  //Delete All
  const deleteAll = () => {
    setToDo('');
  }

  //Delete Done
  const deleteDone = () => {
    const newTodos = toDo.filter((todo) => !todo.status);
    setToDo(newTodos);
  }

  //Mark Task Done
  const markDone = (id) => {
    let newTask = toDo.map(task => {
      if (task.id === id) {
        return ({ ...task, status: !task.status })
      }
      return task;
    })
    setToDo(newTask);
  }

  //Cancle Update
  const cancelUpdate = () => {
    setUpdateData('');
  }

  //Change Task for update
  const changeTask = (e) => {

    let newEntry = {
      id: updateData.id,
      title: e.target.value.trimStart().replace(/\s\s+/g, ' '),
      status: updateData.status ? true : false
    }

    setUpdateData(newEntry);

  }

  //Update Task
  // const updateTask = () => {
  //   let filterRecords = [...toDo].filter(task => task.id !== updateData.id);
  //   let updatedObjects = [...filterRecords, updateData];
  //   setToDo(updatedObjects);
  //   setUpdateData('');
  // }

  // Spcae not allowed at starting point
  const updateTask = () => {
    if (updateData.title.trim() !== '') {
      let filterRecords = [...toDo].filter(task => task.id !== updateData.id);
      let updatedObjects = [...filterRecords, { ...updateData, title: updateData.title.trim() }];
      setToDo(updatedObjects);
      setUpdateData('');
    }
  };



  const filterTodos = () => {
    switch (viewMode) {
      case "all":
        return toDo;
      case "completed":
        return toDo.filter((todo) => todo.status);
      case "notCompleted":
        return toDo.filter((todo) => !todo.status);
      default:
        return toDo;
    }
  };


  return (
    <div className="col-6 container App my-4 ">
      <br />
      {/* <h3>TODO LIST</h3> */}
      <br />


      {/* {updateData && updateData ? (
        <UpdateForm
          updateData={updateData}
          changeTask={changeTask}
          updateTask={updateTask}
          cancelUpdate={cancelUpdate}
        />
        // null
      ) : (
        <AddTaskForm
          newTask={newTask}
          setNewTask={setNewTask}
          addTask={addTask}
        />
        // null
      )} */}

      {/* Two Component are combined to One */}
      <AddTaskForm
        newTask={newTask}
        setNewTask={setNewTask}
        addTask={addTask}

        updateData={updateData}
        changeTask={changeTask}
        updateTask={updateTask}
        cancelUpdate={cancelUpdate}
      />


      {toDo && toDo.length ? (
        <div className=''>
          <div className='my-2'>
            <h5 className='mt-3 mb-3'>TODO LIST</h5>
            <div className='row'>
              <div className='col-4'> <button className='col-11 btn btn-info text-white mx-2' onClick={() => setViewMode("all")}><b>View All</b></button>
              </div>
              <div className='col-4'> <button className='col-11 btn btn-info text-white mx-2' onClick={() => setViewMode("completed")}><b>View Done</b></button>
              </div>
              <div className='col-4'> <button className='col-11 btn btn-info text-white mx-2' onClick={() => setViewMode("notCompleted")}><b>View ToDo</b></button>
              </div>
            </div>
          </div>
        </div>
      ) : (null)}


      {/* Display Todos */}
      {toDo && toDo.length ? (
        <
          ToDo
          toDo={toDo}
          markDone={markDone}
          setUpdateData={setUpdateData}
          deleteTask={deleteTask}
          filterTodos={filterTodos}
        />
      ) : 'No Todos'}
      <br />



      {toDo && toDo.length ? (

        <DeleteToDo
          toDo={toDo}
          deleteAll={deleteAll}
          deleteDone={deleteDone}

        />

      ) : ''}


    </div>
  );
}

export default App;

