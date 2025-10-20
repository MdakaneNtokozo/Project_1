import { useContext, useEffect, useState } from "react"
import { MyContext } from "../MyProvider"
import { useLocation, useNavigate } from "react-router-dom"
import Footer from "../Footer"
import Header from "../Header"

function ViewVacayPlan() {
    const {
        api,
        token,
        user,
    } = useContext(MyContext)
    const navigate = useNavigate()
    const location = useLocation()
    const plan = location.state?.plan
    const planInfo = location.state?.planInfo

    const [transportations, setTransportations] = useState([])
    const [accommodations, setAccommodations] = useState([])
    const [foodSpots, setFoodSpots] = useState([])
    const [attractions, setAttractions] = useState([])

    useEffect(() => {
        var api_call = api + "VacayPlansControllerr/getTransportations?vacationId=" + plan.vacationId + "&destId=" + planInfo.vacayDestId + "&currencyId= " + user.currencyId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setTransportations(await res.json())
        })

        //Accommodations
        api_call = api + "VacayPlansControllerr/getAccommodations?vacationId=" + plan.vacationId + "&destId=" + planInfo.vacayDestId + "&currencyId= " + user.currencyId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setAccommodations(await res.json())
        })

        //Food spots
        api_call = api + "VacayPlansControllerr/getFoodSpots?vacationId=" + plan.vacationId + "&destId=" + planInfo.vacayDestId + "&currencyId= " + user.currencyId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setFoodSpots(await res.json())
        })

        var api_call = api + "VacayPlansControllerr/getAttractions?vacationId=" + plan.vacationId + "&destId=" + planInfo.vacayDestId + "&currencyId= " + user.currencyId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setAttractions(await res.json())
        })

    }, [])

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
        console.log("will navigate to edit page")
    }

    const stopReload = (event) => {
        //to stop the form from reloading when submitting
        event.preventDefault()
    }

    return (
        <>
            <Header />

            <div className="container">
                <form className="add-plan-form" onSubmit={stopReload}>
                    <div className="preview-container">
                        <div className="preview-upper-section">
                            <img ></img>
                            <div>
                                <p>Vaction details for {planInfo.vacayDestName}</p>
                                <p>Date - Date</p>
                                <p>Created {formatDate2(plan.planCreatedDate)}</p>
                                <p>Planed by: {user.userName} {user.userSurname}</p>
                            </div>
                        </div>


                        <div className="preview-lower-section">
                            <div className="preview-detail-side">
                                <p>Vacation details</p>

                                <p>Travel buddies:</p>
                                {/* {selectedBuddies.length != 0 ?
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
                        } */}
                                <br />

                                <p>Transportation:</p>
                                {transportations.length != 0 ?

                                    <table>
                                        <tbody>
                                            {
                                                transportations.map(t => {
                                                    //let item = transList.find(i => i.trans == t)
                                                    return <tr>
                                                        <td className="td1">{t.transportationName}</td>
                                                        {/* <td className="td2">{item.num} {item.useType == "1"? "times only" : "times everday"}</td> */}
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
                                                return <tr key={idx}>
                                                    <td className="td1">{a.accommodationName}</td>
                                                    <td className="td2"></td>
                                                    <td className="td3"> {a.accommodationPricePerPerson}</td>
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
                                                    //var spot = spotsList.find(s => s.spot.foodSpotId == f.foodSpotId)

                                                    return <tr key={idx}>
                                                        <td className="td1">{f.foodSpotName}</td>
                                                        {/* <td className="td2">{spot.num} {spot.useType == "1"? " times only" : "times everyday"}</td> */}
                                                        <tr className="td3">{f.foodSpotMinMenuPrice} - {f.foodSpotMaxMenuPrice}</tr>
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
                                                    //var attr = attrsList.find(at => at.attr.attractionId == a.attractionId)

                                                    return <tr key={idx}>
                                                        <td className="td1">{a.attractionName}</td>
                                                        {/* <td className="td2">{attr.num} {attr.useType == "1"? " times only" : "times everyday"}</td> */}
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
                                                <td className="td2"></td>
                                                <td className="td3"></td>
                                            </tr>
                                            <tr>
                                                <td className="td1">Accommodation</td>
                                                <td className="td2"></td>
                                                <tr className="td3"></tr>
                                            </tr>
                                            <tr>
                                                <td className="td1">Food spot</td>
                                                <td className="td2"></td>
                                                <tr className="td3"></tr>
                                            </tr>
                                            <tr>
                                                <td className="td1">Attraction</td>
                                                <td className="td2"></td>
                                                <tr className="td3"></tr>
                                            </tr>
                                        </tbody>

                                    </table>

                                    <hr></hr>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td className="td1">Budget total</td>
                                                <td className="td2"></td>
                                                <tr className="td3">{plan.planBudget}</tr>
                                            </tr>
                                        </tbody>

                                    </table>
                                </div>


                                <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                                    <button type="button" onClick={() => edit()}>Edit</button>
                                    <button type="button" onClick={() => console.log("will delete plan")}>Delete</button>
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