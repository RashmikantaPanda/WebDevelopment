import React, { useContext, useState } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import axios from 'axios';
import { AuthContext } from '../App';

const Login = () => {
    const { setIsLoggedIn } = useContext(AuthContext);
    const location = useLocation();
    const searchParams = new URLSearchParams(location.search);
    const email = searchParams.get('email');
    const navigate = useNavigate();

    const [email1, setEmail1] = useState("");   //Email 1 
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');


    const handleLogin = async (event) => {
        event.preventDefault();

        try {
            const response = await axios.get('https://jsonplaceholder.typicode.com/users');

            const user = response.data.find(
                (user) => (user.email === email || user.email === email1) && user.username === password
            );
            if (user) {
                localStorage.setItem('isLoggedIn', 'true');
                setIsLoggedIn(true);
                localStorage.setItem('id', user.id)
                console.log('User:', user);
                // navigate(`/dashboard/${user.id}`,{ state: {user} });  
                navigate(`/dashboard/${user.id}`);

            } else {
                setError('Invalid email or password');
            }
        } catch (error) {
            setError('Error occurred during authentication');
        }
    };

    const showDefaultEmail = location.search && email;


    return (
        <div className="Auth-form-container">
            <form className="Auth-form" onSubmit={handleLogin}>
                <div className="Auth-form-content">
                    <h3 className="Auth-form-title">Sign In</h3>
                    <div className="form-group mt-3">
                        <label>Email address</label>
                        <input
                            type="email"
                            name="email1"
                            className="form-control mt-1"
                            //   value={email1}
                            //   defaultValue={email}
                            value={showDefaultEmail ? email : email1}

                            onChange={(e) => setEmail1(e.target.value)}
                        />
                    </div>
                    <div className="form-group mt-3">
                        <label>Password</label>
                        <input
                            type="password"
                            className="form-control mt-1"
                            // placeholder="Enter password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                        />
                    </div>
                    <div className="d-grid gap-2 mt-3">
                        <button type="submit" className="btn btn-primary" >
                            Login
                        </button>
                    </div>
                    {error && <p className="error-message mt-3 text-center text-danger">{error}</p>}
                </div>
            </form>
        </div>
    );
};

export default Login;


