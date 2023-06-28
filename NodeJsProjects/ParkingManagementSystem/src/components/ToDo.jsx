import 'bootstrap/dist/css/bootstrap.min.css';
import React from 'react';



import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import {
    faPen, faTrashCan
} from '@fortawesome/free-solid-svg-icons'

import '../App.css';


const ToDo = ({ toDo, markDone, setUpdateData, deleteTask, filterTodos }) => {
    return (
        <>

            {
                toDo && filterTodos()
                    .sort((a, b) => a.id > b.id ? 1 : -1)
                    .map((task, id) => {
                        return (
                            <React.Fragment key={task.id}>
                                <div className=''>
                                    <div className='row'>
                                        <div className='col-12'>
                                            <div className='mx-2 taskBg'>
                                                <div className={task.status ? 'done' : ''}>

                                                    {/* <span className='taskNumber'>{index + 1}</span> */}
                                                    <span className='taskText'>{task.title.trim()}</span>
                                                </div>
                                                <div className='iconsWrap'>
                                                    <input type='checkbox' checked={task.status}
                                                        title='Completed or Not'
                                                        onClick={(e) => markDone(task.id)}
                                                        className='form-check-input fs-5'
                                                    >
                                                        {/* <FontAwesomeIcon icon={faSquareCheck} /> */}
                                                    </ input>

                                                    {task.status ? null : (
                                                        <span title='Edit'
                                                            onClick={(e) => setUpdateData({
                                                                id: task.id,
                                                                title: task.title,
                                                                status: task.status ? true : false
                                                            })}


                                                        >
                                                            <FontAwesomeIcon icon={faPen} />
                                                        </span>
                                                    )}


                                                    <span title='Delete'
                                                        onClick={() => deleteTask(task.id)}
                                                    >
                                                        <FontAwesomeIcon icon={faTrashCan} />

                                                    </span>

                                                </div>



                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </React.Fragment>

                        )
                    })
            }
        </>


    )

}


export default ToDo;
