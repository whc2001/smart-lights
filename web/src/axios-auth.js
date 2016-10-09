import axios from 'axios'; 

axios.interceptors.request.use(function(config) {
	if (config.auth_me) { 
		const token = localStorage.getItem('jwtToken'); 
		config.headers['x-access-token'] = token ? token : ""; 
	}
	config.validateStatus = (status) => {
		return status >=200 && status < 500;
	}
	return config; 
});

axios.interceptors.response.use(function(response) {
	console.log(response);
	if(response.config.auth_me && response.status === 401) {
		if(!response.data.success) redirectToLogin();
	} 
	return response;
});

const redirectToLogin = () => {
	window.location.href = "#/login"; 
}

export default axios;
