import { useContext, useEffect, useState } from "react"
import { MyContext } from "../MyProvider"
import { Rating } from "react-simple-star-rating"
import { BiCheckCircle } from "react-icons/bi"
import { useNavigate } from "react-router-dom"

function SelectFoodSpot() {
    const [foodSpots, setFoodSpots] = useState([])
    const [foodSpotTypes, setFoodSpotTypes] = useState([])
    const [suggestedFoodSpots, setSuggestedFoodSpots] = useState([])
    const [spenderTypes, setSpenderTypes] = useState([])
    const {
        api,
        token,
        user,
        currency,
        startDate, endDate,
        selectedSpenderType,
        selectedDestination,
        selectedFoodSpots,
        setSelectedFoodSpots,
        spotsList, setSpotsList,
        spotsTotal, setSpotsTotal
    } = useContext(MyContext)
    const navigate = useNavigate()
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        //Food spot types
        var api_call = api + "Destinations/getFoodSpotTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setFoodSpotTypes(await res.json())
            //Food spots
            api_call = api + "Destinations/getFoodSpots?destId=" + selectedDestination.destinationId + "&currencyId= " + user.currencyId
            fetch(api_call, {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + token,
                    "Content-Type": "application/json"
                },
            }).then(async res => {
                setFoodSpots(await res.json())
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

                    api_call = api + "Destinations/getSuggestedFoodSpot?spenderTypeId=" + selectedSpenderType.spenderTypeId + "&destinationId= " + selectedDestination.destinationId
                    fetch(api_call, {
                        method: "GET",
                        headers: {
                            "Authorization": "Bearer " + token,
                            "Content-Type": "application/json"
                        },
                    }).then(async res => setSuggestedFoodSpots(await res.json()))
                    setIsLoading(false)
                })
            })
        })
    }, [])

    while (isLoading) {
        return <p>Loading</p>
    }

    const formatDate = (date) => {
        if (date != "") {
            const year = date.getFullYear()
            const month = date.getMonth() + 1
            const day = date.getDate()

            return year + "-" + month + "-" + (day < 10 ? "0" + day : day)
        }
    }

    const next = () => {
        //Total food spots
        var api_call = api + "Destinations/getFoodSpotsTotal?start=" + formatDate(startDate) + "&end=" + formatDate(endDate)
        fetch(api_call, {
            method: "POST",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(spotsList)
        }).then(async res => {
            setSpotsTotal(await res.json())
            navigate('/addVacayPlan/selectAttr')
        })
    }

    const back = () => {
        navigate(-1)
    }

    const addTheSelectedFoodSpot = (spot) => {
        const isSelected = selectedFoodSpots.find(fs => fs.foodSpotId == spot.foodSpotId) != undefined
        if (isSelected) {
            setSelectedFoodSpots([...selectedFoodSpots.filter(fs => fs.foodSpotId != spot.foodSpotId)])
            setSpotsList([...spotsList.filter(s => s.spot.foodSpotId != spot.foodSpotId)])
        } else {
            setSelectedFoodSpots([...selectedFoodSpots, spot])
        }
    }

    const determineClassName = (f) => {
        if (selectedFoodSpots.length != 0) {
            if (selectedFoodSpots.find(spot => spot.foodSpotId == f.foodSpotId)) {
                return "selected-card-ui"
            } else {
                return "card-ui"
            }
        } else {
            return "card-ui"
        }
    }

    const setTimes = (spot, val) => {
        var isFound = spotsList.find(s => s.spot.foodSpotId == spot.foodSpotId) != undefined

        if(isFound == false && val != ""){
            //not in the list
            var item = {
                spot: spot,
                num: val
            }
             setSpotsList([...spotsList, item])

        }
        else if(isFound == true && val != ""){
            var item = {
                spot: spot,
                num: val
            }

            setSpotsList([...spotsList.filter(s => s.spot != spot), item])
        }
    }

    return (
        <>
            <div>
                <h2>Select food spots from {selectedDestination.destinationName}</h2>

                <div className="cards-section">
                    {foodSpots.length.length != 0 ?
                        foodSpots.map(f => {
                            var isFound = suggestedFoodSpots.find(fs => fs.foodSpotId == f.foodSpotId) != undefined

                            return <div className={determineClassName(f)} onClick={() => addTheSelectedFoodSpot(f)}>
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
                                <p>Menu price: {currency.currencySymbol} {f.foodSpotMinMenuPrice} - {f.foodSpotMaxMenuPrice}</p>
                                <p>Menu: {f.foodSpotMenuItems}</p>
                                <p>{foodSpotTypes.find(type => type.foodSpotTypeId == f.foodSpotTypeId).foodSpotTypeName} </p>
                            </div>

                        }) :
                        <p>no food spots</p>
                    }

                </div>


            </div>

            {selectedFoodSpots.length != 0 ?

                <div style={{ backgroundColor: "#71c7f1ff", padding: "5px" }}>
                    <h3>Fill in details below</h3>
                    {
                        selectedFoodSpots.map((s) => {
                            var item = spotsList.find(i => i.spot.foodSpotId == s.foodSpotId)
                            return <div >
                                <p>{s.foodSpotName}</p>
                                <label>Number of times:</label>
                                <select value={item != undefined? item.num: ""} onChange={(e) => setTimes(s, e.target.value)} required>
                                    <option value={""}>Select number of times</option>
                                    <option value={"1"}>Try out once</option>
                                    <option value={"2"}>Multiple times</option>
                                </select>

                            </div>
                        })
                    }

                </div>

                : <></>
            }

            <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                <button onClick={back} type="button">Back</button>
                <button onClick={next} type="button">Next</button>
            </div>

        </>
    )


}

export default SelectFoodSpot