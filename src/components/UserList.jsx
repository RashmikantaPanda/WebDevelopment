import React, { useState, useEffect } from 'react';
import axios from 'axios';
import UserCard from './UserCard';
import SearchBar from './SearchBar';

const UserList = () => {
  const [users, setUsers] = useState([]);
  const [filteredUsers, setFilteredUsers] = useState([]);

  useEffect(() => {
    const fetchData = async () => {

      try {
        const response = await axios.get('https://jsonplaceholder.typicode.com/users');
        setUsers(response.data);
        setFilteredUsers(response.data);

      } catch (error) {
        console.log(error);
      }
    };

    fetchData();
  }, []);

  const deleteUser = async (userId) => {
    try {
      // Delete the user data from the API
      await axios.delete(`https://jsonplaceholder.typicode.com/users/${userId}`);

      // Remove the deleted user from the local state
      setUsers((prevUsers) => prevUsers.filter((user) => user.id !== userId));
      setFilteredUsers((prevUsers) => prevUsers.filter((user) => user.id !== userId));
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <div className="user">
      <SearchBar users={users} setFilteredUsers={setFilteredUsers} />
      <div className='container mt-5'>
        <div class="row">

          {filteredUsers.map((user) => (
            <UserCard key={user.id} user={user} onDelete={deleteUser} />
          ))}
        </div>
      </div>
    </div>

  );
};

export default UserList;



