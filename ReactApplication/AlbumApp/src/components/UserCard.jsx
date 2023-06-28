import React from 'react';
import '../App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
const { Link } = require("react-router-dom");

const UserCard = ({ user, onDelete }) => {

    const uid = localStorage.getItem('id');

    const truncatedName = user.name.length > 15? `${user.name.substring(0, 15)}...` : user.name;
    const truncatedEmail = user.email.length > 18 ? `${user.email.substring(0, 18)}...` : user.email;

    return (
        <div className="col-lg-3 col-md-6 col-sm-12">
        <div className="card text-center bg-light my-2">
            <div className="card-body d-flex flex-column py-2 px-2">
                <h5 className="card-title ">{truncatedName}</h5>
                <p>{truncatedEmail}</p>
                <div className=''>
                    {(uid) ? (
                        <div>{((uid === user.id) ? (
                            <button>Btn</button>
                        ) : (null))}</div>
                    ) : (
                        <div>
                            <button className='action-button bg-warning text-white'>
                                <Link
                                    to={`/login?email=${user.email}`} // Pass email as a parameter in the URL
                                    className='link-action text-light' style={{ textDecoration: 'none' }}
                                >
                                    Login
                                </Link>
                            </button>
                            <button className='action-button bg-danger text-white' onClick={() => onDelete(user.id)}>Delete</button>

                        </div>
                    )}

                </div>

            </div>
        </div>
        </div>


    );
};

export default UserCard;


