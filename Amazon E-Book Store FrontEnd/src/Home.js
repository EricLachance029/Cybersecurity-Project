import React from 'react'
import "./Home.css";
import Product from "./Product";

function Home() {
    return <div className="home">
       <div className="home__container">
        <img
          className="home__image"
          src="https://m.media-amazon.com/images/I/511rgSNg6SL._SL10_UR1600,800_CR200,50,1200,630_CLa%7C1200,630%7C511rgSNg6SL.jpg%7C0,0,1200,630+82,82,465,465_PJAdblSocialShare-Gradientoverlay-largeasin-0to70,TopLeft,0,0_PJAdblSocialShare-AudibleLogo-Large,TopLeft,600,270_OU01_ZBLISTENING%20ON,617,216,52,500,AudibleSansMd,30,255,255,255.jpg"
          alt=""
        />

<div className="home__row">
          <Product
            id="12321341"
            title="React Key Concepts: Consolidate your knowledge of React's core features Paperback – Dec 26 2022"
            price={11.96}
            rating={5}
            image="https://m.media-amazon.com/images/I/613V82qOt1L._AC_UL320_.jpg"
          />
          <Product
            id="49538094"
            title="The Complete Software Developer's Career Guide: How to Learn Programming Languages Quickly, Ace Your Programming Interview, and Land Your Software Developer Dream Job"
            price={239.0}
            rating={4}
            image="https://m.media-amazon.com/images/I/812o53YJWzL._AC_UL320_.jpg"
          />
        </div>

        <div className="home__row">
          <Product
            id="4903850"
            title="Head First Design Patterns: Building Extensible and Maintainable Object-Oriented Software Paperback – Jan. 12 2021"
            price={199.99}
            rating={3}
            image="https://m.media-amazon.com/images/I/91quawUTiVL._AC_UL320_.jpg"
          />
          <Product
            id="23445930"
            title="Learning JavaScript Design Patterns: A JavaScript and React Developer's Guide Paperback – June 6 2023"
            price={98.99}
            rating={5}
            image="https://m.media-amazon.com/images/I/81LpyFBbo8L._AC_UL320_.jpg"
          />
          <Product
            id="3254354345"
            title="Software Developer Gifts: Software Developer Coloring Book For Adults: Motivational Swear Word Coloring Book for Software Developers with funny Cuss Words for Stress Relief & Relaxation, Software Developer Gifts For Women & Men Paperback – Sept. 29 2022"
            price={598.99}
            rating={4}
            image="https://m.media-amazon.com/images/I/81600wBcVoL._AC_UL320_.jpg"
          />
        </div>

        <div className="home__row">
          <Product
            id="90829332"
            title="Learning C# by Developing Games with Unity: Get to grips with coding in C# and build simple 3D games in Unity 2022 from the ground up, 7th Edition Paperback – Nov. 29 2022"
            price={1094.98}
            rating={4}
            image="https://m.media-amazon.com/images/I/71qanLtaJUL._AC_UL320_.jpg"
            />
            </div>
          </div>
        </div>
      
    }
    
    export default Home;