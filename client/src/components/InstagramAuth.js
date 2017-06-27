import React, { Component } from 'react'
import axios from 'axios'
import { withRouter } from 'react-router-dom'


class InstagramAuth extends Component {
	constructor(props) {
		super()
		this.state = {
			errorMessage: null
		}
	}
	componentWillMount() {
		const params = new URLSearchParams(this.props.location.search);

		if (params && params.get('code')) {
			axios.get(`http://localhost:3000/auth/instagram/callback?code=${params.get('code')}`)
				.then(res => console.log(res))
				.then(this.props.history.push('/'))
				.catch(error => {
					this.setState({ errorMessage: error.response.data.errors[0] })
				})
		}
	}
	render() {
		const { errorMessage } = this.state
		return (
			<div>
				{errorMessage
					? 'Something wrong with authentication :('
					: 'Now you gonna be redirected...'}
			</div>
		);
	}
}

export default withRouter(InstagramAuth)
