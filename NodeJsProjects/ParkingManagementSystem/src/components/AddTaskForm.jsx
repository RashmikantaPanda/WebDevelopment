import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import '../App.css';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBarsProgress } from '@fortawesome/free-solid-svg-icons';

const AddTaskForm = ({ newTask, setNewTask, addTask, updateData, changeTask, updateTask, cancelUpdate }) => {
    const handleButtonClick = () => {
        if (updateData) {
            updateTask();
        } else {
            addTask();
        }
    };

    return (
        <>
            {/* Add Task */}
            <div className='inputTodo  fs-2 py-1'>
                <h5>TODO INPUT</h5>
                <div className='input-group'>
                    <span className='input-group-text mb-2'>
                        <FontAwesomeIcon icon={faBarsProgress} />
                    </span>

                    <input
                        type='text'
                        className='form-control fs-5'
                        value={updateData ? updateData.title : newTask}
                        placeholder={updateData ? '' : 'Add New Task'}
                        onChange={updateData ? changeTask : (e) => setNewTask(e.target.value.trimStart().replace(/\s\s+/g, ' '))}
                        style={{ borderColor: 'rgba(224, 221, 221, 0.9)' }}
                    />
                </div>

                {updateData ? (
                    <>

                        <div className='row updateButtons '>
                            <div className='col-6' >
                                <button className='btn btn-info text-white col-11 ' onClick={handleButtonClick}>
                                    <b>UPDATE</b>
                                </button> </div>
                            <div className='col-6' >
                                <button className='btn btn-danger col-11' onClick={cancelUpdate}>
                                    <b>CANCEL</b>
                                </button> </div>
                        </div>

                    </>
                ) : (
                    <>
                        <div className='col-12'>
                            <button type='button' className='col-12 btn btn-info text-white addTask' onClick={handleButtonClick}>
                                <b>ADD NEW TASK</b>
                            </button>
                        </div>
                    </>
                )}

            </div>

        </>
    );
};

export default AddTaskForm;




// import React from 'react';
// import 'bootstrap/dist/css/bootstrap.min.css';
// import '../App.css';

// const AddTaskForm = ({ newTask, setNewTask, addTask, updateData, changeTask, updateTask, cancelUpdate }) => {
//   const handleButtonClick = () => {
//     if (updateData) {
//       updateTask();
//     } else {
//       addTask();
//     }
//   };

//   return (
//     <>
//       {/* Add Task */}
//       <div className='inputTodo border fs-2 py-2'>
//         <h5>INPUT TODO</h5>
//         <div className=''>
//           <input
//             type='text'
//             className='form-control fs-5 form-control-lg'
//             value={updateData ? updateData.title : newTask}
//             onChange={updateData ? changeTask : (e) => setNewTask(e.target.value)}
//           />
//         </div>
//         <div className=''>
//           <button className='btn btn-info form-control' onClick={handleButtonClick}>
//             {updateData ? 'Update Task' : 'Add New Task'}
//           </button>
//         </div>
//       </div>
//       <br />
//     </>
//   );
// };

// export default AddTaskForm;





// import 'bootstrap/dist/css/bootstrap.min.css';
// import '../App.css';
// // import React, { useState } from 'react';

// const AddTaskForm = ({ newTask, setNewTask, addTask, updateData, changeTask, updateTask, cancelUpdate }) => {


//     return (

//         <>
//             {/* Add Task */}

//             <div className='inputTodo border fs-2 py-2'>
//                 <h5>INPUT TODO</h5>
//                 <div className=''>
//                     <input
//                         // { updateData && updateData ?(
//                         //     value={updateData && updateData.title}
//                         //     onChange={(e) => changeTask(e)}
//                         //     type='text' className='form-control fs-5 form-control-lg'

//                         // ):(
//                         //     type='text'
//                         //     className='form-control  input-lg'
//                         //     value={newTask}
//                         //     onChange={(e) => setNewTask(e.target.value)}
//                         // )}

//                         type='text'
//                         className='form-control fs-5 form-control-lg'
//                         value={updateData ? updateData.title : newTask}
//                         // onChange={(e)=>={updateData ?updateTask(e): changeTask(e)}
//                         onChange={updateData ? updateTask : changeTask}

//                     // type='text'
//                     // className='form-control  input-lg'
//                     // value={newTask}
//                     // onChange={(e) => setNewTask(e.target.value)}

//                     />
//                 </div>
//                 <div className=''>
//                     <button
//                         className='btn btn-info form-control '
//                         onClick={addTask}
//                     >Add New Task</button>
//                     <button
//                         className='btn btn-info form-control '
//                         onClick={updateTask}
//                     >Update Task</button>
//                 </div>
//             </div>
//             <br />
//         </>
//     )

// }
// export default AddTaskForm;