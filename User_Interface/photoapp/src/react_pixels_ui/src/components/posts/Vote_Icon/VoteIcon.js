import React, { Component } from 'react';
import './VoteIcon.css';


class VoteIcon extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            initial_votes: 1
        };
    }

    

    // votecount = (e) => {
        
    //     //const vote_count = this.props.votecount(vote_count);
        
    //     this.setState(() => {
    //         vote_count: this.state.vote_count + 1;
    //         console.log(vote_count);
    //       });
    // };

    Onchangecount() {
        this.setState(() => {
            initial_votes: this.state.initial_votes++;
            console.log(this.state.initial_votes);
          });

        this.props.Increasecount(this.state.initial_votes);
    }
    
    render() {
        return (
            <svg onClick ={this.Onchangecount.bind(this)} className="Camera" xmlns="http://www.w3.org/2000/svg" version="1.1" id="Capa_1" width="512" height="512" viewBox="0 0 512 512" >
                <title id="title">Umbrella Icon</title>
                <path d="M459,0H51C22.95,0,0,22.95,0,51v408c0,28.05,22.95,51,51,51h408c28.05,0,51-22.95,51-51V51C510,22.95,487.05,0,459,0z     M255,153c56.1,0,102,45.9,102,102c0,56.1-45.9,102-102,102c-56.1,0-102-45.9-102-102C153,198.9,198.9,153,255,153z M63.75,459    C56.1,459,51,453.9,51,446.25V229.5h53.55C102,237.15,102,247.35,102,255c0,84.15,68.85,153,153,153c84.15,0,153-68.85,153-153    c0-7.65,0-17.85-2.55-25.5H459v216.75c0,7.65-5.1,12.75-12.75,12.75H63.75z M459,114.75c0,7.65-5.1,12.75-12.75,12.75h-51    c-7.65,0-12.75-5.1-12.75-12.75v-51c0-7.65,5.1-12.75,12.75-12.75h51C453.9,51,459,56.1,459,63.75V114.75z" fill="#933EC5"/>
            </svg>
        );
    }
}

export default VoteIcon;