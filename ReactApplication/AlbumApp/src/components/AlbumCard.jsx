
import React from 'react';
import '../App.css';
import 'bootstrap/dist/css/bootstrap.min.css';

const { useNavigate } = require("react-router-dom");

const AlbumCard = ({ album, onDelete }) => {
    
    const navigate = useNavigate();

    const handlePhotos = async (albumId) => {
        navigate(`/photos/${albumId}`);
    };

    return (

        <div className="col-lg-3 col-md-6 col-sm-12">
            <div className="card text-center bg-light album-card my-2">
                <div className="card-body d-flex flex-column album-card-body">
                    <h6 className="card-title">{album.title}</h6>
                </div>
                <div className=''>
                    <div className='d-flex justify-content-center '>
                        <button className='album-action-button bg-warning text-white' onClick={() => handlePhotos(album.id)}>
                            Photo
                        </button>
                        <button className='ms-2 album-action-button bg-danger text-white' onClick={() => onDelete(album.id)}>Delete</button>
                    </div>

                </div>
            </div>
        </div>
    );
};

export default AlbumCard;


