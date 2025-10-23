import { useContext, useEffect, useState } from "react"
import { MyContext } from "../../MyProvider"
import { useNavigate } from "react-router-dom"
import { Rating } from "react-simple-star-rating"
import { FaSearch } from "react-icons/fa"

function Destination() {
    const [countries, setCountries] = useState([])
    const [destinations, setDestinations] = useState([])
    const [searchedDestiations, setSearchedDestiations] = useState([])
    const {
        api,
        token,
        setSelectedDestination,
        setExchangeRate
    } = useContext(MyContext)
    const navigate = useNavigate()

    useEffect(() => {
        //Countries
        var api_call = api + "Destinations/getCountries"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {

            if (res.status == 401) {
                console.log("unauthorized")
                navigate('/')
            }
            setCountries(await res.json())

            //Destinations
            api_call = api + "Destinations/getDestinations"
            fetch(api_call, {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + token,
                    "Content-Type": "application/json"
                },
            }).then(async res => {
                const data = await res.json()
                setDestinations(data)
                setSearchedDestiations(data)
            })

        })


    }, [])

    const findDestination = (e) => {
        var searchInput = e.target.value
        console.log("searched input: " + searchInput)
        // setSearchedDestiations("")

        if (searchInput != "") {
            var list = []
            destinations.forEach(d => {
                const input = searchInput.toLowerCase()
                const destName = d.destinationName.toLowerCase()

                const result = destName.match(input)
                if (result != null) {
                    list.push(d)
                }
            })
            setSearchedDestiations(list)
        }
        else {
            setSearchedDestiations(destinations)
        }

    }

    const next = (dest) => {
        setSelectedDestination(dest)
        navigate('vacayDetails')
    }

    return (
        <>
            <h2>Select a destination</h2>

            <div className="search">
                <FaSearch className="search-icon"/>
                <input placeholder="Search for a destination" onChange={(e) => findDestination(e)}></input>
            </div>
            
            <div className="cards-section">
                {destinations.length != 0 ?
                    searchedDestiations.map((dest, idx) => {
                        return <div key={idx} className="card-ui" onClick={() => next(dest)}>
                            <div className="card-img">
                                <img src={dest.destinationImage}></img>
                                <div className="card-rating">
                                    <Rating initialValue={dest.destinationRating} readonly allowFraction size={"20px"}></Rating>
                                </div>

                            </div>
                            <p>{dest.destinationName}</p>
                            <p>{countries.find(c => c.countryId == dest.countryId).countryName}</p>
                            <p>{dest.destinationDescription}</p>
                        </div>
                    }) :
                    <p>no destination</p>
                }

            </div>
        </>
    );

}

export default Destination