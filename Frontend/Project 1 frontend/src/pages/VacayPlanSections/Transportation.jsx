import { useContext, useEffect, useState } from "react"
import { MyContext } from "../../MyProvider"
import { Rating } from "react-simple-star-rating"
import { BiCheckCircle } from "react-icons/bi"
import { useNavigate } from "react-router-dom"
import Loading from "../../Loading"

function Transportation() {

    const [transportations, setTransportations] = useState([])
    const [transportationTypes, setTransportationTypes] = useState([])
    const [suggestedTransportations, setSuggestedTransportations] = useState([])
    const [spenderTypes, setSpenderTypes] = useState([])
    const {
        api,
        token,
        user,
        currency,
        startDate, endDate,
        selectedSpenderType,
        selectedDestination,
        selectedTransportation,
        setSelectedTransportations,
        transList, setTransList,
        transTotal, setTransTotal,
        selectedBuddies
    } = useContext(MyContext)
    const [filter, setFilter] = useState(1)
    const navigate = useNavigate()
    const [isLoading, setIsLoading] = useState(true)

    useEffect(() => {
        //Transportations
        var api_call = api + "Destinations/getTransportations?destId=" + selectedDestination.destinationId + "&currencyId= " + user.currencyId
        if (transportations.length == 0) {
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
                setTransportations(await res.json())
                //Transportation types
                api_call = api + "Destinations/getTransportationTypes"
                fetch(api_call, {
                    method: "GET",
                    headers: {
                        "Authorization": "Bearer " + token,
                        "Content-Type": "application/json"
                    },
                }).then(async res => {
                    setTransportationTypes(await res.json())

                    //Spender types
                    api_call = api + "LoginSignup/getSpenderTypes"
                    fetch(api_call, {
                        method: "GET",
                        headers: {
                            "Authorization": "Bearer " + token,
                            "Content-Type": "application/json"
                        },
                    }).then(async res => {
                        setSpenderTypes(await res.json())

                        api_call = api + "Destinations/getSuggestedTransportation?spenderTypeId=" + selectedSpenderType.spenderTypeId + "&destinationId= " + selectedDestination.destinationId
                        fetch(api_call, {
                            method: "GET",
                            headers: {
                                "Authorization": "Bearer " + token,
                                "Content-Type": "application/json"
                            },
                        }).then(async res => {
                            setSuggestedTransportations(await res.json())
                            setIsLoading(false)
                        })

                    })
                })
            })
        }

    }, [filter])

    while (isLoading) {
        return <Loading />
    }

    const formatDate = (date) => {
        var date = new Date(date)

        if (date != undefined) {
            const year = date.getFullYear()
            const month = date.getMonth() + 1
            const day = date.getDate()

            return year + "-" + month + "-" + (day < 10 ? "0" + day : day)
        }
    }

    const next = () => {
        var inputEntered = true

        if (selectedTransportation.length != transList.length) {
            alert("make sure that you filled in the details for the selected transportation")
        } else {
            transList.forEach(i => {
                var errorElement = document.getElementById("t" + i.trans.transportationId)
                if (i.num == undefined || i.num == "") {
                    inputEntered = false
                    errorElement.textContent = "Please enter the number of times you'll use " + i.trans.transportationName
                } else {
                    errorElement.textContent = ""
                }
            })

            if (inputEntered) {
                //Total transportation
                var api_call = api + "Destinations/getTransTotal?start=" + formatDate(startDate) + "&end=" + formatDate(endDate) + "&numOfPeople=" + (selectedBuddies.length + 1)
                fetch(api_call, {
                    method: "POST",
                    headers: {
                        "Authorization": "Bearer " + token,
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(transList)
                }).then(async res => {
                    setTransTotal(await res.json())
                    navigate('/vacayPlan/accommodation')
                })
            }
        }
    }

    const back = () => {
        navigate(-1)
    }

    const addTheSelectedTransportation = (trans) => {
        const isSelected = selectedTransportation.find(tr => tr.transportationId == trans.transportationId) != undefined

        if (isSelected) {
            //transportation has been selected, remove it from the list
            setSelectedTransportations([...selectedTransportation.filter(tr => tr.transportationId != trans.transportationId)])
            setTransList([...transList.filter(t => t.trans.transportationId != trans.transportationId)])
        } else {
            //transportation has not been selected, add it from the list
            setSelectedTransportations([...selectedTransportation, trans])
        }
    }

    const determineClassName = (t) => {
        if (selectedTransportation.length != 0) {
            if (selectedTransportation.find(trans => trans.transportationId == t.transportationId)) {
                return "selected-card-ui"
            } else {
                return "card-ui"
            }
        } else {
            return "card-ui"
        }
    }

    const setTimes = (trans, useType, num) => {
        if (useType != 0) {
            var item = {
                trans: trans,
                useType: useType,
                num: num
            }

            var isFound = transList.find(item => item.trans == trans) == undefined
            if (isFound) {
                //Add to list
                setTransList([...transList, item])
            } else {
                //Update list
                setTransList([...transList.filter(item => item.trans != trans), item])
            }
        }
    }

    const filterItems = (filter) => {
        if (filter == 2) {
            setTransportations(transportations.sort((a, b) => a.transportationPricePerPerson - b.transportationPricePerPerson))
        } else if (filter == 3) {
            setTransportations(transportations.sort((a, b) => b.transportationPricePerPerson - a.transportationPricePerPerson))
        } else if (filter == 4) {
            setTransportations(transportations.sort((a, b) => b.transportationRating - a.transportationRating))
        }
        setFilter(filter)
    }

    return (
        <>
            <div>
                <h2>Select transportations from {selectedDestination.destinationName}</h2>

                <select value={filter} onChange={(e) => filterItems(e.target.value)}>
                    <option value={1}>Filter by:</option>
                    <option value={2}>Lowest - highest</option>
                    <option value={3}>Highest - lowest</option>
                    <option value={4}>Rating</option>
                </select>

                <div className="cards-section">
                    {transportations.length.length != 0 ?
                        transportations.map((t, idx) => {
                            var isFound = suggestedTransportations.find(tr => tr.transportationId == t.transportationId) != undefined

                            return <div key={idx} className={determineClassName(t)} onClick={() => addTheSelectedTransportation(t)}>
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
                                <p className="card-title">{t.transportationName}</p>
                                <p>{currency.currencySymbol} {t.transportationPricePerPerson} per person</p>
                                <p>{t.transportationMinPeople} - {t.transportationMaxPeople} people</p>
                                <p>{transportationTypes.find(type => type.transportationTypeId == t.transportationTypeId).transportationTypeName} </p>
                            </div>

                        }) :
                        <p>no destination</p>
                    }

                </div>


            </div>

            <div className="more-details">
                <h3>Fill in details below</h3>
                {selectedTransportation.length != 0 ?

                    <>
                        {
                            selectedTransportation.map((t, idx) => {
                                var item = transList.find(i => i.trans.transportationId == t.transportationId)

                                return <div key={idx}>
                                    <p className="card-title">{t.transportationName}</p>
                                    <label>Type of use for transportation:</label>
                                    <select value={item != undefined ? item.useType : 0} onChange={(e) => setTimes(t, e.target.value, undefined)}>
                                        <option value={0}>How many times will you use this transportation</option>
                                        <option value={1}>Limited throughout the trip</option>
                                        <option value={2}>Every day of the trip</option>
                                    </select>

                                    <label>Specify the number of times it will be used:</label>
                                    <input type="number" min={0} value={item != undefined ? item.num : ""} onChange={(e) => setTimes(t, item.useType, e.target.value)}></input>
                                    <p className="error-msg" id={"t" + t.transportationId} style={{ margin: "0px", marginBottom: "8px" }}></p>
                                </div>
                            })
                        }

                    </>

                    : <p>No transportations selected</p>
                }
            </div>

            <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                <button onClick={back} type="button">Back</button>
                <button onClick={next} type="button">Next</button>
            </div>
        </>
    )

}

export default Transportation