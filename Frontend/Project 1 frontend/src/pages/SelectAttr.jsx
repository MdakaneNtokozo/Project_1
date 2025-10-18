import { useContext, useEffect, useState } from "react"
import { MyContext } from "../MyProvider"
import { Rating } from "react-simple-star-rating"
import { BiCheckCircle } from "react-icons/bi"
import { useNavigate } from "react-router-dom"

function SelectAttr() {
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
        attrsTotal, setAttrsTotal
    } = useContext(MyContext)
    const navigate = useNavigate()
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        //Attractions
        var api_call = api + "Destinations/getAttractions?destId=" + selectedDestination.destinationId + "&currencyId= " + user.currencyId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
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
        //Total attractions
        var api_call = api + "Destinations/getAttrsTotal?start=" + formatDate(startDate) + "&end=" + formatDate(endDate)
        fetch(api_call, {
            method: "POST",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(attrsList)
        }).then(async res => {
            setAttrsTotal(await res.json())
            navigate('/addVacayPlan/preview')
        })
        
    }

    const back = () => {
        navigate(-1)
    }

    const addTheSelectedAttraction = (attr) => {
        const isSelected = selectedAttractions.find(ac => ac.attractionId == attr.attractionId) != undefined
        if (isSelected) {
            setSelectedAttractions([...selectedAttractions.filter(a => a.attractionId != attr.attractionId)])
            setAttrsList([...attrsList.filter(a => a.attr.attractionId != attr.attractionId)])
        } else {
            setSelectedAttractions([...selectedAttractions, attr])
        }
    }

    const determineClassName = (a) => {
        if(selectedAttractions.length != 0){
            if(selectedAttractions.find(attr => attr.attractionId == a.attractionId)){
                return "selected-card-ui"
            }else{
                return "card-ui"
            }
        }else{
            return "card-ui"
        }
    }

    const setTimes = (attr, val) => {
        var isFound = attrsList.find(s => s.attr.attractionId == attr.attractionId) != undefined

        if(isFound == false && val != ""){
            //not in the list
            var item = {
                attr: attr,
                num: val
            }
             setAttrsList([...attrsList, item])

        }
        else if(isFound == true && val != ""){
            var item = {
                attr: attr,
                num: val
            }

            setAttrsList([...attrsList.filter(a => a.attr != attr), item])
        }
    }

    
    return (
        <>
            <div>
                <h2>Select attractions from {selectedDestination.destinationName}</h2>

                <div className="cards-section">
                    {attractions.length.length != 0 ?
                        attractions.map(a => {
                                var isFound = suggestedAttractions.find(ac => ac.attractionId == a.attractionId) != undefined

                                return <div className={determineClassName(a)} onClick={() => addTheSelectedAttraction(a)}>
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
                                    <p>{a.attractionName}</p>
                                    <p>{a.attractionAddress}</p>
                                    <p>Entrance fee: {currency.currencySymbol} {a.attractionEntranceFee}</p>
                                    <p>Time limited: {a.attractionTimeLimited == 1 ? "yes" : "no"} </p>
                                    <p>{a.attractionDescription}</p>
                                </div>
                            
                        }) :
                        <p>no accommodations</p>
                    }

                </div>


            </div>

            {selectedAttractions.length != 0 ?

                <div style={{ backgroundColor: "#71c7f1ff", padding: "5px" }}>
                    <h3>Fill in details below</h3>
                    {
                        selectedAttractions.map((a) => {
                            var item = attrsList.find(i => i.attr.attractionId == a.attractionId)
                            return <div >
                                <p>{a.attractionName}</p>
                                <label>Number of times:</label>
                                <select value={item != undefined? item.num: ""} onChange={(e) => setTimes(a, e.target.value)} required>
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

export default SelectAttr