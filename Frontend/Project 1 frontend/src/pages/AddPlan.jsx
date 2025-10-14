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
        }).then(async res => setDestinations( await res.json()))

        //Spender types
        api_call = api + "LoginSignup/getSpenderTypes"
        fetch(api_call, {
            method: "GET",
            headers: { 
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setSpenderTypes( await res.json()))

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
        }).then(async res => setAllTrans( await res.json()))

        //Accommodations
        api_call = api + "Destinations/getAccommodations"
        fetch(api_call, {
            method: "GET",
            headers: { 
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAllAccoms( await res.json()))

        //Food places
        api_call = api + "Destinations/getFoodPlaces"
        fetch(api_call, {
            method: "GET",
            headers: { 
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAllFoodps( await res.json()))

        //Attractions
        api_call = api + "Destinations/getAttractions"
        fetch(api_call, {
            method: "GET",
            headers: { 
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAllAttrs( await res.json()))

        //Transportation types
        api_call = api + "Destinations/getTransportationTypes"
        fetch(api_call, {
            method: "GET",
            headers: { 
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setTransTypes( await res.json()))

        //Accommodation types
        api_call = api + "Destinations/getAccommodationTypes"
        fetch(api_call, {
            method: "GET",
            headers: { 
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setAccomTypes( await res.json()))

        //Food place types
        api_call = api + "Destinations/getFoodPlaceTypes"
        fetch(api_call, {
            method: "GET",
            headers: { 
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => setFoodpTypes( await res.json()))
    }, [])

    const addToSelectedDest = () => {
        setDestError("")
        const destToFind = destinations.find(d => d.destName == destRef.current.value)

        if(destToFind != undefined && !destSelected.includes(destToFind)) {
            setSelectedDests([...destSelected, destToFind])
            destRef.current.value = ""
        }
    }

    const removeSelectedDest = (del) => {
        setSelectedDests([...destSelected.filter(dest => dest != del)])
    }

    const addToSelectedComps = () => {
        const compToFind = companions.find(c => c.userName == compRef.current.value)

        if(compToFind != undefined && !compSelected.includes(compToFind)){
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
        } else if(startDate < today || endDate < today){
            setDateError("Dates should be today onwards")
        } else if (startDate > endDate) {
            setDateError("Start date must be before end date")
        } else if(spenderTypeSelected == ""){
            setSpenderError("Please select type of spender")
        } else if (destSelected.length != 0 &&
            startDate != "" &&
            endDate != "" &&
            spenderTypeSelected != ""
        ){
            setSection(2)
        }
    }

    const stopReload = (event) => {
        //to stop the form from reloading when submitting
        event.preventDefault()
    }

    const formatDate = (date) => {
        if(date != ""){ 
            const year = date.getFullYear()
            const month = date.getMonth() + 1
            const day = date.getDate()

            return year + "-" + month + "-" + (day < 10 ? "0" + day: day)
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

            <div className="add-plan-container">
                {section == 1 ?
                    <div className="plan-form">
                        <div className="plan-form-left">
                            <h2>Vacation plan 1</h2>
                            <div>
                                <img src="\src\assets\destination on map.png" alt="destination image"></img>
                            </div>
                        </div>

                        <form className="plan-form-right" >
                            <div onSubmit={stopReload}>
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
                                    <p className="error-msg" style={{ margin: "0px", marginBottom: "8px" }}>{destError}</p>
                                }

                                <input placeholder="select start vacation date" type="date" value={formatDate(startDate)}  onChange={(e) => setStartDate(e.target.valueAsDate)} required></input>
                                <input placeholder="select end vacation date" type="date" value={formatDate(endDate)}  onChange={(e) => setEndDate(e.target.valueAsDate)} required></input>
                                {dateError != "" ?
                                    <p className="error-msg" style={{ margin: "0px", marginBottom: "8px" }}>{dateError}</p> :
                                    <></>
                                }

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
                            </div>

                            <div className="buttom-div">
                                <button className="plan-form-button" onClick={nextSection} type="button">Next</button>
                            </div>

                        </form>

                    </div> :

                    <div className="plan-form">
                        <div className="plan-form-left" style={{ flexBasis: "60%" }}>

                            {navSelected == "Preview" ?
                                <div>
                                    <div className="preview-upper">
                                        <div className="preview-upper-left">
                                            <h3>Vacation plan: {navSelected}</h3>
                                            <img src="\src\assets\destination on map.png" alt="destination image"></img>
                                        </div>
                                        <div className="preview-upper-right">
                                            <p style={{float:"left"}}>Destination(s): {destSelected.map((d, idx) => {
                                                if(idx != destSelected.length - 1)
                                                    return d.destName + ", "
                                                else
                                                    return d.destName
                                                
                                                })}</p>
                                            <p>Start date: {formatDate2(startDate)}</p>
                                            <p>End date: {formatDate2(endDate)}</p>
                                            <p>No of travel companion: {compSelected.length}</p>
                                            <p>Transportaions: {selectedTrans.length}</p>
                                            <p>Accommodations: {selectedAccoms.length}</p>
                                            <p>Food places: {selectedFoodps.length}</p>
                                            <p>Attractions: {selectedAttrs.length} </p>
                                        </div>
                                    </div>
                                    <div className="preview-lower">
                                        <h3>Total estimated budget:</h3>
                                        <button onClick={() => setSection(1)}>Edit</button>
                                    </div>

                                </div>

                                :
                                <></>
                            }

                            {navSelected == "Transportations" ?
                                <div className="cards-view">
                                    <h3>Vacation plan: {navSelected}</h3>
                                    <div className="cards-selection">
                                        {allTrans.length != 0 ?
                                            allTrans.map((trans, idx) =>{
                                                return <div onClick={() => console.log(trans)} key={idx} className="card-showcase">
                                                    <img src="\src\assets\transportation.png" alt="transportation image"></img>
                                                    <div className="card-showcase-info">
                                                        <p className="card-showcase-title">{trans.transpName}</p>                                                    
                                                        <p className="card-showcase-price">Price</p> 
                                                    </div>

                                                    <div className="card-showcase-more-info">
                                                        <p>{destinations.find(d => d.destId == trans.destId).destName}</p>
                                                        <p>Type: {TransTypes.find(t => t.transpTypeId == trans.transpTypeId).transpTypeName}</p>
                                                    </div>
                                                                                                        
                                                </div>
                                            }):
                                            <p>No transportations</p>
                                        }
                                    </div>
                                    <div>
                                        <h3>Transportation budget:</h3>
                                    </div>

                                </div>

                                :
                                <></>
                            }

                            {navSelected == "Accommodations" ?
                                <div className="cards-view">
                                    <h3>Vacation plan: {navSelected}</h3>
                                    <div className="cards-selection">
                                        {allAccoms.length != 0 ?
                                            allAccoms.map((accomm, idx) =>{
                                                return <div onClick={() => console.log(accomm)} key={idx} className="card-showcase">
                                                    <img src="\src\assets\accommodation.png" alt="transportation image"></img>
                                                    <div className="card-showcase-info">
                                                        <p className="card-showcase-title">{accomm.accName}</p>                                                    
                                                        <p className="card-showcase-price">Price</p> 
                                                    </div>

                                                    <div className="card-showcase-more-info">
                                                        <p>{accomm.accAddress}</p>
                                                        <p>Type: {AccomTypes.find(a => a.accTypeId == accomm.accTypeId).accTypeName}</p>
                                                        <p>No. of people: {accomm.accMaxNumOfPeople}</p>
                                                    </div>
                                                                                                        
                                                </div>
                                    
                                            }):
                                            <p>No Acoommodations</p>
                                        }
                                    </div>
                                    <div>
                                        <h3>Accommodation budget:</h3>
                                    </div>

                                </div>

                                :
                                <></>
                            }

                            {navSelected == "Food places" ?
                                <div className="cards-view">
                                    <h3>Vacation plan: {navSelected}</h3>
                                    <div className="cards-selection">
                                        {allFoodps.length != 0 ?
                                            allFoodps.map((foodp, idx) =>{
                                                return <div onClick={() => console.log(foodp)} key={idx} className="card-showcase">
                                                        <img src="\src\assets\food places.png" alt="transportation image"></img>
                                                        <div className="card-showcase-info">
                                                            <p className="card-showcase-title">{foodp.foodpName}</p>                                                    
                                                            <p className="card-showcase-price">Price</p> 
                                                        </div>

                                                        <div className="card-showcase-more-info">
                                                            <p>{foodp.foodpAddress}</p>
                                                            <p>Type: {FoodpTypes.find(f => f.foodpTypeId == foodp.foodpTypeId).foodpTypeName}</p>
                                                            <p>Menu items: {foodp.foodpMenuItems}</p>
                                                            <p>Rating: {foodp.foodpRating}</p>
                                                        </div>
                                                                                                            
                                                    </div>
                                            }):
                                            <p>No food places</p>
                                        }
                                    </div>
                                    <div>
                                        <h3>Food places budget:</h3>
                                    </div>

                                </div>

                                :
                                <></>
                            }

                            {navSelected == "Attractions" ?
                                <div className="cards-view">
                                    <h3>Vacation plan: {navSelected}</h3>
                                    <div className="cards-selection">
                                        {allAttrs.length != 0 ?
                                            allAttrs.map((attr, idx) =>{
                                                return <div onClick={() => console.log(attr)} key={idx} className="card-showcase">
                                                    <img src="\src\assets\attraction.png" alt="transportation image"></img>
                                                    <div className="card-showcase-info">
                                                        <p className="card-showcase-title">{attr.attrName}</p>                                                    
                                                        <p className="card-showcase-price">Price</p> 
                                                    </div>

                                                    <div className="card-showcase-more-info">
                                                        <p>{attr.attrAddress}</p>
                                                    </div>
                                                                                                        
                                                </div>
                                            }):
                                            <p>No attractions</p>
                                        }
                                    </div>
                                    <div>
                                        <h3>Attractions budget:</h3>
                                    </div>

                                </div>

                                :
                                <></>
                            }
                        </div>

                        <div className="plan-form-right" style={{ flexBasis: "30%" }}>
                            <div className="nav-upper">
                                <div onClick={() => setNavSelected("Preview")}>Preview</div>
                                <div onClick={() => setNavSelected("Transportations")}>Transportations</div>
                                <div onClick={() => setNavSelected("Accommodations")}>Accommodations</div>
                                <div onClick={() => setNavSelected("Food places")}>Food places</div>
                                <div onClick={() => setNavSelected("Attractions")}>Attractions</div>
                            </div>

                            <div className="nav-lower">
                                <button>Save</button>
                            </div>
                        </div>
                    </div>
                }

            </div>

            <Footer />
        </>
    )
}

export default AddPlan