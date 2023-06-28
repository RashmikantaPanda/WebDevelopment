import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../App.css';
import AlbumCard from './AlbumCard';
import AlbumSearchBar from './AlbumSearchBar';

const AlbumTitle = ({ id }) => {
    const [album, setAlbum] = useState([]);
    const [filteredAlbums, setFilteredAlbums] = useState([]);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await axios.get(`https://jsonplaceholder.typicode.com/albums?userId=${id}`);
                setAlbum(response.data);
                setFilteredAlbums(response.data);
            } catch (error) {
                console.log(error);
            }
        };
        fetchData();
    }, [id]);


    const deleteAlbum = async (albumId) => {
        try {
            // Delete the user data from the API
            await axios.delete(`https://jsonplaceholder.typicode.com/albums/${albumId}`);
            // Remove the deleted user from the local state
            setAlbum((prevAlbums) => prevAlbums.filter((album) => album.id !== albumId));
            setFilteredAlbums((prevAlbums) => prevAlbums.filter((album) => album.id !== albumId));

        } catch (error) {
            console.log(error);
        }
    };

    return (
        <div className='user-album'>
            <div className='justify-content-end'>
                <AlbumSearchBar albums={album} setFilteredAlbums={setFilteredAlbums} />
            </div>
            <div className='container mt-3'>
                <div class="row">
                    {filteredAlbums.map((album) => (
                        <AlbumCard key={album.id} album={album} onDelete={deleteAlbum} />
                    ))}
                </div>
               
            </div>
        </div>
    );
};

export default AlbumTitle;


