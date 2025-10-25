import { useContext } from "react"
import { MyContext } from "../../MyProvider"
import { useNavigate } from "react-router-dom"

function VacayPlanPreview() {
    const {
        api,
        token,
        user,
        currency,
        selectedDestination, setSelectedDestination,
        startDate, setStartDate,
        endDate, setEndDate,
        selectedSpenderType, setSelectedSpenderType,
        selectedBuddies, setSelectedBuddies,
        selectedTransportation, setSelectedTransportations,
        selectedAccommodations, setSelectedAccommodations,
        selectedFoodSpots, setSelectedFoodSpots,
        selectedAttractions, setSelectedAttractions,
        transList, setTransList,
        transTotal, setTransTotal,
        accommList, setAccommList,
        accommTotal, setAccommTotal,
        spotsList, setSpotsList,
        spotsTotal, setSpotsTotal,
        attrsList, setAttrsList,
        attrsTotal, setAttrsTotal,
        vacayPlan, setVacayPlan
    } = useContext(MyContext)
    const navigate = useNavigate()

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
        navigate(-5)
    }

    const cancel = () => {
        var check = confirm("Are you sure you want to cancel this vacay plan?")
        if (check) {
            setSelectedDestination(null)
            setStartDate(null)
            setEndDate(null)
            setSelectedSpenderType(null)
            setSelectedBuddies([])
            setSelectedTransportations([])
            setSelectedAccommodations([])
            setSelectedFoodSpots([])
            setSelectedAttractions([])
            setTransList([])
            setTransTotal(0)
            setAccommList([])
            setAccommTotal(0)
            setSpotsList([])
            setSpotsTotal(0)
            setAttrsList([])
            setAttrsTotal(0)
            setVacayPlan(null)

            alert("Vacay plan has been cancelled")
            navigate('/home')
        }
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

    const save = () => {
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

        const nullVacapPlan = {
            vacationId: -1,
            userId: -1,
            planBudget: -1,
            planCreatedDate: Date.now,
            planModifiedDate: Date.now,
            spenderTypeId: -1
        }

        var vacayList = {
            plan: vacayPlan == null ? nullVacapPlan : vacayPlan,
            user: user,
            type: selectedSpenderType,
            travelBuddies: selectedBuddies,
            transSelected: transList,
            accommSelected: sendList,
            spotsSelected: spotsList,
            attrSelected: attrsList
        }

        if (vacayPlan == null) {
            var api_call = api + "Destinations/calVacayBudget?start=" + formatDate(startDate) + "&end=" + formatDate(endDate)
            fetch(api_call, {
                method: "POST",
                headers: {
                    "Authorization": "Bearer " + token,
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(vacayList)
            }).then(async res => {
                if (res.ok) {
                    setSelectedDestination(null)
                    setStartDate(null)
                    setEndDate(null)
                    setSelectedSpenderType(null)
                    setSelectedBuddies([])
                    setSelectedTransportations([])
                    setSelectedAccommodations([])
                    setSelectedFoodSpots([])
                    setSelectedAttractions([])
                    setTransList([])
                    setTransTotal([])
                    setAccommList([])
                    setAccommTotal([])
                    setSpotsList([])
                    setSpotsTotal([])
                    setAttrsList([])
                    setAttrsTotal([])
                    alert("Vacay plan has been added.")

                    navigate('/home')
                }

            })
        } else {

            var api_call = api + "Destinations/updateVacayBudget?start=" + formatDate(startDate) + "&end=" + formatDate(endDate)
            fetch(api_call, {
                method: "PUT",
                headers: {
                    "Authorization": "Bearer " + token,
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(vacayList)
            }).then(async res => {
                if (res.ok) {
                    setVacayPlan(null)
                    setSelectedDestination(null)
                    setStartDate(null)
                    setEndDate(null)
                    setSelectedSpenderType(null)
                    setSelectedBuddies([])
                    setSelectedTransportations([])
                    setSelectedAccommodations([])
                    setSelectedFoodSpots([])
                    setSelectedAttractions([])
                    setTransList([])
                    setTransTotal([])
                    setAccommList([])
                    setAccommTotal([])
                    setSpotsList([])
                    setSpotsTotal([])
                    setAttrsList([])
                    setAttrsTotal([])
                    alert("Vacay plan has been updated.")

                    navigate('/home')
                }

            })
        }


    }

    return (
        <>
            <div className="preview-container">
                <div className="preview-upper-section">
                    <img src={selectedDestination.destinationImage}></img>
                    <div>
                        <p>Vaction details for {selectedDestination.destinationName}</p>
                        <p>{formatDate2(startDate)} - {formatDate2(endDate)}</p>
                        <p>Planed by: {user.userName} {user.userSurname}</p>
                    </div>
                </div>


                <div className="preview-lower-section">
                    <div className="preview-detail-side">
                        <p className="card-title">Vacation details</p>

                        <p className="card-title">Travel buddies:</p>
                        {selectedBuddies.length != 0 ?
                            <table>
                                <tbody>
                                    {selectedBuddies.map((b, idx) => {
                                        return <tr key={idx}>
                                            <td className="td1">{b.userName} {b.userSurname}</td>
                                            <td className="td1">{b.userEmail}</td>
                                        </tr>
                                    })}
                                </tbody>

                            </table>

                            :
                            <p>No buddies selected</p>
                        }
                        <br />

                        <p className="card-title">Transportation:</p>
                        {selectedTransportation.length != 0 ?

                            <table>
                                <tbody>
                                    {
                                        selectedTransportation.map((t, idx) => {
                                            let item = transList.find(i => i.trans == t)
                                            return <tr key={idx}>
                                                <td className="td1">{t.transportationName}</td>
                                                <td className="td2">{item.num} {item.useType == "1" ? "times only" : "times everday"}</td>
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

                        <p className="card-title">Selected accommodation:</p>
                        {selectedAccommodations.length != 0 ?
                            <table>
                                <tbody>
                                    {selectedAccommodations.map((a, idx) => {
                                        var accom = accommList.find(sa => sa.accomm.accommodationId == a.accommodationId)

                                        return <tr key={idx}>
                                            <td className="td1">{a.accommodationName}</td>
                                            <td className="td2">{formatDate2(accom.dates[0])} - {formatDate2(accom.dates[1])}</td>
                                            <td className="td3"> {a.accommodationPricePerPerson}</td>
                                        </tr>
                                    })}
                                </tbody>

                            </table>
                            :
                            <p>No accommodation selected</p>
                        }
                        <br />

                        <p className="card-title">Selected food spots:</p>
                        {selectedFoodSpots.length != 0 ?
                            <table>
                                <tbody>
                                    {
                                        selectedFoodSpots.map((f, idx) => {
                                            var spot = spotsList.find(s => s.spot.foodSpotId == f.foodSpotId)

                                            return <tr key={idx}>
                                                <td className="td1">{f.foodSpotName}</td>
                                                <td className="td2">{spot.num} {spot.useType == "1" ? " times only" : "times everyday"}</td>
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

                        <p className="card-title">Selected attractions:</p>
                        {selectedAttractions.length != 0 ?
                            <table>
                                <tbody>
                                    {
                                        selectedAttractions.map((a, idx) => {
                                            var attr = attrsList.find(at => at.attr.attractionId == a.attractionId)

                                            return <tr key={idx}>
                                                <td className="td1">{a.attractionName}</td>
                                                <td className="td2">{attr.num} {attr.useType == "1" ? " times only" : "times everyday"}</td>
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

                        <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                            <button type="button" onClick={() => cancel()}>Cancel</button>

                            <button type="button" onClick={() => edit()}>Edit</button>
                        </div>
                    </div>

                    <div className="preview-total-side">
                        <div>
                            <p className="card-title">Vacation Total</p>
                            <table>
                                <tbody>
                                    <tr>
                                        <td className="td1">Transportation</td>
                                        <td className="td2">{currency.currencySymbol}</td>
                                        <td className="td3">{transTotal}</td>
                                    </tr>
                                    <tr>
                                        <td className="td1">Accommodation</td>
                                        <td className="td2">{currency.currencySymbol}</td>
                                        <td className="td3">{accommTotal}</td>
                                    </tr>
                                    <tr>
                                        <td className="td1">Food spot</td>
                                        <td className="td2">{currency.currencySymbol}</td>
                                        <td className="td3">{spotsTotal}</td>
                                    </tr>
                                    <tr>
                                        <td className="td1">Attraction</td>
                                        <td className="td2">{currency.currencySymbol}</td>
                                        <td className="td3">{attrsTotal}</td>
                                    </tr>
                                </tbody>

                            </table>

                            <hr></hr>
                            <table>
                                <tbody>
                                    <tr>
                                        <td className="td1">Budget total</td>
                                        <td className="td2">{currency.currencySymbol}</td>
                                        <td className="td3">{transTotal + accommTotal + spotsTotal + attrsTotal}</td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>


                        <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                            <p> </p>
                            <button type="button" onClick={() => save()}>Save</button>
                        </div>

                    </div>
                </div>

            </div>

        </>
    )

}

export default VacayPlanPreview