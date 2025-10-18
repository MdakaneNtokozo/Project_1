import { useContext, useEffect, useState } from "react"
import { MyContext } from "../MyProvider";
import { useNavigate } from "react-router-dom";

function AddDetails() {

    const { 
        api, 
        token,
        user,
        selectedDestination,
        startDate, setStartDate,
        endDate, setEndDate,
        selectedSpenderType, setSelectedSpenderType,
        selectedBuddies, setSelectedBuddies
    } = useContext(MyContext)

    const [spenderTypes, setSpenderTypes] = useState([])

    const [hasTravelBuddies, setHasTravelBuddies] = useState("")
    const [users, setUsers] = useState([])

    const [dateError, setDateError] = useState("")
    const [spenderError, setSpenderError] = useState("")
    const [buddyError, setBuddyError] = useState("")

    const navigate = useNavigate()

    useEffect(() => {
        //Spender types
        var api_call = api + "LoginSignup/getSpenderTypes"
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

    }, [])

    const formatDate = (date) => {
        if (date != "") {
            const year = date.getFullYear()
            const month = date.getMonth() + 1
            const day = date.getDate()

            return year + "-" + month + "-" + (day < 10 ? "0" + day : day)
        }
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
            navigate('/addVacayPlan/selectTrans')
        }
    }

    const back = () => {
        navigate(-1)
    }

    const addSelectedSpenderType = (e) => {
        var spenderType= spenderTypes.find(t => t.spenderTypeName == e.target.value)
        setSelectedSpenderType(spenderType)

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

    return (
        <>
            <div className="adding-details-container">
                <div>
                    <h2>Vacation plan creation for {selectedDestination.destinationName}</h2>
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
                    <select placeholder="What type of spender are you?" value={selectedSpenderType.spenderTypeName} onChange={(e) => addSelectedSpenderType(e)} required>
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
        </>

    );
}

export default AddDetails