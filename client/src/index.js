import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import About from './components/About';
import NotFound from './components/NotFound';
import InstagramAuth from './components/InstagramAuth';
import registerServiceWorker from './registerServiceWorker';
import './index.css';
import {
	BrowserRouter as Router,
	Route,
	Switch
} from 'react-router-dom';

ReactDOM.render(
	<Router>
		<div>
			<Switch>
				<Route exact path="/" component={App}/>
				<Route path="/auth/instagram/" component={InstagramAuth} />
				<Route path="/about" component={About}/>
				<Route component={NotFound} />
			</Switch>
		</div>
	</Router>, document.getElementById('root'));
registerServiceWorker();
