import { useContext, useEffect, useState } from "react"
import Footer from "../Footer"
import Header from "../Header"
import { useNavigate } from "react-router-dom"
import { MyContext } from "../MyProvider"
import { Rating } from "react-simple-star-rating"
import Loading from "../Loading"

function Home() {
    const [plans, setPlans] = useState([])
    const [info, setInfo] = useState([])
    const [top3Destinations, setTop3Destinations] = useState([])
    const { role, user, api, token, setCurrency } = useContext(MyContext)
    const navigate = useNavigate()
    const [isLoading1, setIsLoading1] = useState(true)
    const [isLoading2, setIsLoading2] = useState(true)

    useEffect(() => {
        // //Top 3 destinations
        var api_call = api + "Destinations/getTopDestinations"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            if (res.status == 401) {
                console.log("unauthorized")
                navigate('/')
            } else {
                setTop3Destinations(await res.json())
            }
        })

        // //Currency
        api_call = api + "Destinations/getCurrency?currencyId=" + user.currencyId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setCurrency(await res.json())
        })

        //Info
        api_call = api + "VacayPlansControllerr/getPlanInfo/" + user.userId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setInfo(await res.json())
            setIsLoading1(false)
        })

        //Plans
        api_call = api + "VacayPlansControllerr/getVacayPlans/" + user.userId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setPlans(await res.json())
            setIsLoading2(false)
        })

    }, [])

    while (isLoading1 == true || isLoading1 == true) {
        return <Loading />
    }

    const viewPlan = (plan, planInfo) => {
        console.log(plan)
        navigate('/viewVacayPlan', {state:{plan: plan, planInfo: planInfo}})
    }

    return (
        <>
            <Header />

            {role == 1 ?
                <div className="container">
                    <div className="home">
                        <h2>Welcome {user.userName}</h2>
                        <hr />
                        <h2>Upcoming vacations</h2>

                        {plans.length == 0 ?
                            <div className="home-no-plans">
                                <h3>No upcoming vacations planned</h3>
                            </div> :
                            <div className="home-plans">
                                {plans.map((plan, idx) => {
                                    var planInfo = info.find(i => i.vacationId == plan.vacationId)

                                    return <div key={idx} onClick={() => viewPlan(plan, planInfo)}><p>Vacation plan for {planInfo.vacayDestName}</p><p>{planInfo.vacayDaysLeft} days left</p></div>
                                })}
                            </div>
                        }

                        <div>
                            <button onClick={() => navigate('/addVacayPlan')}>Add vacation plan</button>
                        </div>

                        <hr />
                        <h2>Explore destination</h2>
                        <div className="home-top-destinations">
                            {top3Destinations.length != 0 ?
                                top3Destinations.map(dest => {
                                    return <div key={dest.destinationId} className="card-ui">
                                        <div className="card-img">
                                            <img src={dest.destinationImage}></img>
                                            <div className="card-rating">
                                                <Rating initialValue={dest.destinationRating} readonly allowFraction size={"20px"}></Rating>
                                            </div>

                                        </div>
                                        <p>{dest.destinationName}</p>
                                        <p>country</p>
                                        <p>{dest.destinationDescription}</p>
                                    </div>
                                }) :
                                <p>No top destination</p>
                            }


                        </div>

                    </div>

                </div>
                :
                <></>
            }

            <Footer />
        </>
    )
}

export default Home