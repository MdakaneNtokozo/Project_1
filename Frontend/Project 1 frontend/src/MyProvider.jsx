import { createContext, useState } from "react"; 
 
export const MyContext = createContext(); 
 
export function MyProvider({ children }) {
    const api = "https://localhost:44353/api/"
    const [role, setRole] = useState(""); 
    const [token, setToken] = useState(""); 
    
    return ( 
        <MyContext.Provider value={{api, role, token, setRole, setToken }}> 
            {children} 
        </MyContext.Provider> 
    ); 
} 