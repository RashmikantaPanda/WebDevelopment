import React, { useState, useEffect } from 'react';

import axios from 'axios';
import '../App.css';
import PhotosCard from './PhotosCard';
import AlbumSearchBar from './AlbumSearchBar';


const PhotosList = ({ id }) => {
    const [photo, setPhoto] = useState([]);
    const [filteredPhotos, setFilteredPhotos] = useState([]);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await axios.get(`https://jsonplaceholder.typicode.com/photos?albumId=${id}`);
                // https://jsonplaceholder.typicode.com/photos?albumId=1
                setPhoto(response.data);
                setFilteredPhotos(response.data);
            } catch (error) {
                console.log(error);
            }
        };

        fetchData();
    }, [id]);

    const deletePhoto = async (photoId) => {
        try {
            // Delete the photo from the API
            await axios.delete(`https://jsonplaceholder.typicode.com/photos/${photoId}`);
            // Remove the deleted photo from the local state
            setPhoto((prevPhotos) => prevPhotos.filter((photo) => photo.id !== photoId));
            setFilteredPhotos((prevPhotos) => prevPhotos.filter((photo) => photo.id !== photoId));
        } catch (error) {
            console.log(error);
        }
    };

    return (
        <div className='user-album'>
            <AlbumSearchBar albums={photo} setFilteredAlbums={setFilteredPhotos} />
            <div className="container mt-5">
                <div class="row">
                    {filteredPhotos.map((photo) => (
                        <PhotosCard key={photo.id} photo={photo} onDelete={deletePhoto} />
                    ))}
                </div>
            </div>
        </div>
    );
};

export default PhotosList;