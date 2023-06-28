import 'bootstrap/dist/css/bootstrap.min.css';



const UpdateForm = ({ updateData, changeTask, updateTask, cancelUpdate }) => {
    return(

    <>
        {/* Update Task*/}
        <div className='inputTodo'>
            <div className=''>
                <input
                    value={updateData && updateData.title}
                    onChange={(e) => changeTask(e)}
                    type='text' className='form-control fs-5 form-control-lg' />
            </div>
            <div className='updateButtons col-12'>
                <div className='col-5' >
                <button
                    onClick={updateTask}
                    className='btn btn-success  me-2'
                >Update</button> </div>
                <div className='col-5' >
                <button className='btn btn-danger '
                    onClick={cancelUpdate}
                >Cancel</button>  </div>
            </div>

        </div>
        <br />

    </>
    )

}

export default UpdateForm;

