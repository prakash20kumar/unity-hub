import axios from 'axios';

// Create an Axios instance
const axiosInstance = axios.create({
  baseURL: process.env.REACT_APP_BASE_URL,
});

// Optionally, you can add interceptors to dynamically set the token
axiosInstance.interceptors.request.use(
  config => {
    const cookies = document.cookie.split(';').reduce((cookies, cookie) => {
      const [name, value] = cookie.split('=').map(c => c.trim());
      cookies[name] = value;
      return cookies;
    }, {});

    const token = cookies.token; // Grab the token from cookies

    if (token) {
      config.headers['Authorization'] = `Bearer ${token}`;
    }
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);

export default axiosInstance;
