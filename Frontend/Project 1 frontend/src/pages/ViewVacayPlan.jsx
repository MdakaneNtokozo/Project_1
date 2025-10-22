import { useContext, useEffect, useState } from "react"
import { MyContext } from "../MyProvider"
import { useLocation, useNavigate } from "react-router-dom"
import Footer from "../Footer"
import Header from "../Header"
import Loading from "../Loading"

function ViewVacayPlan() {
    const {
        api,
        token,
        user,
        currency,
        setSelectedDestination,
        setStartDate,
        setEndDate,
        setSelectedSpenderType,
        setSelectedBuddies,
        setSelectedTransportations,
        setSelectedAccommodations,
        setSelectedFoodSpots,
        setSelectedAttractions,
        setTransList,
        setAccommList,
        setSpotsList,
        setAttrsList,
        setVacayPlan

    } = useContext(MyContext)
    const navigate = useNavigate()
    const location = useLocation()
    const plan = location.state?.plan

    const [createdPlan] = useState(plan.vacayPlan)
    const [vacation] = useState(plan.vacation)
    const [destination] = useState(plan.destination)
    const [buddies] = useState(plan.buddies)
    const [users] = useState(plan.users)

    const [selectedTrans] = useState(plan.selectedTrans)
    const [transportations] = useState(plan.transportations)
    const [selectedAccomm] = useState(plan.selectedAccoms)
    const [accommodations] = useState(plan.accommodations)
    const [selectedSpots] = useState(plan.selectedSpots)
    const [foodSpots] = useState(plan.foodSpots)
    const [selectedAttrs] = useState(plan.selectedAttrs)
    const [attractions] = useState(plan.attractions)

    const [transTotal, setTransTotal] = useState(0.0)
    const [accommTotal, setAccommTotal] = useState(0.0)
    const [spotsTotal, setSpotsTotal] = useState(0.0)
    const [attrsTotal, setAttrsTotal] = useState(0.0)

    const formatDate = (date) => {
        var date = new Date(date)
        if (date != undefined) {
            const year = date.getFullYear()
            const month = date.getMonth() + 1
            const day = date.getDate()

            return year + "-" + month + "-" + (day < 10 ? "0" + day : day)
        }
    }

    const formatDate2 = (date) => {
        var date = new Date(date)
        if (date != undefined) {
            const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

            const year = date.getFullYear()
            const month = months.at(date.getMonth())
            const day = date.getDate()

            return day + " " + month + " " + year
        }

    }

    const edit = () => {

        setVacayPlan(plan.vacayPlan)
        setSelectedDestination(plan.destination)
        setStartDate(plan.vacation.vacationStartDate)
        setEndDate(plan.vacation.vacationEndDate)
        setSelectedSpenderType(plan.spenderType)
        setSelectedBuddies(plan.users)
        setSelectedTransportations(plan.transportations)
        setSelectedAccommodations(plan.accommodations)
        setSelectedFoodSpots(plan.foodSpots)
        setSelectedAttractions(plan.attractions)

        var transList = []
        selectedTrans.forEach(i => {
            var trans = transportations.find(t => t.transportationId == i.transportationId)
            var item = {
                trans: trans,
                useType: i.selectedUseType,
                num: i.numOfTimes
            }

            transList.push(item)
        })
        setTransList(transList)

        var accommsList = []
        selectedAccomm.forEach(i => {
            var accomm = accommodations.find(a => a.accommodationId == i.accommodationId)
            console.log(new Date(i.checkInDate))
            var item = {
                accomm: accomm,
                dates: [new Date(i.checkInDate), new Date(i.checkOutDate)]
            }
            accommsList.push(item)
        })
        setAccommList(accommsList)

        var spotsList = []
        selectedSpots.forEach(i => {
            var spot = foodSpots.find(s => s.foodSpotId == i.foodSpotId)
            var item = {
                spot: spot,
                useType: i.selectedExperienceType,
                num: i.numOfTimes
            }

            spotsList.push(item)
        })
        setSpotsList(spotsList)

        var attrsList = []
        selectedAttrs.forEach(i => {
            var attr = attractions.find(a => a.attractionId == i.attractionId)
            var item = {
                attr: attr,
                useType: i.selectedExperienceType,
                num: i.numOfTimes
            }

            attrsList.push(item)
        })
        setAttrsList(attrsList)

        navigate('/vacayPlan/vacayDetails')
    }

    const deletePlan = () => {
        var api_call = api + "Destinations/deleteVacayBudget"
        fetch(api_call, {
            method: "DELETE",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(plan.vacayPlan)
        }).then(async res => {
            if (res.ok) {
                alert("Vacay plan has been deleted.")
                navigate('/home')
            }

        })
    }

    const stopReload = (event) => {
        //to stop the form from reloading when submitting
        event.preventDefault()
    }

    const calcTransTotal = (tList) => {
        var total = 0.0

        tList.forEach(t => {
            total += t.transportationBudget
        })

        return total
    }

    const calcAccommTotal = (aList) => {
        var total = 0.0

        aList.forEach(a => {
            total += a.accommodationBudget
        })

        return total
    }

    const calcSpotsTotal = (sList) => {
        var total = 0.0

        sList.forEach(s => {
            total += s.foodSpotBudget
        })

        return total
    }

    const calcAttrTotal = (atList) => {
        var total = 0.0

        atList.forEach(at => {
            total += at.attractionBudget
        })

        return total
    }

    return (
        <>
            <Header />

            <div className="container">
                <form className="add-plan-form" onSubmit={stopReload}>
                    <div className="preview-container">
                        <div className="preview-upper-section">
                            <img src={destination.destinationImage}></img>
                            <div>
                                <p>Vaction details for {destination.destinationName}</p>
                                <p>{formatDate2(vacation.vacationStartDate)} - {formatDate2(vacation.vacationEndDate)}</p>
                                <p>Created {formatDate2(createdPlan.planCreatedDate)}</p>
                                <p>Planned by: {user.userName} {user.userSurname}</p>
                            </div>
                        </div>


                        <div className="preview-lower-section">
                            <div className="preview-detail-side">
                                <p>Vacation details</p>

                                <p>Travel buddies:</p>
                                {buddies.length != 0 ?
                                    <table>
                                        <tbody>
                                            {buddies.map((b, idx) => {
                                                var buddy = users.find(u => u.userId == b.userId)

                                                return <tr key={idx}>
                                                    <td className="td1">{buddy.userName} {buddy.userSurname}</td>
                                                    <td className="td1">{buddy.userEmail}</td>
                                                </tr>
                                            })}
                                        </tbody>

                                    </table>

                                    :
                                    <p>No buddies selected</p>
                                }
                                <br />

                                <p>Transportation:</p>
                                {transportations.length != 0 ?

                                    <table>
                                        <tbody>
                                            {
                                                transportations.map((t, idx) => {
                                                    var trans = selectedTrans.find(i => i.transportationId == t.transportationId)

                                                    return <tr key={idx}>
                                                        <td className="td1">{t.transportationName}</td>
                                                        <td className="td2">{trans.numOfTimes} {trans.selectedUseType == "1" ? "times only" : "times everday"}</td>
                                                        <td className="td3">{t.transportationPricePerPerson}</td>
                                                    </tr>

                                                })
                                            }
                                        </tbody>

                                    </table>


                                    :
                                    <p>No transportation selected</p>
                                }
                                <br />

                                <p>Selected accommodation:</p>
                                {accommodations.length != 0 ?
                                    <table>
                                        <tbody>
                                            {accommodations.map((a, idx) => {
                                                var accomm = selectedAccomm.find(sa => sa.accommodationId == a.accommodationId)
                                                var checkInDate = new Date(accomm.checkInDate)
                                                var checkOutDate = new Date(accomm.checkOutDate)

                                                return <tr key={idx}>
                                                    <td className="td1">{a.accommodationName}</td>
                                                    <td className="td2">{formatDate2(checkInDate)} - {formatDate2(checkOutDate)}</td>
                                                    <td className="td3">{a.accommodationPricePerPerson}</td>
                                                </tr>
                                            })}
                                        </tbody>

                                    </table>
                                    :
                                    <p>No accommodation selected</p>
                                }
                                <br />

                                <p>Selected food spots:</p>
                                {foodSpots.length != 0 ?
                                    <table>
                                        <tbody>
                                            {
                                                foodSpots.map((f, idx) => {
                                                    var spot = selectedSpots.find(s => s.foodSpotId == f.foodSpotId)

                                                    return <tr key={idx}>
                                                        <td className="td1">{f.foodSpotName}</td>
                                                        <td className="td2">{spot.numOfTimes} {spot.selectedExperienceType == "1" ? " times only" : "times everyday"}</td>
                                                        <td className="td3">{f.foodSpotMinMenuPrice} - {f.foodSpotMaxMenuPrice}</td>
                                                    </tr>
                                                })
                                            }
                                        </tbody>

                                    </table>


                                    :
                                    <p>No food spots selected</p>
                                }
                                <br />

                                <p>Selected attractions:</p>
                                {attractions.length != 0 ?
                                    <table>
                                        <tbody>
                                            {
                                                attractions.map((a, idx) => {
                                                    var attr = selectedAttrs.find(at => at.attractionId == a.attractionId)

                                                    return <tr key={idx}>
                                                        <td className="td1">{a.attractionName}</td>
                                                        <td className="td2">{attr.numOfTimes} {attr.selectedExperienceType == "1" ? " times only" : "times everyday"}</td>
                                                        <td className="td3">{a.attractionEntranceFee}</td>
                                                    </tr>
                                                })
                                            }
                                        </tbody>

                                    </table>

                                    :
                                    <p>No attractions selected</p>
                                }
                                <br />


                            </div>

                            <div className="preview-total-side">
                                <div>
                                    <p>Vacation Total</p>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td className="td1">Transportation</td>
                                                <td className="td2">{currency.currencySymbol}</td>
                                                <td className="td3">{calcTransTotal(selectedTrans)}</td>
                                            </tr>
                                            <tr>
                                                <td className="td1">Accommodation</td>
                                                <td className="td2">{currency.currencySymbol}</td>
                                                <td className="td3">{calcAccommTotal(selectedAccomm)}</td>
                                            </tr>
                                            <tr>
                                                <td className="td1">Food spot</td>
                                                <td className="td2">{currency.currencySymbol}</td>
                                                <td className="td3">{calcSpotsTotal(selectedSpots)}</td>
                                            </tr>
                                            <tr>
                                                <td className="td1">Attraction</td>
                                                <td className="td2">{currency.currencySymbol}</td>
                                                <td className="td3">{calcAttrTotal(selectedAttrs)}</td>
                                            </tr>
                                        </tbody>

                                    </table>

                                    <hr></hr>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td className="td1">Budget total</td>
                                                <td className="td2"></td>
                                                <td className="td3">{createdPlan.planBudget}</td>
                                            </tr>
                                        </tbody>

                                    </table>
                                </div>


                                <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                                    <button type="button" onClick={() => edit()}>Edit</button>
                                    <button type="button" onClick={() => deletePlan()}>Delete</button>
                                </div>

                            </div>
                        </div>

                    </div>

                </form>

            </div>

            <Footer />
        </>
    )

}

export default ViewVacayPlan