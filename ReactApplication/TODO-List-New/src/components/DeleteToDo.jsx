import 'bootstrap/dist/css/bootstrap.min.css';
import React from 'react';



const DeleteToDo = ({toDo,deleteAll,deleteDone}) => {
    return (
        <>
            {

                <React.Fragment >
                    <div className='row  deleteAllBtn'>
                        <div className='col-6'>
                            <button
                                className='btn btn-danger col-11'
                            onClick={deleteAll}
                            >Delete All</button>
                        </div>
                        <div className='col-6'>
                            <button
                                className='btn btn-danger col-11'
                            onClick={deleteDone}
                            >Delete Done</button>
                        </div>
                    </div>


                </React.Fragment>


            }
        </>


    )

}


export default DeleteToDo;
