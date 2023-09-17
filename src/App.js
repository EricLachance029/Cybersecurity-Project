import React from "react";
import "./App.css";
import Header from './Header';
//import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "./Home";
function App() {
return (
  <div className="app">
    <h1>You're Clever and Determined</h1>
    <Header />
    <Home />
  </div>
);
}

export default App;
