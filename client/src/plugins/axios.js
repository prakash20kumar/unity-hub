import axios from 'axios';

let apiUrl = process.env.REACT_APP_BASE_URL;

const token = localStorage.getItem('Token') ? localStorage.getItem('Token') : '';
const axiosInstance = axios.create({
    baseURL: apiUrl,
    headers: {
        // 'Content-Type': 'application/json',
        ...(token ? { 'Authorization': `Token ${token}` } : {})
        
    },
});    

export default axiosInstance;