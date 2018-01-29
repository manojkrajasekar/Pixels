import React, { Component } from 'react';
//import Login from './Login';
import Mainpage from './Landingpage/Mainpage';
import './App.css';

class App extends Component {
  render() {
    return (
      <div>
        <div className="App">
          <div className="App-header">
            <div className="App-title">PIXELS</div>
              <div className="userName">Mano</div>
              <input type="text" className="SearchBar" placeholder="search"></input>
          </div>
        </div>
        <Mainpage />
      </div>
    );
  }
}

export default App;
