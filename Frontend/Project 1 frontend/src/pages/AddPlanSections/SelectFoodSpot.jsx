import { useContext, useEffect, useState } from "react"
import { MyContext } from "../../MyProvider"
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
        var date = new Date(date)
        if (date != undefined) {
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
            //food spot has been selected, remove it from the list
            setSelectedFoodSpots([...selectedFoodSpots.filter(fs => fs.foodSpotId != spot.foodSpotId)])
            setSpotsList([...spotsList.filter(s => s.spot.foodSpotId != spot.foodSpotId)])
        } else {
            //food spot has not been selected, add it from the list
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

    const setTimes = (spot, useType, num) => {
        if(useType != 0){
            var item = {
                spot: spot,
                useType: useType,
                num: num
            }

            var isFound = spotsList.find(item => item.spot.foodSpotId == spot.foodSpotId) == undefined
            if(isFound){
                //Add to list
                setSpotsList([...spotsList, item])
            }else{
                //Update list
                setSpotsList([...spotsList.filter(item => item.spot.foodSpotId != spot.foodSpotId), item])
            }
        }
    }

    console.log(spotsList)

    return (
        <>
            <div>
                <h2>Select food spots from {selectedDestination.destinationName}</h2>

                <div className="cards-section">
                    {foodSpots.length.length != 0 ?
                        foodSpots.map((f, idx) => {
                            var isFound = suggestedFoodSpots.find(fs => fs.foodSpotId == f.foodSpotId) != undefined

                            return <div key={idx} className={determineClassName(f)} onClick={() => addTheSelectedFoodSpot(f)}>
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

                <div className="more-details">
                    <h3>Fill in details below</h3>
                    {
                        selectedFoodSpots.map((s) => {
                            var item = spotsList.find(i => i.spot.foodSpotId == s.foodSpotId)
                            return <div >
                                <p>{s.foodSpotName}</p>

                                <label>Type of food experience:</label>
                                <select value={item != undefined ? item.useType : 0} onChange={(e) => setTimes(s, e.target.value, undefined)}>
                                    <option value={0}>What type of food experience best describes the above food spot?</option>
                                    <option value={1}>Limited experience throughout the trip</option>
                                    <option value={2}>Every day experience during the trip</option>
                                </select>

                                <label>Specify the number of times it will be experienced:</label>
                                <input type="number" min={0} value={item != undefined ? item.num: ""} onChange={(e) => setTimes(s, item.useType, e.target.value)}></input>
                            

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