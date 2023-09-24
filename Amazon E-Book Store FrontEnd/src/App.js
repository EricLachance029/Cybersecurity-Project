import React from "react";
import "./App.css";
import Header from './Header';
import Home from "./Home";

function App() {
  return (
    //BEM naming convention
    <div className="app">
      <h1>Let's Build an Amazon Store</h1>
      <Header  />
      <Home />  
    </div>
  );
}

export default App;
