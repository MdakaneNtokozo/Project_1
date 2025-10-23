import { useContext, useEffect, useState } from "react"
import { MyContext } from "../../MyProvider";
import { useNavigate } from "react-router-dom";
import DatePicker from "react-multi-date-picker";
import { FaSearch } from "react-icons/fa";
import Loading from "../../Loading";

function VacayDetails() {

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
    const [hasTravelBuddies, setHasTravelBuddies] = useState(selectedBuddies.length == 0 ? "false" : "true")
    const [users, setUsers] = useState([])

    const [dateError, setDateError] = useState("")
    const [spenderError, setSpenderError] = useState("")
    const [buddyError, setBuddyError] = useState("")

    const navigate = useNavigate()
    const [loading1, setLoading1] = useState(true)
    const [loading2, setLoading2] = useState(true)
    const [loading3, setLoading3] = useState(true)

    useEffect(() => {
        //Spender types
        var api_call = api + "LoginSignup/getSpenderTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            if (res.ok) {
                setSpenderTypes(await res.json())

                //Users (travel buddies)
                api_call = api + "LoginSignup/users"
                fetch(api_call, {
                    method: "GET",
                    headers: {
                        "Authorization": "Bearer " + token,
                        "Content-Type": "application/json"
                    },
                }).then(async res => {
                    if (res.ok) {
                        var data = await res.json()
                        data = data.filter(u => u.userId != user.userId)
                        setUsers(data)
                    }
                })

                setLoading1(false)
            } else if (res.status == 401) {
                console.log("unauthorized")
                navigate('/home')
            }
        })

    }, [])

    while (loading1 == true) {
        return <Loading />
    }

    const formatDate = (date) => {
        if (date == null) {
            return ""
        } else {
            var date = new Date(date)
            if (date != "") {
                const year = date.getFullYear()
                const month = date.getMonth() + 1
                const day = date.getDate()

                return year + "-" + month + "-" + (day < 10 ? "0" + day : day)
            }
        }
    }

    const allowNext = () => {
        setDateError("")
        setSpenderError("")
        setBuddyError("")
        const today = new Date(formatDate(new Date()))
        today.setHours(0)
        const start = new Date(startDate)
        const end = new Date(endDate)

        if (startDate == undefined && endDate == undefined) {
            setDateError("Select start and end dates")
        } else if (start < today || end < today) {
            setDateError("Dates should be today onwards")
        } else if (selectedSpenderType == null) {
            setSpenderError("Please select type of spender")
        } else if (hasTravelBuddies == "") {
            setBuddyError("Select whether you are traveling alone or with others")
        }
        else if (hasTravelBuddies == "true" && selectedBuddies.length == 0) {
            setBuddyError("Select buddies who will travel with you")
        } else {
            navigate('/vacayPlan/transportation')
        }
    }

    const back = () => {
        navigate(-1)
    }

    const addSelectedSpenderType = (e) => {
        var spenderType = spenderTypes.find(t => t.spenderTypeName == e.target.value)
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
        setSelectedBuddies([...selectedBuddies.filter(b => b.userId != user.userId)])

    }

    const setDates = (dates) => {
        if (dates.length == 2) {
            setStartDate(dates[0])
            setEndDate(dates[1])
        }
    }

    return (
        <>
            {spenderTypes.length != 0 ?
                <div className="adding-details-container">
                    <div>
                        <h2>Vacation plan creation for {selectedDestination.destinationName}</h2>

                        <label>Select date range</label><br />
                        <DatePicker mode="range" range value={[formatDate(startDate), formatDate(endDate)]} onChange={(dates) => setDates(dates)} className="date-picker"></DatePicker><br />
                        {dateError != "" ?
                            <p className="error-msg" style={{ margin: "0px", marginBottom: "8px" }}>{dateError}</p> :
                            <></>
                        }

                        <label>What type of spender are you?</label>
                        <select placeholder="What type of spender are you?" value={selectedSpenderType != undefined ? selectedSpenderType.spenderTypeName : ""} onChange={(e) => addSelectedSpenderType(e)} required>
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

                                <div className="search">
                                    <FaSearch className="search-icon" />
                                    <input placeholder="Search for travel companions" list="companions" onSelect={(e) => {
                                        addTheSelectedTravelBuddies(e)
                                        setBuddyError("")
                                    }}></input>
                                </div>

                                <datalist id="companions">
                                    {users.map((u) => {
                                        return <option key={u.userId} value={u.userName} >{u.userName} {u.userSurname}</option>
                                    })}
                                </datalist>
                                <div className="buddies-container">
                                    {selectedBuddies.length != 0 ?
                                        <>
                                            {selectedBuddies.map((b, idx) => {
                                                return <div key={idx} className="buddy-card" >
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
                <Loading />

            }

        </>

    );
}

export default VacayDetails