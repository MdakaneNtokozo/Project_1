import { useContext, useEffect, useState } from "react"
import { MyContext } from "../../MyProvider"
import { Rating } from "react-simple-star-rating"
import { BiCheckCircle } from "react-icons/bi"
import { useNavigate } from "react-router-dom"
import DatePicker from "react-multi-date-picker"
import Loading from "../../Loading"

function Accommodation() {

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

    var sendList = []
    accommList.forEach(i => {
        var start = new Date(i.dates[0])
        var end = new Date(i.dates[1])

        var item = {
            accomm: i.accomm,
            dates: [start, end]
        }

        sendList.push(item)
    });

    const next = () => {
        if (selectedAccommodations.length != accommList.length) {
            alert("make sure that you filled in the details for the selected accommodations")
        } else {

            var api_call = api + "Destinations/getAccomsTotal"
            fetch(api_call, {
                method: "POST",
                headers: {
                    "Authorization": "Bearer " + token,
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(sendList)
            }).then(async res => {
                setAccommTotal(await res.json())
                navigate('/vacayPlan/foodSpots')
            })

        }

    }

    const back = () => {
        navigate(-1)
    }

    const addTheSelectedAccommodation = (accomm) => {
        const isSelected = selectedAccommodations.find(ac => ac.accommodationId == accomm.accommodationId) != undefined

        if (isSelected) {
            //accommodation has been selected, remove it from the list
            setSelectedAccommodations([...selectedAccommodations.filter(a => a.accommodationId != accomm.accommodationId)])
            setAccommList([...accommList.filter(a => a.accomm.accommodationId != accomm.accommodationId)])
        } else {
            //accommodation has not been selected, add it from the list
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

    const setDates = (a, dates) => {
        if (dates.length == 2) {

            var isFound = accommList.find(i => i.accomm.accommodationId == a.accommodationId) != undefined
            if (isFound == false) {
                //not in the list
                var item = {
                    accomm: a,
                    dates: dates
                }
                setAccommList([...accommList, item])

            }
            else if (isFound == true) {
                var item = {
                    accomm: a,
                    dates: dates
                }

                setAccommList([...accommList.filter(i => i.accomm != a), item])
            }

        }
    }

    return (
        <>
            <div>
                <h2>Select accommodations for {selectedDestination.destinationName}</h2>

                <div className="cards-section">
                    {accommodations.length.length != 0 ?
                        accommodations.map((a, idx) => {

                            var isFound = suggestedAccommodations.find(ac => ac.accommodationId == a.accommodationId) != undefined

                            return <div key={idx} className={determineClassName(a)} onClick={() => addTheSelectedAccommodation(a)}>
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

                <div className="more-details">
                    <h3>Fill in details below</h3>
                    {
                        selectedAccommodations.map((a, idx) => {
                            var item = accommList.find(i => i.accomm.accommodationId == a.accommodationId)

                            return <div key={idx}>
                                <p>{a.accommodationName}</p>
                                <label>Select check in and check out dates for accommodation:</label>
                                <DatePicker mode="range" value={item != undefined ? [formatDate(item.dates[0]), formatDate(item.dates[1])] : undefined} range onChange={(dates) => setDates(a, dates)} style={{ width: "100vh" }} minDate={startDate} maxDate={endDate}
                                    mapDays={({ date }) => {
                                        var props = {}

                                        accommList.map((i) => {
                                            if (i != item) {
                                                var d = formatDate(date)
                                                var start = formatDate(i.dates[0])
                                                var end = formatDate(i.dates[1])
                                                var dateNum = new Date(d)
                                                var startNum = new Date(start)
                                                var endNum = new Date(end)

                                                if (dateNum >= startNum && dateNum <= endNum) {
                                                    props.style = {
                                                        backgroundColor: "#71c7f1ff"
                                                    }
                                                    props.disabled = true
                                                }
                                            }
                                        })

                                        return props
                                    }}


                                ></DatePicker><br />
                                <p className="error-msg" id={"a" + a.accommodationId} style={{ margin: "0px", marginBottom: "8px" }}></p>

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

export default Accommodation