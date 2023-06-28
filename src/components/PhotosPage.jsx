import React from 'react'
import { useNavigate, useParams } from 'react-router-dom';
import PhotosList from './PhotoList';


function PhotosPage() {
    const navigate=useNavigate();
    const { albumId } = useParams();
    return (
        <div className="container col-10">
         <span></span><button onClick={()=>navigate(-1)} className='btn btn-primary my-2'>Back</button>
            <div>
                {albumId && <PhotosList key={albumId.id} id={albumId} />}
            </div>
        </div>
    )
}

export default PhotosPage