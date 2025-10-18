import { useContext, useEffect, useState } from "react"
import { MyContext } from "../MyProvider"
import { Rating } from "react-simple-star-rating"
import { BiCheckCircle } from "react-icons/bi"
import { useNavigate } from "react-router-dom"

function SelectTrans() {

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
        transTotal, setTransTotal
    } = useContext(MyContext)
    const navigate = useNavigate()
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        //Transportations
        var api_call = api + "Destinations/getTransportations?destId=" + selectedDestination.destinationId + "&currencyId= " + user.currencyId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
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
        //Total transportation
        var api_call = api + "Destinations/getTransTotal?start=" + formatDate(startDate) + "&end=" + formatDate(endDate)
        fetch(api_call, {
            method: "POST",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(transList)
        }).then(async res => {
            setTransTotal(await res.json())
            navigate('/addVacayPlan/selectAccomm')
        })
        
    }

    const back = () => {
        navigate(-1)
    }

    const addTheSelectedTransportation = (trans) => {
        const isSelected = selectedTransportation.find(tr => tr.transportationId == trans.transportationId) != undefined
        if (isSelected) {
            setSelectedTransportations([...selectedTransportation.filter(tr => tr.transportationId != trans.transportationId)])
            setTransList([...transList.filter(t => t.trans.transportationId != trans.transportationId)])
        } else {
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

    const setUse = (trans, val) => {
        var isFound = transList.find(i => i.trans.transportationId == trans.transportationId) != undefined

        if(isFound == false && val != ""){
            //not in the list
            var item = {
                trans: trans,
                num: val
            }
             setTransList([...transList, item])

        }
        else if(isFound == true && val != ""){
            var item = {
                trans: trans,
                num: val
            }

            setTransList([...transList.filter(i => i.trans != trans), item])
        }
    }

    return (
        <>

            <div>
                <h2>Select transportations from {selectedDestination.destinationName}</h2>

                <div className="cards-section">
                    {transportations.length.length != 0 ?
                        transportations.map(t => {

                            var isFound = suggestedTransportations.find(tr => tr.transportationId == t.transportationId) != undefined

                            return <div className={determineClassName(t)} onClick={() => addTheSelectedTransportation(t)}>
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
                                <p>{t.transportationName}</p>
                                <p>Price per person: {currency.currencySymbol} {t.transportationPricePerPerson}</p>
                                <p>Num of people: {t.transportationMinPeople} - {t.transportationMaxPeople}</p>
                                <p>{transportationTypes.find(type => type.transportationTypeId == t.transportationTypeId).transportationTypeName} </p>
                            </div>

                        }) :
                        <p>no destination</p>
                    }

                </div>


            </div>

            {selectedTransportation.length != 0 ?

                <div style={{ backgroundColor: "#71c7f1ff", padding: "5px" }}>
                    <h3>Fill in details below</h3>
                    {
                        selectedTransportation.map((t) => {
                            var item = transList.find(i => i.trans.transportationId == t.transportationId)
                            return <div >
                                <p>{t.transportationName}</p>
                                <label>Type of use:</label>
                                <select value={item != undefined? item.num: ""} onChange={(e) => setUse(t, e.target.value)} required>
                                    <option value={""}>Select use</option>
                                    <option value={"1"}>One way trip</option>
                                    <option value={"2"}>Two way trip</option>
                                    <option value={"3"}>Everyday use</option>
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

export default SelectTrans