import { useContext, useEffect, useState } from "react"
import { MyContext } from "../MyProvider"
import { Rating } from "react-simple-star-rating"
import { BiCheckCircle } from "react-icons/bi"
import { useNavigate } from "react-router-dom"

function SelectAccomm() {

    const [accommodations, setAccommodations] = useState([])
    const [accommodationTypes, setAccommodationTypes] = useState([])
    const [suggestedAccommodations, setSuggestedAccommodations] = useState([])
    const [spenderTypes, setSpenderTypes] = useState([])
    const {
        api,
        token,
        user,
        currency,
        startDate, endDate,
        selectedSpenderType,
        selectedDestination,
        selectedAccommodations,
        setSelectedAccommodations,
        accommList, setAccommList,
        accommTotal, setAccommTotal,
    } = useContext(MyContext)
    const navigate = useNavigate()
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        //Accommodation types
        var api_call = api + "Destinations/getAccommodationTypes"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setAccommodationTypes(await res.json())
            //Accommodations
            api_call = api + "Destinations/getAccommodations?destId=" + selectedDestination.destinationId + "&currencyId= " + user.currencyId
            fetch(api_call, {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + token,
                    "Content-Type": "application/json"
                },
            }).then(async res => {
                setAccommodations(await res.json())
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
                    api_call = api + "Destinations/getSuggestedAccommodation?spenderTypeId=" + selectedSpenderType.spenderTypeId + "&destinationId= " + selectedDestination.destinationId
                    fetch(api_call, {
                        method: "GET",
                        headers: {
                            "Authorization": "Bearer " + token,
                            "Content-Type": "application/json"
                        },
                    }).then(async res => setSuggestedAccommodations(await res.json()))
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
        var api_call = api + "Destinations/getAccomsTotal?start=" + formatDate(startDate) + "&end=" + formatDate(endDate)
        fetch(api_call, {
            method: "POST",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(accommList)
        }).then(async res => {
            setAccommTotal(await res.json())
            navigate('/addVacayPlan/selectFoodSpot')
        })

    }

    const back = () => {
        navigate(-1)
    }

    const addTheSelectedAccommodation = (accomm) => {
        const isSelected = selectedAccommodations.find(ac => ac.accommodationId == accomm.accommodationId) != undefined
        if (isSelected) {
            setSelectedAccommodations([...selectedAccommodations.filter(a => a.accommodationId != accomm.accommodationId)])
            setAccommList([...accommList.filter(a => a.accomm.accommodationId != accomm.accommodationId)])
        } else {
            setSelectedAccommodations([...selectedAccommodations, accomm])
        }
    }

    const determineClassName = (a) => {
        if (selectedAccommodations.length != 0) {
            if (selectedAccommodations.find(accomm => accomm.accommodationId == a.accommodationId)) {
                return "selected-card-ui"
            } else {
                return "card-ui"
            }
        } else {
            return "card-ui"
        }
    }

    const setDays = (accomm, val) => {
        var isFound = accommList.find(i => i.accomm.accommodationId == accomm.accommodationId) != undefined

        if(isFound == false && val != ""){
            //not in the list
            var item = {
                accomm: accomm,
                num: val
            }
             setAccommList([...accommList, item])

        }
        else if(isFound == true && val != ""){
            var item = {
                accomm: accomm,
                num: val
            }

            setAccommList([...accommList.filter(i => i.accomm != accomm), item])
        }
    }

    return (
        <>
            <div>
                <h2>Select accommodations for {selectedDestination.destinationName}</h2>

                <div className="cards-section">
                    {accommodations.length.length != 0 ?
                        accommodations.map(a => {

                            var isFound = suggestedAccommodations.find(ac => ac.accommodationId == a.accommodationId) != undefined

                            return <div className={determineClassName(a)} onClick={() => addTheSelectedAccommodation(a)}>
                                <div className="card-img">
                                    <img src={a.accommodationImage}></img>
                                    <div className="card-rating">
                                        <Rating initialValue={a.accommodationRating} readonly allowFraction size={"20px"}></Rating>

                                    </div>
                                    {isFound ?
                                        <div className="suggested">
                                            <BiCheckCircle size={"35px"} color="yellow"></BiCheckCircle>
                                        </div> :
                                        <></>
                                    }
                                </div>
                                <p>{a.accommodationName}</p>
                                <p>{a.accommodationAddress}</p>
                                <p>Price per person: {currency.currencySymbol} {a.accommodationPricePerPerson}</p>
                                <p>Num of people: {a.accommodationMinNumOfPeople} - {a.accommodationMaxNumOfPeople}</p>
                                <p>{accommodationTypes.find(type => type.accomodationTypeId == a.accomodationTypeId).accommodationTypeName} </p>
                                <p>{a.accommodationAmenities}</p>
                            </div>

                        }) :
                        <p>no accommodations</p>
                    }

                </div>

            </div>

            {selectedAccommodations.length != 0 ?

                <div style={{ backgroundColor: "#71c7f1ff", padding: "5px" }}>
                    <h3>Fill in details below</h3>
                    {
                        selectedAccommodations.map((a) => {
                            var item = accommList.find(i => i.accomm.accommodationId == a.accommodationId)
                            return <div >
                                <p>{a.accommodationName}</p>
                                <label>Number of days:</label>
                                <input placeholder="select number of stays in accommodation" type="number" min={0} value={item != undefined? item.num: ""} onChange={(e) => setDays(a, e.target.value)}></input>
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

export default SelectAccomm