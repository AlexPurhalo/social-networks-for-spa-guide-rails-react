import React, { Component } from 'react';
import './App.css';
import axios from 'axios';

export default class App extends Component {
	constructor(props) {
		super(props);

		this.state = { message: null };
	}

	// componentDidMount() {
	// 	const testUrl = window.location.href;
	//
	// 	axios.get(`${testUrl}/test_route`)
	// 		.then(res => this.setState({ message: res.data.title }))
	// }

  render() {
		const serviceUrl = 'https://api.instagram.com',
			clientId 			 = process.env.REACT_APP_INST_CLIENT_ID,
			redirectUri 	 = process.env.REACT_APP_INST_REDIRECT_URI,
			responseType 	 = 'code';

		const authUrl = `
			${serviceUrl}/oauth/authorize/
			?client_id=${clientId}
			&redirect_uri=${redirectUri}
			&response_type=${responseType}
		`;
		const { message } = this.state;
    return (
			<div className="App">
				<h1>{ message ? message : 'loading...' }</h1>
				<a href={authUrl}>SignIn with Instagram</a>
			</div>
		);
  }
}
