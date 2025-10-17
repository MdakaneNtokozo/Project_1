import { useContext, useEffect, useRef, useState } from "react"
import Footer from "../Footer"
import Header from "../Header"
import { MyContext } from "../MyProvider"
import { Rating } from "react-simple-star-rating"
import { IoCheckmarkCircleOutline } from "react-icons/io5"
import { BiCheckCircle } from "react-icons/bi"

function AddVacayPlan() {
    const { api, token, user } = useContext(MyContext)
    //Reference variables
    const destRef = useRef("")

    //Error variables
    const [dateError, setDateError] = useState("")
    const [spenderError, setSpenderError] = useState("")
    const [buddyError, setBuddyError] = useState("")

    //Section and nav variables
    const [section, setSection] = useState(1)

    //Variables for when creating vacation plan
    const [countries, setCountries] = useState([])

    const [destinations, setDestinations] = useState([])
    const [searchedDestiations, setSearchedDestiations] = useState([])
    const [selectedDestination, setSelectedDestination] = useState(null)

    const [startDate, setStartDate] = useState("")
    const [endDate, setEndDate] = useState("")

    const [spenderTypes, setSpenderTypes] = useState([])
    const [selectedSpenderType, setSelectedSpenderType] = useState("")

    const [hasTravelBuddies, setHasTravelBuddies] = useState("")
    const [users, setUsers] = useState([])
    const [selectedBuddies, setSelectedBuddies] = useState([])

    const [transportations, setTransportations] = useState([])
    const [transportationTypes, setTransportationTypes] = useState([])
    const [selectedTransportation, setSelectedTransportations] = useState([])
    const [suggestedTransportations, setSuggestedTransportations] = useState([])

    const [accommodations, setAccommodations] = useState([])
    const [accommodationTypes, setAccommodationTypes] = useState([])
    const [selectedAccommodations, setSelectedAccommodations] = useState([])
    const [suggestedAccommodations, setSuggestedAccommodations] = useState([])

    const [foodSpots, setFoodSpots] = useState([])
    const [foodSpotTypes, setFoodSpotTypes] = useState([])
    const [selectedFoodSpots, setSelectedFoodSpots] = useState([])
    const [suggestedFoodSpots, setSuggestedFoodSpots] = useState([])

    const [attractions, setAttractions] = useState([])
    const [selectedAttractions, setSelectedAttractions] = useState([])
    const [suggestedAttractions, setSuggestedAttractions] = useState([])

    useEffect(() => {
        //Countries
        var api_call = api + "Destinations/getCountries"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setCountries(await res.json()))

        //Destinations
        var api_call = api + "Destinations/getDestinations"
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

        //Spender types
        api_call = api + "LoginSignup/getSpenderTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setSpenderTypes(await res.json()))

        //Users (travel buddies)
        api_call = api + "LoginSignup/users"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            var data = await res.json()
            data = data.filter(u => u.userId != user.userId)
            setUsers(data)
        })

        //Transportations
        api_call = api + "Destinations/getTransportations"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setTransportations(await res.json()))

        //Transportation types
        api_call = api + "Destinations/getTransportationTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setTransportationTypes(await res.json()))

        //Accommodation types
        api_call = api + "Destinations/getAccommodationTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAccommodationTypes(await res.json()))

        //Accommodations
        api_call = api + "Destinations/getAccommodations"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAccommodations(await res.json()))

        //Food spot types
        api_call = api + "Destinations/getFoodSpotTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setFoodSpotTypes(await res.json()))

        //Food spots
        api_call = api + "Destinations/getFoodSpots"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setFoodSpots(await res.json()))

        //Attractions
        api_call = api + "Destinations/getAttractions"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAttractions(await res.json()))

    }, [])

    const formatDate = (date) => {
        if (date != "") {
            const year = date.getFullYear()
            const month = date.getMonth() + 1
            const day = date.getDate()

            return year + "-" + month + "-" + (day < 10 ? "0" + day : day)
        }
    }

    const formatDate2 = (date) => {
        const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

        const year = date.getFullYear()
        const month = months.at(date.getMonth())
        const day = date.getDate()

        return day + " " + month + " " + year
    }

    const allowNext = () => {
        setDateError("")
        setSpenderError("")
        setBuddyError("")
        const today = new Date(formatDate(new Date))

        if (startDate == "" || endDate == "") {
            setDateError("Select start and end dates")
        } else if (startDate < today || endDate < today) {
            setDateError("Dates should be today onwards")
        } else if (startDate > endDate) {
            setDateError("Start date must be before end date")
        } else if (selectedSpenderType == "") {
            setSpenderError("Please select type of spender")
        } else if (hasTravelBuddies == "") {
            setBuddyError("Select whether you are traveling alone or with others")
        }
        else if (hasTravelBuddies == "true" && selectedBuddies.length == 0) {
            setBuddyError("Select buddies who will travel with you")
        } else {
            next()
        }
    }

    const next = () => {
        const sectionNum = section + 1
        setSection(sectionNum)

        if (section == 2) {
            getSuggestedTransportation()
        }

        if (section == 3) {
            getSuggestedAccommodation()
        }

        if (section == 4) {
            getSuggestedFoodSpot()
        }

        if (section == 5) {
            getSuggestedAttraction()
        }
    }

    const back = () => {
        const sectionNum = section - 1
        setSection(sectionNum)
        console.log("back: " + section)

        if (section < 3) {
            setSearchedDestiations(destinations)
        } else if (section < 4) {
            setSelectedTransportations([])
        } else if (section < 5) {
            setSelectedAccommodations([])
        }
    }

    const stopReload = (event) => {
        //to stop the form from reloading when submitting
        event.preventDefault()
    }

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

    const addTheSelectedTravelBuddies = (e) => {
        const user = users.find(u => u.userName == e.target.value)

        if (!selectedBuddies.includes(user) && user != undefined) {
            setSelectedBuddies([...selectedBuddies, user])
            e.target.value = ""
        }
    }

    const removeTheSelectedTravelBuddies = (value) => {
        const user = users.find(u => u.userId == value)
        setSelectedBuddies([...selectedBuddies.filter(b => b != user)])

    }

    const addTheSelectedTransportation = (id) => {
        const trans = transportations.find(t => t.transportationId == id)

        if (selectedTransportation.includes(trans) && trans != undefined) {
            setSelectedTransportations([...selectedTransportation.filter(t => t != trans)])
        } else if (!selectedTransportation.includes(trans) && trans != undefined) {
            setSelectedTransportations([...selectedTransportation, trans])
        }
    }

    const addTheSelectedAccommodation = (id) => {
        const accomm = accommodations.find(a => a.accommodationId == id)

        if (selectedAccommodations.includes(accomm) && accomm != undefined) {
            setSelectedAccommodations([...selectedAccommodations.filter(a => a != accomm)])
        } else if (!selectedAccommodations.includes(accomm) && accomm != undefined) {
            setSelectedAccommodations([...selectedAccommodations, accomm])
        }
    }

    const addTheSelectedFoodSpot = (id) => {
        const foodsp = foodSpots.find(f => f.foodSpotId == id)

        if (selectedFoodSpots.includes(foodsp) && foodsp != undefined) {
            setSelectedFoodSpots([...selectedFoodSpots.filter(f => f != foodsp)])
        } else if (!selectedFoodSpots.includes(foodsp) && foodsp != undefined) {
            setSelectedFoodSpots([...selectedFoodSpots, foodsp])
        }
    }

    const addTheSelectedAttraction = (id) => {
        const attr = attractions.find(a => a.attractionId == id)

        if (selectedAttractions.includes(attr) && attr != undefined) {
            setSelectedAttractions([...selectedAttractions.filter(a => a != attr)])
        } else if (!selectedAttractions.includes(attr) && attr != undefined) {
            setSelectedAttractions([...selectedAttractions, attr])
        }
    }

    const getSuggestedTransportation = () => {
        var spenderTypeId = spenderTypes.find(t => t.spenderTypeName == selectedSpenderType).spenderTypeId
        var destinationId = selectedDestination.destinationId

        var api_call = api + "Destinations/getSuggestedTransportation?spenderTypeId=" + spenderTypeId + "&destinationId= " + destinationId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setSuggestedTransportations(await res.json()))
    }

    const getSuggestedAccommodation = () => {
        var spenderTypeId = spenderTypes.find(t => t.spenderTypeName == selectedSpenderType).spenderTypeId
        var destinationId = selectedDestination.destinationId

        var api_call = api + "Destinations/getSuggestedAccommodation?spenderTypeId=" + spenderTypeId + "&destinationId= " + destinationId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setSuggestedAccommodations(await res.json()))
    }

    const getSuggestedFoodSpot = () => {
        var spenderTypeId = spenderTypes.find(t => t.spenderTypeName == selectedSpenderType).spenderTypeId
        var destinationId = selectedDestination.destinationId

        var api_call = api + "Destinations/getSuggestedFoodSpot?spenderTypeId=" + spenderTypeId + "&destinationId= " + destinationId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setSuggestedFoodSpots(await res.json()))
    }

    const getSuggestedAttraction = () => {
        var spenderTypeId = spenderTypes.find(t => t.spenderTypeName == selectedSpenderType).spenderTypeId
        var destinationId = selectedDestination.destinationId

        var api_call = api + "Destinations/getSuggestedAttraction?spenderTypeId=" + spenderTypeId + "&destinationId= " + destinationId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setSuggestedAttractions(await res.json()))
    }

    return (
        <>
            <Header />

            <div className="container">
                <form className="add-plan-form" onSubmit={stopReload}>
                    {section == 1 ?
                        <>
                            <h2>Select a destination</h2>
                            <input ref={destRef} placeholder="Search for a destination" onChange={(e) => findDestination(e)}></input>

                            <div className="cards-section">
                                {destinations.length != 0 ?
                                    searchedDestiations.map(dest => {
                                        return <div className="card-ui" onClick={() => {
                                            setSection(2)
                                            setSelectedDestination(dest)
                                        }
                                        }>
                                            <div className="card-img">
                                                <img src={dest.destinationImage}></img>
                                                <div className="card-rating">
                                                    <Rating initialValue={dest.destinationRating} readonly allowFraction size={"20px"}></Rating>
                                                </div>

                                            </div>
                                            <p>{dest.destinationName}</p>
                                            <p>{console.log(countries.find(c => c.countryId == dest.countryId).countryName)}</p>
                                            <p>{dest.destinationDescription}</p>
                                        </div>
                                    }) :
                                    <p>no destination</p>
                                }

                            </div>
                        </>
                        :

                        <></>
                    }

                    {section == 2 ?
                        <div className="adding-details-container">
                            <div>
                                <h2>Vacation plan creation for {selectedDestination.destName}</h2>
                                <div className="adding-details-dates-container">
                                    <div>
                                        <label>Start date</label>
                                        <input placeholder="select start vacation date" type="date" value={formatDate(startDate)} onChange={(e) => setStartDate(e.target.valueAsDate)} required></input>

                                    </div>

                                    <div>
                                        <label>End date</label>
                                        <input placeholder="select end vacation date" type="date" value={formatDate(endDate)} onChange={(e) => setEndDate(e.target.valueAsDate)} required></input>

                                    </div>

                                </div>
                                {dateError != "" ?
                                    <p className="error-msg" style={{ margin: "0px", marginBottom: "8px" }}>{dateError}</p> :
                                    <></>
                                }

                                <label>What type of spender are you?</label>
                                <select placeholder="What type of spender are you?" value={selectedSpenderType} onChange={(e) => setSelectedSpenderType(e.target.value)} required>
                                    <option value={""}>Select the type of spender you are</option>
                                    {spenderTypes.map((type) => {
                                        return <option key={type.spenderTypeId} value={type.spenderTypeName}>{type.spenderTypeName}</option>
                                    })}
                                </select>
                                {spenderError != "" ?
                                    <p className="error-msg" style={{ margin: "0px", marginBottom: "8px" }}>{spenderError}</p> :
                                    <></>
                                }

                                <label>Will you travel with others?</label>
                                <select placeholder="What type of spender are you?" value={hasTravelBuddies} onChange={(e) => {
                                    setBuddyError("")
                                    setHasTravelBuddies(e.target.value)
                                }} required>
                                    <option value={""}>Select an option</option>
                                    <option value={false}>No</option>
                                    <option value={true}>Yes</option>
                                </select>

                                {hasTravelBuddies == "true" ?
                                    <>
                                        <label>Add travel buddies</label>
                                        <input placeholder="Search for travel companions" list="companions" onSelect={(e) => {
                                            addTheSelectedTravelBuddies(e)
                                            setBuddyError("")
                                        }}></input>
                                        <datalist id="companions">
                                            {users.map((u) => {
                                                return <option key={u.userId} value={u.userName} >{u.userName} {u.userSurname}</option>
                                            })}
                                        </datalist>
                                        <div className="buddies-container">
                                            {selectedBuddies.length != 0 ?
                                                <>
                                                    {selectedBuddies.map((b, idx) => {
                                                        return <div className="buddy-card" >
                                                            <div>
                                                                <h2>Travel buddy {idx + 1}</h2>
                                                                <h4>Name: {b.userName} {b.userSurname}</h4>
                                                                <h4>Email: {b.userEmail}</h4>
                                                            </div>
                                                            <p onClick={() => removeTheSelectedTravelBuddies(b.userId)}>X</p>
                                                        </div>
                                                    })}

                                                </> :
                                                <p>No travel buddies selected</p>
                                            }
                                        </div>
                                    </> : <></>
                                }

                                {buddyError != "" ?
                                    <p className="error-msg" style={{ margin: "0px", marginBottom: "8px" }}>{buddyError}</p> :
                                    <></>
                                }

                            </div>

                            <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                                <button onClick={back} type="button">Back</button>
                                <button onClick={allowNext} type="button">Next</button>
                            </div>


                        </div>
                        :

                        <></>
                    }

                    {section == 3 ?
                        <div>

                            <div>
                                <h2>Select transportations from {selectedDestination.destinationName}</h2>

                                <div className="cards-section">
                                    {transportations.length.length != 0 ?
                                        transportations.map(t => {
                                            if (t.destinationId == selectedDestination.destinationId) {
                                                var isFound = suggestedTransportations.find(tr => tr.transportationId == t.transportationId) != undefined

                                                return <div className={selectedTransportation.includes(t) ? "selected-card-ui" : "card-ui"} onClick={() => addTheSelectedTransportation(t.transportationId)}>
                                                    <div className="card-img">
                                                        <img src={t.transportationImage}></img>
                                                        <div className="card-rating">
                                                            <Rating initialValue={t.transportationRating} readonly allowFraction size={"20px"}></Rating>
                                                        </div>
                                                        {isFound ?
                                                            <div className="suggested">
                                                                <BiCheckCircle size={"35px"} color="yellow"></BiCheckCircle>
                                                            </div> :
                                                            <></>
                                                        }

                                                    </div>
                                                    <p>{t.transportationName}</p>
                                                    <p>Price per person: {t.transportationPricePerPerson}</p>
                                                    <p>Num of people: {t.transportationMinPeople} - {t.transportationMaxPeople}</p>
                                                    <p>{transportationTypes.find(type => type.transportationTypeId == t.transportationTypeId).transportationTypeName} </p>
                                                </div>
                                            }
                                        }) :
                                        <p>no destination</p>
                                    }

                                </div>


                            </div>

                            <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                                <button onClick={back} type="button">Back</button>
                                <button onClick={next} type="button">Next</button>
                            </div>


                        </div>
                        :

                        <></>
                    }

                    {section == 4 ?
                        <div>

                            <div>
                                <h2>Select accommodations for {selectedDestination.destinationName}</h2>

                                <div className="cards-section">
                                    {accommodations.length.length != 0 ?
                                        accommodations.map(a => {
                                            if (a.destinationId == selectedDestination.destinationId) {
                                                var isFound = suggestedAccommodations.find(ac => ac.accommodationId == a.accommodationId) != undefined

                                                return <div className={selectedAccommodations.includes(a) ? "selected-card-ui" : "card-ui"} onClick={() => addTheSelectedAccommodation(a.accommodationId)}>
                                                    <div className="card-img">
                                                        <img src={a.accommodationImage}></img>
                                                        <div className="card-rating">
                                                            <Rating initialValue={a.accommodationRating} readonly allowFraction size={"20px"}></Rating>

                                                        </div>
                                                        {isFound ?
                                                            <div className="suggested">
                                                                <BiCheckCircle size={"35px"} color="yellow"></BiCheckCircle>
                                                            </div> :
                                                            <></>
                                                        }
                                                    </div>
                                                    <p>{a.accommodationName}</p>
                                                    <p>{a.accommodationAddress}</p>
                                                    <p>Price per person: {a.accommodationPricePerPerson}</p>
                                                    <p>Num of people: {a.accommodationMinNumOfPeople} - {a.accommodationMaxNumOfPeople}</p>
                                                    <p>{accommodationTypes.find(type => type.accomodationTypeId == a.accomodationTypeId).accommodationTypeName} </p>
                                                    <p>{a.accommodationAmenities}</p>
                                                </div>
                                            }
                                        }) :
                                        <p>no accommodations</p>
                                    }

                                </div>


                            </div>

                            <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                                <button onClick={back} type="button">Back</button>
                                <button onClick={next} type="button">Next</button>
                            </div>


                        </div>
                        :

                        <></>
                    }

                    {section == 5 ?
                        <div>

                            <div>
                                <h2>Select food spots from {selectedDestination.destinationName}</h2>

                                <div className="cards-section">
                                    {foodSpots.length.length != 0 ?
                                        foodSpots.map(f => {
                                            if (f.destinationId == selectedDestination.destinationId) {
                                                var isFound = suggestedFoodSpots.find(fs => fs.foodSpotId == f.foodSpotId) != undefined

                                                return <div className={selectedFoodSpots.includes(f) ? "selected-card-ui" : "card-ui"} onClick={() => addTheSelectedFoodSpot(f.foodSpotId)}>
                                                    <div className="card-img">
                                                        <img src={f.foodSpotImage}></img>
                                                        <div className="card-rating">
                                                            <Rating initialValue={f.foodSpotRating} readonly allowFraction size={"20px"}></Rating>
                                                        </div>
                                                        {isFound ?
                                                            <div className="suggested">
                                                                <BiCheckCircle size={"35px"} color="yellow"></BiCheckCircle>
                                                            </div> :
                                                            <></>
                                                        }
                                                    </div>
                                                    <p>{f.foodSpotName}</p>
                                                    <p>{f.accommodationAddress}</p>
                                                    <p>Menu price: {f.foodSpotMinMenuPrice} - {f.foodSpotMaxMenuPrice}</p>
                                                    <p>Menu: {f.foodSpotMenuItems}</p>
                                                    <p>{foodSpotTypes.find(type => type.foodSpotTypeId == f.foodSpotTypeId).foodSpotTypeName} </p>
                                                </div>
                                            }
                                        }) :
                                        <p>no food spots</p>
                                    }

                                </div>


                            </div>

                            <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                                <button onClick={back} type="button">Back</button>
                                <button onClick={next} type="button">Next</button>
                            </div>


                        </div>
                        :

                        <></>
                    }

                    {section == 6 ?
                        <div>

                            <div>
                                <h2>Select attractions from {selectedDestination.destinationName}</h2>

                                <div className="cards-section">
                                    {attractions.length.length != 0 ?
                                        attractions.map(a => {
                                            if (a.destinationId == selectedDestination.destinationId) {
                                                var isFound = suggestedAttractions.find(ac => ac.attractionId == a.attractionId) != undefined

                                                return <div className={selectedAttractions.includes(a) ? "selected-card-ui" : "card-ui"} onClick={() => addTheSelectedAttraction(a.attractionId)}>
                                                    <div className="card-img">
                                                        <img src={a.attractionImage}></img>
                                                        <div className="card-rating">
                                                            <Rating initialValue={a.attractionRating} readonly allowFraction size={"20px"}></Rating>

                                                        </div>
                                                        {isFound ?
                                                            <div className="suggested">
                                                                <BiCheckCircle size={"35px"} color="yellow"></BiCheckCircle>
                                                            </div> :
                                                            <></>
                                                        }
                                                    </div>
                                                    <p>{a.attractionName}</p>
                                                    <p>{a.attractionAddress}</p>
                                                    <p>Entrance fee: {a.attractionEntranceFee}</p>
                                                    <p>Time limited: {a.attractionTimeLimited == 1 ? "yes" : "no"} </p>
                                                    <p>{a.attractionDescription}</p>
                                                </div>
                                            }
                                        }) :
                                        <p>no accommodations</p>
                                    }

                                </div>


                            </div>

                            <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                                <button onClick={back} type="button">Back</button>
                                <button onClick={next} type="button">Next</button>
                            </div>


                        </div>
                        :

                        <></>
                    }

                    {section == 7 ?
                        <div style={{ display: "flex", flexDirection: "row", width: "100%", height:"100%" }}>
                            <div style={{ width: "70%" }}>
                                <h2>Vaction details for {selectedDestination.destinationName}</h2>
                                <p>Start date: {formatDate2(startDate)}</p>
                                <p>End date: {formatDate2(endDate)}</p>
                                <p>Num of travel buddies: {selectedBuddies.length}</p>
                                <p>Selected transportation:</p>
                                {setSelectedTransportations.length != 0 ?
                                    selectedAccommodations.map((t, idx) =>{
                                        return <p key={idx}>{t.transportationName}</p>
                                    })
                                    
                                    :
                                    <p>No transportation selected</p>
                                }
                                <p>Selected accommodation:</p>
                                {selectedAccommodations.length != 0 ?
                                    selectedAccommodations.map((a, idx) =>{
                                        return <p key={idx}>{a.accommodationName}</p>
                                    })
                                    
                                    :
                                    <p>No accommodation selected</p>
                                }
                                <p>Selected food spots:</p>
                                {selectedFoodSpots.length != 0 ?
                                    selectedFoodSpots.map((f, idx) =>{
                                        return <p key={idx}>{f.foodSpotName}</p>
                                    })
                                    
                                    :
                                    <p>No food spots selected</p>
                                }
                                <p>Selected attractions:</p>
                                {selectedAttractions.length != 0 ?
                                    selectedAttractions.map((a, idx) =>{
                                        return <p key={idx}>{a.attractionName}</p>
                                    })
                                    
                                    :
                                    <p>No attractions selected</p>
                                }

                                <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                                    <button onClick={back} type="button">Back</button>
                                    <button onClick={next} type="button">Next</button>
                                </div>
                            </div>

                            <div style={{ width: "30%" }}>
                                <h2>Vacation Total</h2>

                            </div>

                        </div>

                        : <></>
                    }

                </form>




            </div>

            <Footer />
        </>
    )
}

export default AddVacayPlan