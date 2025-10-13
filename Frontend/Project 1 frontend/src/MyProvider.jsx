import { createContext, useState } from "react"; 
 
export const MyContext = createContext(); 
 
export function MyProvider({ children }) {
    const api = "https://localhost:44353/api/"
    const [role, setRole] = useState(""); 
    const [token, setToken] = useState(""); 
    const [user, setUser] = useState("");
    
    return ( 
        <MyContext.Provider value={{api, role, token, user, setRole, setToken, setUser }}> 
            {children} 
        </MyContext.Provider> 
    ); 
} 