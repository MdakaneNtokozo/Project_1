import { useContext, useEffect, useRef, useState } from "react"
import Footer from "../Footer"
import Header from "../Header"
import { MyContext } from "../MyProvider"

function AddPlan() {
    const { api, token, user } = useContext(MyContext)
    //Reference variables
    const destRef = useRef("")
    const compRef = useRef("")

    //Error variables
    const [destError, setDestError] = useState("")
    const [dateError, setDateError] = useState("")
    const [spenderError, setSpenderError] = useState("")

    //Section and nav variables
    const [section, setSection] = useState(1)
    const [navSelected, setNavSelected] = useState("Preview")

    //Variables for when creating vacation plan
    const [destinations, setDestinations] = useState([])
    const [destSelected, setSelectedDests] = useState([])
    const [spenderTypes, setSpenderTypes] = useState([])
    const [companions, setCompanions] = useState([])
    const [compSelected, setSelectedComps] = useState([])
    const [spenderTypeSelected, setSpenderTypeSelected] = useState("")
    const [transNum, setTransNum] = useState(0)
    const [accomsNum, setAccomsNum] = useState(0)
    const [foodpsNum, setFoodPsNum] = useState(0)
    const [attrsNum, setAttrsNum] = useState(0)

    //variables when showing preveiw of compiled vacation plan
    const [startDate, setStartDate] = useState("")
    const [endDate, setEndDate] = useState("")
    const [allTrans, setAllTrans] = useState([])
    const [allAccoms, setAllAccoms] = useState([])
    const [allFoodps, setAllFoodps] = useState([])
    const [allAttrs, setAllAttrs] = useState([])
    const [TransTypes, setTransTypes] = useState([])
    const [AccomTypes, setAccomTypes] = useState([])
    const [FoodpTypes, setFoodpTypes] = useState([])

    //variables determined by the API
    const [selectedTrans, setSelectedTrans] = useState([])
    const [selectedAccoms, setSelectedAccoms] = useState([])
    const [selectedFoodps, setSelectedFoodps] = useState([])
    const [selectedAttrs, setSelectedAttrs] = useState([])

    useEffect(() => {
        //Destinations
        var api_call = api + "Destinations/getDestinations"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setDestinations(await res.json()))

        //Spender types
        api_call = api + "LoginSignup/getSpenderTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setSpenderTypes(await res.json()))

        //Users (companions)
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
            setCompanions(data)
        })

        //Transportations
        api_call = api + "Destinations/getTransportations"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAllTrans(await res.json()))

        //Accommodations
        api_call = api + "Destinations/getAccommodations"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAllAccoms(await res.json()))

        //Food places
        api_call = api + "Destinations/getFoodPlaces"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAllFoodps(await res.json()))

        //Attractions
        api_call = api + "Destinations/getAttractions"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAllAttrs(await res.json()))

        //Transportation types
        api_call = api + "Destinations/getTransportationTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setTransTypes(await res.json()))

        //Accommodation types
        api_call = api + "Destinations/getAccommodationTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAccomTypes(await res.json()))

        //Food place types
        api_call = api + "Destinations/getFoodPlaceTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setFoodpTypes(await res.json()))
    }, [])

    const addToSelectedDest = () => {
        setDestError("")
        const destToFind = destinations.find(d => d.destName == destRef.current.value)

        if (destToFind != undefined && !destSelected.includes(destToFind)) {
            setSelectedDests([...destSelected, destToFind])
            destRef.current.value = ""
        }
    }

    const removeSelectedDest = (del) => {
        setSelectedDests([...destSelected.filter(dest => dest != del)])
    }

    const addToSelectedComps = () => {
        const compToFind = companions.find(c => c.userName == compRef.current.value)

        if (compToFind != undefined && !compSelected.includes(compToFind)) {
            setSelectedComps([...compSelected, compToFind])
            compRef.current.value = ""
        }
    }

    const removeSelectedComp = (del) => {
        setSelectedComps([...compSelected.filter(dest => dest != del)])
    }

    const nextSection = () => {
        setDateError("")
        setSpenderError("")
        setDestError("")
        const today = new Date(formatDate(new Date))

        if (destSelected.length == 0) {
            setDestError("Please select at least one destination")
        } else if (startDate < today || endDate < today) {
            setDateError("Dates should be today onwards")
        } else if (startDate > endDate) {
            setDateError("Start date must be before end date")
        } else if (spenderTypeSelected == "") {
            setSpenderError("Please select type of spender")
        } else if (destSelected.length != 0 &&
            startDate != "" &&
            endDate != "" &&
            spenderTypeSelected != ""
        ) {
            setSection(2)
        }
    }

    const stopReload = (event) => {
        //to stop the form from reloading when submitting
        event.preventDefault()
    }

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

    return (
        <>
            <Header />

            <div className="container">
                <form className="add-plan-form" onSubmit={stopReload}>
                    {section == 1 ?
                        <>
                            <h2>Vacation plan creation</h2>
                            <div>
                                <label>Search for destination</label>
                                <input ref={destRef} placeholder="select destination(s)" type="select" list="list" onSelect={() => addToSelectedDest()}  ></input>
                                <datalist id="list">
                                    {destinations.map((dest, idx) => {
                                        return <option key={dest.destId} value={dest.destName}  >{dest.destName}</option>
                                    })}
                                </datalist>
                                {destSelected.length != 0 ?
                                    destSelected.map((dest, idx) => {
                                        return <button key={idx} className="dest-selected" onClick={() => removeSelectedDest(dest)} type="button">{dest.destName} x</button>
                                    }) :
                                    <></>
                                }
                                {destError != "" ?
                                    <p className="error-msg" style={{ margin: "0px", marginBottom: "8px" }}>{destError}</p> :
                                    <></>
                                }

                                <label>Start date</label>
                                <input placeholder="select start vacation date" type="date" value={formatDate(startDate)} onChange={(e) => setStartDate(e.target.valueAsDate)} required></input>
                                
                                <label>End date</label>
                                <input placeholder="select end vacation date" type="date" value={formatDate(endDate)} onChange={(e) => setEndDate(e.target.valueAsDate)} required></input>
                                {dateError != "" ?
                                    <p className="error-msg" style={{ margin: "0px", marginBottom: "8px" }}>{dateError}</p> :
                                    <></>
                                }

                                <label>Type of spender</label>
                                <select placeholder="select type of spender" type="select" value={spenderTypeSelected} onChange={(e) => setSpenderTypeSelected(e.target.value)} required>
                                    <option value={""}>Select the type of spender you are</option>
                                    {spenderTypes.map((type, idx) => {
                                        return <option key={type.spenderTypeId} value={type.spenderTypeName}>{type.spenderTypeName}</option>
                                    })}
                                </select>
                                {spenderError != "" ?
                                    <p className="error-msg" style={{ margin: "0px", marginBottom: "8px" }}>{spenderError}</p> :
                                    <></>
                                }

                                <label>Search for companions</label>
                                <input ref={compRef} placeholder="select travel companions" list="companions" onSelect={() => addToSelectedComps()}></input>
                                <datalist id="companions">
                                    {companions.map((comp, idx) => {
                                        return <option key={comp.userId} value={comp.userName} >{comp.userName}</option>
                                    })}
                                </datalist>
                                {
                                    compSelected.map((comp, idx) => {
                                        return <button key={comp.userId} className="dest-selected" onClick={() => removeSelectedComp(comp)} type="button">{comp.userName} x</button>
                                    })
                                }

                                <label>Number of transportations</label>
                                <input type="number" placeholder="enter number of transportations" min="0" value={transNum} onChange={(e) => setTransNum(e.target.value)}></input>
                                
                                <label>Number of accommodations</label>
                                <input type="number" placeholder="enter number of accommodations" min="0" value={accomsNum} onChange={(e) => setAccomsNum(e.target.value)}></input>
                                
                                <label>Number of food places</label>
                                <input type="number" placeholder="enter number of food places" min="0" value={foodpsNum} onChange={(e) => setFoodPsNum(e.target.value)}></input>
                                
                                <label>Number of attractions</label>
                                <input type="number" placeholder="enter number of attractions" min="0" value={attrsNum} onChange={(e) => setAttrsNum(e.target.value)}></input>
                            </div>
                            
                            <button onClick={nextSection} type="button">Next</button>
                        </>
                        :
                        
                        //The other section here
                        <div className="preview-plan">
                            <div className="preview-plan-form-left">
                                <div className="preview-plan-nav">
                                    <div onClick={() => setNavSelected("Preview")}>Preview</div>
                                    <div onClick={() => setNavSelected("Transportations")}>Transportations</div>
                                    <div onClick={() => setNavSelected("Accommodations")}>Accommodations</div>
                                    <div onClick={() => setNavSelected("Food places")}>Food places</div>
                                    <div onClick={() => setNavSelected("Attractions")}>Attractions</div>
                                </div>

                                <div>
                                    <button>Save</button>
                                </div>
                            </div>

                            <div className="preview-plan-form-right">
                                {navSelected == "Preview" ?
                                    <div className="preview">
                                        <div>
                                            <h3>Vacation plan: {navSelected}</h3>
                                            <div className="preview-details">
                                                <p>Destination(s): {destSelected.map((d, idx) => {
                                                    if (idx != destSelected.length - 1)
                                                        return d.destName + ", "
                                                    else
                                                        return d.destName

                                                })}</p>
                                                <p>Start date: {formatDate2(startDate)}</p>
                                                <p>End date: {formatDate2(endDate)}</p>
                                                <p>No of travel companion: {compSelected.length}</p>
                                                <p>Transportaions: {transNum}</p>
                                                <p>Accommodations: {accomsNum}</p>
                                                <p>Food places: {foodpsNum}</p>
                                                <p>Attractions: {attrsNum} </p>
                                            </div>
                                        </div>
                                        <div className="preview-budget">
                                            <h3>Total estimated budget:</h3>
                                            <button onClick={() => setSection(1)}>Edit</button>
                                        </div>

                                    </div>

                                    :
                                    <></>
                                }

                                {navSelected == "Transportations" ?
                                    <div className="preview">
                                        <h3>Vacation plan: {navSelected}</h3>
                                        <div className="cards-selection">
                                            {allTrans.length != 0 ?
                                                allTrans.map((trans, idx) => {
                                                    return <div onClick={() => console.log(trans)} key={idx} className="card">
                                                        <img src="\src\assets\transportation.png" alt="transportation image"></img>
                                                        <div>
                                                            <h4>{trans.transpName}</h4>
                                                            <p>Price</p>
                                                        </div>

                                                        <div>
                                                            <p>{destinations.find(d => d.destId == trans.destId).destName}</p>
                                                            <p>Type: {TransTypes.find(t => t.transpTypeId == trans.transpTypeId).transpTypeName}</p>
                                                        </div>

                                                    </div>
                                                }) :
                                                <p>No transportations</p>
                                            }
                                        </div>

                                        <div className="preview-budget">
                                            <h3>Transportation budget:</h3>
                                            <button onClick={() => setSection(1)}>Edit</button>
                                        </div>
                                    </div>

                                    :
                                    <></>
                                }

                                {navSelected == "Accommodations" ?
                                    <div className="preview">
                                        <h3>Vacation plan: {navSelected}</h3>
                                        <div className="cards-selection">
                                            {allAccoms.length != 0 ?
                                                allAccoms.map((accomm, idx) => {
                                                    return <div onClick={() => console.log(accomm)} key={idx} className="card">
                                                        <img src="\src\assets\accommodation.png" alt="transportation image"></img>
                                                        <div>
                                                            <h4>{accomm.accName}</h4>
                                                            <p>Price</p>
                                                        </div>

                                                        <div>
                                                            <p>{accomm.accAddress}</p>
                                                            <p>Type: {AccomTypes.find(a => a.accTypeId == accomm.accTypeId).accTypeName}</p>
                                                            <p>No. of people: {accomm.accMaxNumOfPeople}</p>
                                                        </div>

                                                    </div>

                                                }) :
                                                <p>No Acoommodations</p>
                                            }
                                        </div>

                                        <div className="preview-budget">
                                            <h3>Accommodation budget:</h3>
                                            <button onClick={() => setSection(1)}>Edit</button>
                                        </div>

                                    </div>

                                    :
                                    <></>
                                }

                                {navSelected == "Food places" ?
                                    <div className="preview">
                                        <h3>Vacation plan: {navSelected}</h3>
                                        <div className="cards-selection">
                                            {allFoodps.length != 0 ?
                                                allFoodps.map((foodp, idx) => {
                                                    return <div onClick={() => console.log(foodp)} key={idx} className="card">
                                                        <img src="\src\assets\food places.png" alt="transportation image"></img>
                                                        <div>
                                                            <h4>{foodp.foodpName}</h4>
                                                            <p>Price</p>
                                                        </div>

                                                        <div>
                                                            <p>{foodp.foodpAddress}</p>
                                                            <p>Type: {FoodpTypes.find(f => f.foodpTypeId == foodp.foodpTypeId).foodpTypeName}</p>
                                                            <p>Menu items: {foodp.foodpMenuItems}</p>
                                                            <p>Rating: {foodp.foodpRating}</p>
                                                        </div>

                                                    </div>
                                                }) :
                                                <p>No food places</p>
                                            }
                                        </div>

                                        <div className="preview-budget">
                                            <h3>Food places budget:</h3>
                                            <button onClick={() => setSection(1)}>Edit</button>
                                        </div>
                                    </div>

                                    :
                                    <></>
                                }

                                {navSelected == "Attractions" ?
                                    <div className="preview">
                                        <h3>Vacation plan: {navSelected}</h3>
                                        <div className="cards-selection">
                                            {allAttrs.length != 0 ?
                                                allAttrs.map((attr, idx) => {
                                                    return <div onClick={() => console.log(attr)} key={idx} className="card">
                                                        <img src="\src\assets\attraction.png" alt="transportation image"></img>
                                                        <div>
                                                            <h4>{attr.attrName}</h4>
                                                            <p>Price</p>
                                                        </div>

                                                        <div>
                                                            <p>{attr.attrAddress}</p>
                                                        </div>

                                                    </div>
                                                }) :
                                                <p>No attractions</p>
                                            }
                                        </div>

                                        <div className="preview-budget">
                                            <h3>Attractions budget:</h3>
                                            <button onClick={() => setSection(1)}>Edit</button>
                                        </div>
                                    </div>

                                    :
                                    <></>
                                }

                            </div>

                            
                        </div>
                    }

                </form>


            </div>

            <Footer />
        </>
    )
}

export default AddPlan