import { useRef, useState } from "react"
import Footer from "../Footer"
import Header from "../Header"

function AddPlan() {
    const startDateRef = useRef(Date.now)
    const endDateRef = useRef(Date.now)
    const spenderTypeRef = useRef("")
    const [destError, setDestError] = useState("")
    const [dateError, setDateError] = useState("")

    const destinations = ["South Africa", "Japan", "South Korea"]
    const [destSelected, setSelectedDests] = useState([])
    const spenderTypes = ["low", "medium", "high"]
    const companions = ["friend 1", "friend 2", "friend 3"]
    const [compSelected, setSelectedComps] = useState([])

    const addToSelectedDest = (e) => { 
        setDestError("")
        if(!destSelected.includes(e.currentTarget.value)){
            setSelectedDests([...destSelected, e.currentTarget.value])    
        }
    }

    const removeSelectedDest = (del) => {
        setSelectedDests([...destSelected.filter(dest => dest != del)]) 
    }

    const addToSelectedComps = (e) => { 
        if(!compSelected.includes(e.currentTarget.value)){
            setSelectedComps([...compSelected, e.currentTarget.value])    
        }
    }

    const removeSelectedComp = (del) => {
        setSelectedComps([...compSelected.filter(dest => dest != del)]) 
    }

    const nextStep = () => {
        const start = new Date(startDateRef.current.value).getTime()
        const end = new Date(endDateRef.current.value).getTime()
        setDateError("")

        if(destSelected.length == 0){
            setDestError("Please select at least one destination")
        }else if(start > end){
            setDateError("Start date must be before end date")
        }else if(destSelected.length != 0 &&
            startDateRef.current.value != "" &&
            endDateRef.current.value != "" &&
            spenderTypeRef.currentTarget.value != ""
        ){

        }
    }

    const stopReload = (event) => {
        //to stop the form from reloading when submitting
        event.preventDefault()
    }

    return (
        <>
            <Header />

            <div className="add-plan-container">
                <div className="plan-form">
                    <div className="plan-form-left">
                        <h2>Vacation plan 1</h2>
                        <div>
                            <img src="\src\assets\destination on map.png" alt="destination image"></img>
                        </div>
                    </div>

                    <form className="plan-form-right" >
                        <div onSubmit={stopReload}>
                            <input placeholder="select destination(s)" type="select" list="list" value={""} onChange={e => addToSelectedDest(e)}></input>
                            <datalist id="list">
                                {destinations.map((dest, idx) => {
                                    return <option key={idx} value={dest} >{dest}</option>
                                })}
                            </datalist>
                            {   destSelected.length != 0 ?
                                destSelected.map((dest, idx) => {
                                    return <button className="dest-selected" onClick={() => removeSelectedDest(dest)} type="button">{dest} x</button>
                                }):
                                <p className="error-msg" style={{margin:"0px", marginBottom:"8px"}}>{destError}</p>
                            }

                            <input placeholder="select start vacation date" type="date" ref={startDateRef} required></input>
                            <input placeholder="select end vacation date" type="date" ref={endDateRef} required></input>
                            {setDateError != "" ?
                                <p className="error-msg" style={{margin:"0px", marginBottom:"8px"}}>{dateError}</p>:
                                <></>
                            }
                            
                            <select placeholder="select type of spender" type="select" ref={spenderTypeRef}  required>
                                <option value={""}>Select the type of spender you are</option>
                                {spenderTypes.map((type, idx) => {
                                    return <option key={idx} value={type}>{type}</option>
                                })}
                            </select>

                            <input placeholder="select travel companions" list="companions" value={""} onChange={e => addToSelectedComps(e)}></input>
                            <datalist id="companions">
                                {companions.map((comp, idx) => {
                                    return <option key={idx} value={comp} >{comp}</option>
                                })}
                            </datalist>
                            {
                                compSelected.map((comp, idx) => {
                                    return <button className="dest-selected" onClick={() => removeSelectedComp(comp)} type="button">{comp} x</button>
                                })
                            }
                        </div>

                        <div className="buttom-div">
                            <button className="plan-form-button" onClick={nextStep}>Next</button>
                        </div>
                        
                    </form>

                </div>
            </div>

            <Footer />
        </>
    )
}

export default AddPlan