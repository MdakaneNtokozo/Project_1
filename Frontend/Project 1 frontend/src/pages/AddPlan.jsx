import { useRef, useState } from "react"
import Footer from "../Footer"
import Header from "../Header"

function AddPlan() {
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
    const destinations = ["South Africa", "Japan", "South Korea"]
    const [destSelected, setSelectedDests] = useState([])
    const spenderTypes = ["low", "medium", "high"]
    const companions = ["friend 1", "friend 2", "friend 3"]
    const [compSelected, setSelectedComps] = useState([])
    const [spenderTypeSelected, setSpenderTypeSelected] = useState("")

    //variables when showing preveiw of compiled vacation plan
    const [startDate, setStartDate] = useState("")
    const [endDate, setEndDate] = useState("")
    const [allTrans, setAllTrans] = useState(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'])
    const [allAccoms, setAllAccoms] = useState(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'])
    const [allFoodps, setAllFoodps] = useState(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'])
    const [allAttrs, setAllAttrs] = useState(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'])

    //variables determined by the API
    const [selectedTrans, setSelectedTrans] = useState([])
    const [selectedAccoms, setSelectedAccoms] = useState([])
    const [selectedFoodps, setSelectedFoodps] = useState([])
    const [selectedAttrs, setSelectedAttrs] = useState([])


    const addToSelectedDest = () => {
        setDestError("")
        if (!destSelected.includes(destRef.current.value) && 
            destinations.includes(destRef.current.value) &&
            destRef.current.value != "") {
            setSelectedDests([...destSelected, destRef.current.value])
            destRef.current.value = ""
        }
    }

    const removeSelectedDest = (del) => {
        setSelectedDests([...destSelected.filter(dest => dest != del)])
    }

    const addToSelectedComps = () => {
        if (!compSelected.includes(compRef.current.value) && 
            companions.includes(compRef.current.value) &&
            compRef.current.value != "") {
            setSelectedComps([...compSelected, compRef.current.value])
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

        if (destSelected.length == 0) {
            setDestError("Please select at least one destination")
        } else if (startDate > endDate) {
            setDateError("Start date must be before end date")
        } else if(spenderTypeSelected == ""){
            setSpenderError("Please select type of spender")
        }else if (destSelected.length != 0 &&
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

            return year + "-" + month + "-" + day
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
                                        return <option key={idx} value={dest}  >{dest}</option>
                                    })}
                                </datalist>
                                {destSelected.length != 0 ?
                                    destSelected.map((dest, idx) => {
                                        return <button key={idx} className="dest-selected" onClick={() => removeSelectedDest(dest)} type="button">{dest} x</button>
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
                                        return <option key={idx} value={type}>{type}</option>
                                    })}
                                </select>
                                {spenderError != "" ?
                                    <p className="error-msg" style={{ margin: "0px", marginBottom: "8px" }}>{spenderError}</p> :
                                    <></>
                                }

                                <input ref={compRef} placeholder="select travel companions" list="companions" onSelect={() => addToSelectedComps()}></input>
                                <datalist id="companions">
                                    {companions.map((comp, idx) => {
                                        return <option key={idx} value={comp} >{comp}</option>
                                    })}
                                </datalist>
                                {
                                    compSelected.map((comp, idx) => {
                                        return <button key={idx} className="dest-selected" onClick={() => removeSelectedComp(comp)} type="button">{comp} x</button>
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
                                            <p>Destination(s): {destSelected.toString()}</p>
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
                                                return <div onClick={() => console.log(trans)} key={idx}>
                                                    <p>Name: {trans}</p>
                                                    <p>destination: ...</p>
                                                    <p>Price: ... - ...</p>
                                                    <p>Type: ...</p>
                                                </div>
                                            }):
                                            <></>
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
                                                return <div key={idx} type="checkbox">
                                                    <p>Name: {accomm}</p>
                                                    <p>Address: ...</p>
                                                    <p>Price: ... - ...</p>
                                                    <p>Type: ...</p>
                                                    <p>No. or people: ...</p>
                                                </div>
                                            }):
                                            <></>
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
                                                return <div key={idx} type="checkbox">
                                                    <p>Name: {foodp}</p>
                                                    <p>Address: ...</p>
                                                    <p>Price: ... - ...</p>
                                                    <p>Type: ...</p>
                                                    <p>Menu items: ...</p>
                                                    <p>Rating: ...</p>
                                                </div>
                                            }):
                                            <></>
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
                                                return <div key={idx} type="checkbox">
                                                    <p>Name: {attr}</p>
                                                    <p>Address: ...</p>
                                                    <p>Price: ... - ...</p>
                                                </div>
                                            }):
                                            <></>
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