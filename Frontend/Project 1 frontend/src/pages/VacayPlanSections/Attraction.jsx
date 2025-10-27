import { useContext, useEffect, useState } from "react"
import { MyContext } from "../../MyProvider"
import { Rating } from "react-simple-star-rating"
import { BiCheckCircle } from "react-icons/bi"
import { useNavigate } from "react-router-dom"
import Loading from "../../Loading"

function Attraction() {
    const [attractions, setAttractions] = useState([])
    const [suggestedAttractions, setSuggestedAttractions] = useState([])
    const [spenderTypes, setSpenderTypes] = useState([])
    const {
        api,
        token,
        user,
        currency,
        startDate, endDate,
        selectedSpenderType,
        selectedDestination,
        selectedAttractions,
        setSelectedAttractions,
        attrsList, setAttrsList,
        attrsTotal, setAttrsTotal,
        selectedBuddies
    } = useContext(MyContext)
    const navigate = useNavigate()
    const [isLoading, setIsLoading] = useState(true);
    const [filter, setFilter] = useState(1)

    useEffect(() => {
        //Attractions
        if (attractions.length == 0) {
            var api_call = api + "Destinations/getAttractions?destId=" + selectedDestination.destinationId + "&currencyId= " + user.currencyId
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
                
                setAttractions(await res.json())
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
                    var api_call = api + "Destinations/getSuggestedAttraction?spenderTypeId=" + selectedSpenderType.spenderTypeId + "&destinationId= " + selectedDestination.destinationId
                    fetch(api_call, {
                        method: "GET",
                        headers: {
                            "Authorization": "Bearer " + token,
                            "Content-Type": "application/json"
                        },
                    }).then(async res => setSuggestedAttractions(await res.json()))
                    setIsLoading(false)
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

        if (selectedAttractions.length != attrsList.length) {
            alert("make sure that you filled in the details for the selected sttractions")
        } else {
            attrsList.forEach(i => {
                var errorElement = document.getElementById("a" + i.attr.attractionId)
                if (i.num == undefined || i.num == "") {
                    inputEntered = false
                    errorElement.textContent = "Please enter the number of times you'll experience " + i.attr.attractionName
                } else {
                    errorElement.textContent = ""
                }
            })

            if (inputEntered) {
                //Total attractions
                var api_call = api + "Destinations/getAttrsTotal?start=" + formatDate(startDate) + "&end=" + formatDate(endDate) + "&numOfPeople=" + (selectedBuddies.length + 1)
                fetch(api_call, {
                    method: "POST",
                    headers: {
                        "Authorization": "Bearer " + token,
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(attrsList)
                }).then(async res => {
                    setAttrsTotal(await res.json())
                    navigate('/vacayPlan/preview')
                })
            }
        }
    }

    const back = () => {
        navigate(-1)
    }

    const addTheSelectedAttraction = (attr) => {
        const isSelected = selectedAttractions.find(ac => ac.attractionId == attr.attractionId) != undefined

        if (isSelected) {
            //attraction has been selected, remove it from the list
            setSelectedAttractions([...selectedAttractions.filter(a => a.attractionId != attr.attractionId)])
            setAttrsList([...attrsList.filter(a => a.attr.attractionId != attr.attractionId)])
        } else {
            //attraction has not been selected, add it from the list
            setSelectedAttractions([...selectedAttractions, attr])
        }
    }

    const determineClassName = (a) => {
        if (selectedAttractions.length != 0) {
            if (selectedAttractions.find(attr => attr.attractionId == a.attractionId)) {
                return "selected-card-ui"
            } else {
                return "card-ui"
            }
        } else {
            return "card-ui"
        }
    }

    const setTimes = (attr, useType, num) => {
        if (useType != 0) {
            var item = {
                attr: attr,
                useType: useType,
                num: num
            }

            var isFound = attrsList.find(item => item.attr.attractionId == attr.attractionId) == undefined
            if (isFound) {
                //Add to list
                setAttrsList([...attrsList, item])
            } else {
                //Update list
                setAttrsList([...attrsList.filter(item => item.attr.attractionId != attr.attractionId), item])
            }
        }
    }

    const filterItems = (filter) => {
        if (filter == 2) {
            setAttractions(attractions.sort((a, b) => a.attractionEntranceFee - b.attractionEntranceFee))
        } else if (filter == 3) {
            setAttractions(attractions.sort((a, b) => b.attractionEntranceFee - a.attractionEntranceFee))
        } else if (filter == 4) {
            setAttractions(attractions.sort((a, b) => b.attractionRating - a.attractionRating))
        }
        setFilter(filter)
    }

    return (
        <>
            <div>
                <h2>Select attractions from {selectedDestination.destinationName}</h2>

                <select value={filter} onChange={(e) => filterItems(e.target.value)}>
                    <option value={1}>Filter by:</option>
                    <option value={2}>Lowest - highest</option>
                    <option value={3}>Highest - lowest</option>
                    <option value={4}>Rating</option>
                </select>

                <div className="cards-section">
                    {attractions.length.length != 0 ?
                        attractions.map((a, idx) => {
                            var isFound = suggestedAttractions.find(ac => ac.attractionId == a.attractionId) != undefined

                            return <div key={idx} className={determineClassName(a)} onClick={() => addTheSelectedAttraction(a)}>
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
                                <p className="card-title">{a.attractionName}</p>
                                <p className="card-subtitle">{a.attractionAddress}</p>
                                <p>{currency.currencySymbol} {a.attractionEntranceFee} entrance fee</p>
                                <p>Is it time limited: {a.attractionTimeLimited == 1 ? "yes" : "no"} </p>
                                <p>{a.attractionDescription}</p>
                            </div>

                        }) :
                        <p>no accommodations</p>
                    }

                </div>


            </div>

            <div className="more-details">
                <h3>Fill in details below</h3>
                {selectedAttractions.length != 0 ?

                    <>
                        {
                            selectedAttractions.map((a, idx) => {
                                var item = attrsList.find(i => i.attr.attractionId == a.attractionId)
                                return <div key={idx}>
                                    <p className="card-title">{a.attractionName}</p>
                                    <label>Type of use for attraction expereince:</label>
                                    <select value={item != undefined ? item.useType : 0} onChange={(e) => setTimes(a, e.target.value, undefined)}>
                                        <option value={0}>How many times will you expereince this attraction</option>
                                        <option value={1}>Limited throughout the trip</option>
                                        <option value={2}>Every day of the trip</option>
                                    </select>

                                    <label>Specify the number of times it will be experienced:</label>
                                    <input type="number" min={0} value={item != undefined ? item.num : ""} onChange={(e) => setTimes(a, item.useType, e.target.value)}></input>
                                    <p className="error-msg" id={"a" + a.attractionId} style={{ margin: "0px", marginBottom: "8px" }}></p>

                                </div>
                            })
                        }

                    </>

                    : <p>No attractions selected</p>
                }
            </div>

            <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                <button onClick={back} type="button">Back</button>
                <button onClick={next} type="button">Next</button>
            </div>

        </>
    )

}

export default Attraction