import React, { Component } from 'react';
import './Mainpage.css';

class Mainpage extends Component{
  
 render() {
  const styles = {
    fontWeight:'bold'
  };
    return (
      <div>
        <div className="Content">
          <div className="winnerDetails">
              <div style={styles}className="bestFind">BEST FIND</div>
              <div className="winner"></div>
          </div>
          <div className="posts">
              <div className="post"> 
                  <div className="postedBy">Vicky</div>
                  <div className="postpic"></div>
                  
                  <svg className="vote" viewBox="0 0 100 100" width="1rem">
                    <path d="M5 15 L5 15 L18 15" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M18 15 L18 15 L23 5" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M23 5 L23 5 L33 5" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M33 5 L33 5 L38 15" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M38 15 L38 15 L50 15" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M50 15 L50 15 L50 35" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M5 15 L5 15 L5 35" fill="none" strokeWidth="2" stroke="black"></path>  
                    <path d="M5 36 L5 36 L50 36" fill="none" strokeWidth="2" stroke="black"></path> 
                  </svg>
                  <span className="votes">2100 votes</span>
                  <div className="Description">Vicky: A wild Life shot on IPhoneX !</div>
              </div>
              <div className="post">
                  <div className="postedBy">Dishen</div>
                  <div className="postpic"></div>

                  <svg className="vote" viewBox="0 0 100 100" width="1rem">
                    <path d="M5 15 L5 15 L18 15" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M18 15 L18 15 L23 5" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M23 5 L23 5 L33 5" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M33 5 L33 5 L38 15" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M38 15 L38 15 L50 15" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M50 15 L50 15 L50 35" fill="none" strokeWidth="2" stroke="black"></path>
                    <path d="M5 15 L5 15 L5 35" fill="none" strokeWidth="2" stroke="black"></path>  
                    <path d="M5 36 L5 36 L50 36" fill="none" strokeWidth="2" stroke="black"></path> 
                  </svg>
                  <span className="votes">2100 votes</span>
              </div>
          </div>
          <div className="Topic">
              <div className="TopicTitle">TOPIC</div>
              <div className ="TopicContent">WILDLIFE</div>
              <div className ="TimeLimit">Avaiable till: 3rd January, 2018</div>   
          </div>
        </div>
      </div>
    );
  }
}


export default Mainpage;


