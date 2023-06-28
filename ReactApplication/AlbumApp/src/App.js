import React, { useState, useEffect } from 'react';
import UserList from './components/UserList';
import Navbar from './components/Navbar';
import Login from './components/Login';
import Dashboard from './components/Dashboard';
import AlbumTitle from './components/AlbumTitle';
import Protected from './components/Protected';
import My404Component from './components/My404Component';

import { BrowserRouter, Routes, Route,Navigate  } from 'react-router-dom';
import PhotosPage from './components/PhotosPage';

export const AuthContext = React.createContext();

const App = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const id=localStorage.getItem('id');

  useEffect(() => {
    const storedIsLoggedIn = localStorage.getItem('isLoggedIn');
    setIsLoggedIn(storedIsLoggedIn === 'true');
  }, []);


  const handleLogout = () => {
    setIsLoggedIn(false);
  };

  return (
    <AuthContext.Provider value={{ isLoggedIn, setIsLoggedIn, handleLogout }}>
      <BrowserRouter>
        <Navbar isLoggedIn={isLoggedIn} handleLogout={handleLogout} />
        <Routes>
          <Route path="/" element={<UserList />} />
          <Route path="/login" element={isLoggedIn ? <Navigate to={`/dashboard/${id}`} /> : <Login />} />
          <Route path='*' element={<My404Component />} />
          <Route element={<Protected />}>
            <Route path="/dashboard/:id" element={<Dashboard />} />
            <Route path="/dashboard/:id/albums" element={<AlbumTitle />} />
            <Route path="/photos/:albumId" element={<PhotosPage />} />
          </Route>
        </Routes>
      </BrowserRouter>
    </AuthContext.Provider>
  );
};

export default App;

