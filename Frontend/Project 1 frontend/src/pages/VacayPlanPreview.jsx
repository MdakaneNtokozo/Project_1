import { useContext, useEffect, useState } from "react"
import { MyContext } from "../MyProvider"
import { useNavigate } from "react-router-dom"

function VacayPlanPreview() {
    const {
        api,
        token,
        user,
        currency,
        selectedDestination,
        startDate,
        endDate,
        selectedSpenderType,
        selectedBuddies,
        selectedTransportation,
        selectedAccommodations,
        selectedFoodSpots,
        selectedAttractions,
        transTotal, transList,
        accommTotal, accommList,
        spotsTotal, spotsList,
        attrsTotal, attrsList
    } = useContext(MyContext)
    const navigate = useNavigate()
    const [vacayTotal, setVacayTotal] = useState()

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

        var vacayList = {
            user: user,
            type: selectedSpenderType,
            travelBuddies: selectedBuddies,
            transSelected: transList,
            accommSelected: sendList,
            spotsSelected: spotsList,
            attrSelected: attrsList
        }

        var api_call = api + "Destinations/calVacayBudget?start=" + formatDate(startDate) + "&end=" + formatDate(endDate)
        fetch(api_call, {
            method: "POST",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(vacayList)
        }).then(async res => {
            console.log(res.status)
            navigate('/home')
        })
    }

    return (
        <>
            <div className="preview-container">
                <div className="preview-upper-section">
                    <img src={selectedDestination.destinationImage}></img>
                    <div>
                        <p>Vaction details for {selectedDestination.destinationName}</p>
                        <p>{formatDate2(startDate)} - {formatDate2(endDate)}</p>
                    </div>
                </div>


                <div className="preview-lower-section">
                    <div className="preview-detail-side">
                        <p>Vacation details</p>
                        <div className="details-format">
                            <p>Num of travel buddies:</p>
                            <p>{selectedBuddies.length}</p>
                        </div>
                        <p>Transportation:</p>
                        {selectedTransportation.length != 0 ?
                            selectedTransportation.map((t, idx) => {
                                return <div className="details-format" key={idx}>
                                    <p>{t.transportationName}</p>
                                    <p>{currency.currencySymbol} {t.transportationPricePerPerson}</p>
                                </div>
                            })

                            :
                            <p>No transportation selected</p>
                        }
                        <p>Selected accommodation:</p>
                        {selectedAccommodations.length != 0 ?
                            selectedAccommodations.map((a, idx) => {
                                return <div className="details-format" key={idx}>
                                    <p>{a.accommodationName}</p>
                                    <p>{currency.currencySymbol} {a.accommodationPricePerPerson}</p>
                                </div>
                            })

                            :
                            <p>No accommodation selected</p>
                        }
                        <p>Selected food spots:</p>
                        {selectedFoodSpots.length != 0 ?
                            selectedFoodSpots.map((f, idx) => {
                                return <div className="details-format" key={idx}>
                                    <p>{f.foodSpotName}</p>
                                    <p>{currency.currencySymbol} {f.foodSpotMinMenuPrice} - {f.foodSpotMaxMenuPrice}</p>
                                </div>
                            })

                            :
                            <p>No food spots selected</p>
                        }
                        <p>Selected attractions:</p>
                        {selectedAttractions.length != 0 ?
                            selectedAttractions.map((a, idx) => {
                                return <div className="details-format" key={idx}>
                                    <p>{a.attractionName}</p>
                                    <p>{currency.currencySymbol} {a.attractionEntranceFee}</p>
                                </div>
                            })

                            :
                            <p>No attractions selected</p>
                        }

                        <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                            <p> </p>

                            <button type="button" onClick={() => edit()}>Edit</button>
                        </div>
                    </div>

                    <div className="preview-total-side">
                        <div>
                            <p>Vacation Total</p>
                            <div className="total-format">
                                <p>Transportation</p>
                                <p>{currency.currencySymbol} {transTotal}</p>
                            </div>

                            <div className="total-format">
                                <p>Accommodation</p>
                                <p>{currency.currencySymbol} {accommTotal}</p>
                            </div>

                            <div className="total-format">
                                <p>Food spots</p>
                                <p>{currency.currencySymbol} {spotsTotal}</p>
                            </div>

                            <div className="total-format">
                                <p>Attractions:</p>
                                <p>{currency.currencySymbol} {attrsTotal}</p>
                            </div>

                            <hr></hr>
                            <div className="total-format">
                                <p>Vaction budget total:</p>
                                <p>{currency.currencySymbol} {transTotal + accommTotal + spotsTotal + attrsTotal}</p>
                            </div>
                        </div>


                        <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                            <p> </p>
                            <button type="button" onClick={() => save() }>Save</button>
                        </div>

                    </div>
                </div>

            </div>

        </>
    )

}

export default VacayPlanPreview