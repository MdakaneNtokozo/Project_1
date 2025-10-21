import { createContext, useState } from "react"; 
 
export const MyContext = createContext(); 
 
export function MyProvider({ children }) {
    //const api = "https://localhost:44353/api/"
    const api = "http://localhost:5017/api/"
    const [role, setRole] = useState(""); 
    const [token, setToken] = useState(""); 
    const [user, setUser] = useState("");
    const [selectedDestination, setSelectedDestination] = useState(null)
    const [startDate, setStartDate] = useState(null)
    const [endDate, setEndDate] = useState(null)
    const [selectedSpenderType, setSelectedSpenderType] = useState("")
    const [selectedBuddies, setSelectedBuddies] = useState([])
    const [selectedTransportation, setSelectedTransportations] = useState([])
    const [selectedAccommodations, setSelectedAccommodations] = useState([])
    const [selectedFoodSpots, setSelectedFoodSpots] = useState([])
    const [selectedAttractions, setSelectedAttractions] = useState([])
    const [currency, setCurrency] = useState(null)
    const [transList, setTransList] = useState([])
    const [transTotal, setTransTotal] = useState(0.0)
    const [accommList, setAccommList] = useState([])
    const [accommTotal, setAccommTotal] = useState(0.0)
    const [spotsList, setSpotsList] = useState([])
    const [spotsTotal, setSpotsTotal] = useState(0.0)
    const [attrsList, setAttrsList] = useState([])
    const [attrsTotal, setAttrsTotal] = useState(0.0)

    return ( 
        <MyContext.Provider value={{
                api,
                role, setRole,
                token, setToken,
                user, setUser,
                selectedDestination, setSelectedDestination,
                startDate, setStartDate,
                endDate, setEndDate,
                selectedSpenderType, setSelectedSpenderType,
                selectedBuddies, setSelectedBuddies,
                selectedTransportation, setSelectedTransportations,
                selectedAccommodations, setSelectedAccommodations,
                selectedFoodSpots, setSelectedFoodSpots,
                selectedAttractions, setSelectedAttractions,
                currency, setCurrency,
                transList, setTransList,
                transTotal, setTransTotal,
                accommList, setAccommList,
                accommTotal, setAccommTotal,
                spotsList, setSpotsList,
                spotsTotal, setSpotsTotal,
                attrsList, setAttrsList,
                attrsTotal, setAttrsTotal
            }}> 
            {children} 
        </MyContext.Provider> 
    ); 
} 