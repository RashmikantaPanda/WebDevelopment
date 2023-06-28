import React, { useContext } from 'react';
import { NavLink,useNavigate } from 'react-router-dom';
import { AuthContext } from '../App';
// import '../App.css';

const Navbar = () => {
  const { isLoggedIn, setIsLoggedIn} = useContext(AuthContext);
  const navigate = useNavigate();
  const id=localStorage.getItem('id');

  const handleLogout = () => {
    localStorage.removeItem('isLoggedIn');
    localStorage.removeItem('id');
    setIsLoggedIn(false);
    navigate('/');
  };

  return (
    <div style={{ marginTop: '5px',justifyContent:'center' }}>
      {isLoggedIn ? (
        <>        
            <nav className="navbar navbar-light bg-light nav justify-content-center">
                <a className='navbar-brand'> <NavLink to="/"   style={{ padding: '2px', textDecoration: 'none', fontSize: '20px' }} >USERS </NavLink></a>
                <a className='navbar-brand'> <NavLink to={`/dashboard/${id}`}    style={{ padding: '2px', textDecoration: 'none', fontSize: '20px' }} >DASHBOARD </NavLink></a>
                <a className='navbar-brand'> <button className="btn btn-danger my-2 " onClick={handleLogout}>Logout</button></a>
                   
            </nav>   
        </>
      ) : (
        <>    
          <nav class="navbar navbar-light bg-light justify-content-center">
                <a className='navbar-brand'> <NavLink to="/" style={{ padding: '2px', textDecoration: 'none', fontSize: '20px' }}   >USERS </NavLink></a>
                <a className='navbar-brand'> <NavLink to={`/dashboard/${id}`}   style={{ padding: '2px', textDecoration: 'none', fontSize: '20px'}} >DASHBOARD </NavLink></a>
                <a className='navbar-brand'><NavLink to="/login" style={{ padding: '10px', textDecoration: 'none', fontSize: '20px' }}>LOGIN</NavLink></a>                       
          </nav>
        </>
      )}
    </div>
  );
};

export default Navbar;


