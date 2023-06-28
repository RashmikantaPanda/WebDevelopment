
import React from 'react';
import '../App.css';
import 'bootstrap/dist/css/bootstrap.min.css';

const PhotoCard = ({ photo, onDelete }) => {

    return (
        <div className="col-lg-3 col-md-6 col-sm-12">
            <div className="card text-center bg-light album-card my-3">
                <img src={`${photo.url}`} class="card-img-top" alt="..."></img>
                <div className="card-body d-flex flex-column album-card-body">
                    <h6 className="card-title">{photo.title}</h6>
                </div>
                <div>
                    <div className='mt-auto'>
                        <button className='ms-2 album-action-button bg-danger text-white' onClick={() => onDelete(photo.id)}>Delete</button>
                    </div>
                </div>
            </div>
        </div>

    );
};

export default PhotoCard;


