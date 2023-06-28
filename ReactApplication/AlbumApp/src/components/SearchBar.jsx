import React, { useState } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faSearch } from '@fortawesome/free-solid-svg-icons';

const SearchBar = ({ users, setFilteredUsers }) => {
  const [searchQuery, setSearchQuery] = useState('');

  const handleSearch = (event) => {
    const query = event.target.value.toLowerCase();
    setSearchQuery(query);
    const filteredUsers = users.filter((user) =>
      user.name.toLowerCase().includes(query.trim())
    );
    setFilteredUsers(filteredUsers);
  };

  return (
    <div>
      <div className="container col-lg-4 col-sm-10 col-md-8 mt-4">
        <form className="d-flex input-group w-auto">
          <input
            type="search"
            className="form-control rounded"
            placeholder="Search"
            aria-label="Search"
            aria-describedby="search-addon"
            value={searchQuery}
            onChange={handleSearch}
          />
          <span className="input-group-text border-0" id="search-addon">
            <FontAwesomeIcon icon={faSearch} />
          </span>
        </form>
      </div>
    </div>
  );
};

export default SearchBar;










// import React, { useState } from 'react';
// import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
// import { faSearch } from '@fortawesome/free-solid-svg-icons';

// const SearchBar = ({ users, setFilteredUsers }) => {
//   const [searchQuery, setSearchQuery] = useState('');

//   const handleSearch = (event) => {
//     const query = event.target.value.toLowerCase();
//     setSearchQuery(query);
//     const filteredUsers = users.filter((user) =>
//       user.name.toLowerCase().includes(query)
//     );
//     setFilteredUsers(filteredUsers);
//   };

//   return (
//     <div>
//       <div className="container col-4 mt-4">
//         <form className="d-flex input-group w-auto">
//           <input
//             type="search"
//             className="form-control rounded"
//             placeholder="Search"
//             aria-label="Search"
//             aria-describedby="search-addon"
//             value={searchQuery}
//             onChange={handleSearch}
//           />
//           <span className="input-group-text border-0" id="search-addon">
//             <FontAwesomeIcon icon={faSearch} />
//           </span>
//         </form>
//       </div>
//     </div>
//   );
// };

// export default SearchBar;





