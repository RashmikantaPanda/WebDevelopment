import React from 'react'
import { Navigate, Outlet } from 'react-router-dom';

function Protected() {
  const token = localStorage.getItem('id');
  // const loggedIn = localStorage.getItem('isLoggedIn');
  return (
    token ? <Outlet /> : <Navigate to='/login' />
    // loggedIn?<Outlet />:<Navigate to='/' />

  )
}

export default Protected